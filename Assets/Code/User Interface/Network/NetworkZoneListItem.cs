using UnityEngine;
using TMPro;
// using Vectrosity;
using Shared.SEUI;
using Code.Scriptable_Variables;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Network {
  public class NetworkZoneListItem : DynamicListItem<ZoneBehavior> {
    [Header("Input Variables")]
    [Tooltip("List of computers in the scenario")]
    public ComputerListVariable computers;
    [Tooltip("List of devices in the scenario")]
    public DeviceListVariable devices;
    [Tooltip("List of zones in the scenario")]
    public ZoneListVariable zones;
    [Header("UI Elements")]
    [Tooltip("Label for the zone this item represents")]
    public TMP_Text zoneLabel;
    [Tooltip("Temporary list of all networkable devices (REMOVE ONCE NETWORK GRAPH IS IMPLEMENTED)")]
    public ComponentList networkableList;

    // ------------------------------------------------------------------------
    public override void SetItem(ZoneBehavior item) {
      zoneLabel.text = $"Zone: {item.Data.ZoneName}";

      networkableList.ClearItems();
      // Add all the computers that are in this zone
      foreach (var computer in computers.Value) {
        if (computer.Data.zone == item.Data.ZoneName) {
          networkableList.AddItem(computer);
        }
      }
      // Add all the devices that are in this zone
      foreach (var device in devices.Value) {
        if (device.Data.zone == item.Data.ZoneName) {
          networkableList.AddItem(device);
        }
      }

      // If we don't have any devices, then hide ourselves
      gameObject.SetActive(networkableList.listItems.Count > 0);

      // Try drawing a line
      var rect = (transform as RectTransform).rect;
      Vector2 transformPosition = transform.position;
      // var line = VectorLine.SetLine(Color.white, transformPosition + Vector2.zero, transformPosition + new Vector2(rect.width, rect.height));
    }
  }
}
