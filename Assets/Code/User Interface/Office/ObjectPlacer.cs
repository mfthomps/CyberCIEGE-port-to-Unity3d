using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Hardware;
using Code.Scriptable_Variables;
using Code.World_Objects.Workspace;

namespace Code.User_Interface.Office {
  // Class that helps a user figure out where something being bought from
  // the Buy View is going to be placed
  public class ObjectPlacer : MonoBehaviour {
    [Header("Output Events")]
    [Tooltip("Event fired with the ID of the hardware the player wants to buy")]
    public StringGameEvent onBuyHardware;
    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Tooltip("The list of all the currently loaded workspaces")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;
    [Header("UI Elements")]
    [Tooltip("The GameObject to show the ghost hardware")]
    public GameObject ghostMesh;
    [Tooltip("The mesh filter to show the ghost hardware")]
    public MeshFilter ghostMeshFilter;
    [Tooltip("The mesh renderer to show the ghost hardware")]
    public MeshRenderer ghostMeshRenderer;
    [Tooltip("The Transform to show which workplace an object will be placed in")]
    public WorkspaceHighlighter workspaceHighlight;
    [Header("Customization")]
    [Tooltip("How far up off the ground to put the ghost mesh")]
    public float meshHeightOffGround = 0.0f;

    private Plane _groundPlane = new Plane(Vector3.up, Vector3.zero);
    private string _hardwareToBuy;

    // --------------------------------------------------------------------------
    void Awake() {
      OnBuyHardware(null);
    }

    // --------------------------------------------------------------------------
    void Update() {
      // Move our ghost mesh to be where the mouse is
      _groundPlane.SetNormalAndPosition(Vector3.up, Vector3.zero + Vector3.up * meshHeightOffGround);
      var ray = UnityEngine.Camera.main.ScreenPointToRay(Input.mousePosition);
      float hitDistance;
      if (_groundPlane.Raycast(ray, out hitDistance)) {
        var hitPoint = ray.GetPoint(hitDistance);
        ghostMesh.transform.position = hitPoint;
      }

      // Move the workspace highlighter
      var workspaceIndex = GetNearestWorkspaceIndex(Input.mousePosition);
      if (workspaceIndex > -1) {
        var ws = _workSpaceListVariable.GetWorkSpace(workspaceIndex);
        workspaceHighlight.SetPosition(ws.x, ws.y);
        if (CanPlaceInWorkspace(workspaceIndex, _hardwareToBuy)) {
          workspaceHighlight.SetAvailable();
        }
        else {
          workspaceHighlight.SetUnavailable();
        }
        workspaceHighlight.ToggleActive(true);
      }
      else {
        workspaceHighlight.ToggleActive(false);
      }
    }

    // --------------------------------------------------------------------------
    public void OnBuyHardware(string hardwareID) {
      _hardwareToBuy = hardwareID;
      enabled = !string.IsNullOrEmpty(hardwareID);

      if (enabled) {
        var hardwareAsset = hardwareCatalog.Value.GetHardwareAsset(hardwareID);
        ghostMeshFilter.mesh = hardwareAsset.mesh;
        ghostMeshRenderer.material = hardwareAsset.material;
      }
      ghostMesh.SetActive(enabled);
      workspaceHighlight.ToggleActive(enabled);
    }

    // ------------------------------------------------------------------------
    public void SelectScene(Vector2 screenPosition) {
      // If we are enabled, then we are trying to place some hardware
      if (enabled) {
        TryToPlaceHardware(screenPosition);
      }
    }

    // --------------------------------------------------------------------------
    private void TryToPlaceHardware(Vector2 screenPosition) {
      // Get the nearest workspace and see if we can place the hardware in it
      var workspaceIndex = GetNearestWorkspaceIndex(screenPosition);
      if (CanPlaceInWorkspace(workspaceIndex, _hardwareToBuy)) {
        // Tell the server to buy the hardware in the closest workspace
        var xml = new XElement("componentEvent",
          new XElement("name", ""),
          new XElement("buy",
            new XElement("catalogName", _hardwareToBuy),
            new XElement("position", workspaceIndex)));

        IPCManagerScript.SendRequest(xml.ToString());
      }
      // Whether we succeed or fail, end the hardware buying process
      onBuyHardware?.Raise(null);
    }

    // --------------------------------------------------------------------------
    private int GetNearestWorkspaceIndex(Vector2 screenPosition) {
      var pt = ccUtils.GetMouseGrid(screenPosition);
      var pos = new Vector3(pt.x, 0, pt.y);
      int xout, yout, workspaceIndex;
      _workSpaceListVariable.FindClosestWorkspaceCenter(pt, out xout, out yout, out workspaceIndex);
      return workspaceIndex;
    }

    // --------------------------------------------------------------------------
    private bool CanPlaceInWorkspace(int workspaceIndex, string hardwareID) {
      if (workspaceIndex >= 0) {
        var ws = _workSpaceListVariable.GetWorkSpace(workspaceIndex);
        switch (hardwareCatalog.Value.GetHardwareType(hardwareID)) {
          case HardwareType.Workstations:
            if (ws.HaveRoomForComputer()) {
              return true;
            }
            break;
          case HardwareType.NetworkDevices:
            if (ws.DeviceRoom()) {
              return true;
            }
            break;
        }
      }
      return false;
    }
  }
}
