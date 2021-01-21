using System.Xml.Linq;
using Code.Factories;
using UnityEngine;
using Code.Hardware;

namespace Code.Temporary {
  // TODO: Integrate into scene clicking logic once that has been implemented
  public class HardwarePlacer : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;

    private string _hardwareToBuy;

    // --------------------------------------------------------------------------
    void Update() {
      // If we get a mouse click when we are trying to buy hardware, see if
      // the user clicked in a valid place to place the hardware
      if (!string.IsNullOrEmpty(_hardwareToBuy) && Input.GetMouseButtonDown(0) && !Input.GetKey(KeyCode.LeftAlt)) {
        TryToPlaceHardware();
      }
    }

    // --------------------------------------------------------------------------
    public void OnBuyHardware(string hardwareID) {
      _hardwareToBuy = hardwareID;
    }

    // --------------------------------------------------------------------------
    private void TryToPlaceHardware() {
      var pt = ccUtils.GetMouseGrid();
      var pos = new Vector3(pt.x, 0, pt.y);
      int xout, yout, roomIndex;
      WorkspaceFactory.FindClosestWorkspaceCenter(out xout, out yout, out roomIndex);
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
