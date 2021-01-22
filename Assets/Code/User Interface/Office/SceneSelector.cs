using System.Xml.Linq;
using UnityEngine;
using NaughtyAttributes;
using Code.Factories;
using Code.Hardware;

namespace Code.User_Interface.Office {
  public class SceneSelector : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
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
      Ray ray = UnityEngine.Camera.main.ScreenPointToRay(Input.mousePosition);
      RaycastHit hit;

      if (Physics.Raycast(ray, out hit, 100)) {
        //Debug.Log("raycast on " + hit.transform.gameObject.name);
        if (hit.transform.gameObject.name.StartsWith("Computer") ||
            hit.transform.gameObject.name.StartsWith("Device")) {
          ComponentBehavior bh = (ComponentBehavior) hit.transform.gameObject.GetComponent(typeof(ComponentBehavior));

          //computer_canvas.SetActive(true);
          if (hit.transform.gameObject.gameObject.name.StartsWith("Computer")) {
            ComputerBehavior computer_script =
              (ComputerBehavior) hit.transform.gameObject.GetComponent(typeof(ComputerBehavior));
            //computer_script.ConfigureCanvas();
            //clicked = "";
          }

          menus.clicked = "Component:" + bh.Data.component_name;
        }
        else if (hit.transform.gameObject.CompareTag(_userTag)) {
          UserBehavior bh = (UserBehavior) hit.transform.gameObject.GetComponent(typeof(UserBehavior));
          menus.clicked = "User:" + bh.Data.user_name;
        }
      }
    }

    // --------------------------------------------------------------------------
    private void TryToPlaceHardware(Vector2 screenPosition) {
      var pt = ccUtils.GetMouseGrid(screenPosition);
      var pos = new Vector3(pt.x, 0, pt.y);
      int xout, yout, roomIndex;
      WorkspaceFactory.FindClosestWorkspaceCenter(pt, out xout, out yout, out roomIndex);
      if (roomIndex >= 0) {
        var ws = WorkspaceFactory.GetWorkSpace(roomIndex);
        var canBePlacedInRoom = true;
        switch (hardwareCatalog.Value.GetHardwareType(_hardwareToBuy)) {
          case HardwareType.Workstations:
            if (!ws.ComputerRoom()) canBePlacedInRoom = false;
            break;
          case HardwareType.NetworkDevices:
            if (!ws.DeviceRoom()) canBePlacedInRoom = false;
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
