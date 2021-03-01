using System.Xml.Linq;
using UnityEngine;
using NaughtyAttributes;
using Shared.ScriptableVariables;
using Code.Hardware;
using Code.Scriptable_Variables;
using Code.World_Objects.Staff;
using Code.World_Objects.User;

namespace Code.User_Interface.Office {
  public class SceneSelector : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Tooltip("The list of all the currently loaded workspaces")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;
    [Header("Customization")]
    [Tag]
    [Tooltip("The Tag of User GameObjects. Used to click on Users")]
    [SerializeField] private string _userTag;

    private string _hardwareToBuy;

    // ------------------------------------------------------------------------
    public void SelectScene(Vector2 screenPosition) {
      // If we aren't trying to place hardware, then select an object at the given position
      if (string.IsNullOrEmpty(_hardwareToBuy)) {
        TryToSelectObject(screenPosition);
      }
      // Otherwise, place try to place hardware
      else {
        TryToPlaceHardware(screenPosition);
      }
    }

    // --------------------------------------------------------------------------
    public void OnBuyHardware(string hardwareID) {
      _hardwareToBuy = hardwareID;
    }

    // --------------------------------------------------------------------------
    private void TryToSelectObject(Vector2 screenPosition) {
      Ray ray = UnityEngine.Camera.main.ScreenPointToRay(screenPosition);
      var hits = Physics.RaycastAll(ray, 100);
      var clickHandled = false;
      foreach (var hit in hits) {
        // Debug.Log("raycast on " + hit.collider.gameObject.name);
        if (hit.collider.gameObject.GetComponent<SpeechBubble>() != null) {
          var speechBubble = hit.collider.gameObject.GetComponent<SpeechBubble>();
          if (speechBubble.Active) {
            speechBubble.OnClick();
            clickHandled = true;
            break;
          }
        }
        else if (HasSelectableComponent(hit.collider.gameObject)) {
          selectedObject.Value = hit.transform.gameObject;
          clickHandled = true;
          break;
        }
      }
      
      if (!clickHandled) {
        selectedObject.Value = null;
      }
    }

    // --------------------------------------------------------------------------
    private bool HasSelectableComponent(GameObject gameObject) {
      if (gameObject.GetComponent<ComponentBehavior>() != null) {
        return true;
      }
      else if (gameObject.GetComponent<UserBehavior>() != null) {
        return true;
      }
      else if (gameObject.GetComponent<StaffBehavior>() != null) {
        return true;
      }
      return false;
    }

    // --------------------------------------------------------------------------
    private void TryToPlaceHardware(Vector2 screenPosition) {
      var pt = ccUtils.GetMouseGrid(screenPosition);
      var pos = new Vector3(pt.x, 0, pt.y);
      int xout, yout, roomIndex;
      _workSpaceListVariable.FindClosestWorkspaceCenter(pt, out xout, out yout, out roomIndex);
      if (roomIndex >= 0) {
        var ws = _workSpaceListVariable.GetWorkSpace(roomIndex);
        var canBePlacedInRoom = true;
        switch (hardwareCatalog.Value.GetHardwareType(_hardwareToBuy)) {
          case HardwareType.Workstations:
            if (!ws.HaveRoomForComputer()) {
              canBePlacedInRoom = false;
            }
            break;
          case HardwareType.NetworkDevices:
            if (!ws.DeviceRoom()) {
              canBePlacedInRoom = false;
            }
            break;
        }

        if (canBePlacedInRoom) {
          BuyHardware(roomIndex);
        }
      }
    }

    // --------------------------------------------------------------------------
    private void BuyHardware(int roomIndex) {
      var xml = new XElement("componentEvent",
        new XElement("name", ""),
        new XElement("buy",
          new XElement("catalogName", _hardwareToBuy),
          new XElement("position", roomIndex)));

      // Debug.Log(xml.ToString());

      IPCManagerScript.SendRequest(xml.ToString());
      _hardwareToBuy = null;
    }
  }
}
