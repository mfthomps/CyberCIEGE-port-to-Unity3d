using UnityEngine;
using TMPro;
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
        if (zones.GetZone(computer) == item) {
          networkableList.AddItem(computer);
        }
      }
      // Add all the devices that are in this zone
      foreach (var device in devices.Value) {
        if (zones.GetZone(device) == item) {
          networkableList.AddItem(device);
        }
      }

      // If we don't have any devices, then hide ourselves
      gameObject.SetActive(networkableList.listItems.Count > 0);
    }
  }
}
