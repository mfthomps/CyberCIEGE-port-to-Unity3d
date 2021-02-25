using Code.World_Objects.Device;
using UnityEngine;
using TMPro;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Main {
  public class DeviceObjectPropertyPanel : GenericObjectPropertyPanel<DeviceBehavior> {
    [Header("Input Variables")]
    [Tooltip("List of zones in scenario")]
    public ZoneListVariable zones;
    [Header("UI Elements")]
    [Tooltip("Label for selected object's name")]
    public TMP_Text nameLabel;
    [Tooltip("Label for selected device's OS")]
    public TMP_Text osLabel;
    [Tooltip("Label for selected device's hardware")]
    public TMP_Text hardwareLabel;
    [Tooltip("Label for selected device's VPN key type")]
    public TMP_Text vpnKeyTypeLabel;
    [Tooltip("Label for selected device's current zone")]
    public TMP_Text zoneLabel;
    [Tooltip("Label for selected device's current domain")]
    public TMP_Text domainLabel;
    [Tooltip("List for selected device's connected networks")]
    public StringList networkList;

    private DeviceBehavior _displayedDevice;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(DeviceBehavior component) {
      if (_displayedDevice != null) {
        _displayedDevice.OnValueChanged -= UpdateUI;
      }

      _displayedDevice = component;
      _displayedDevice.OnValueChanged += UpdateUI;
      UpdateUI();
    }

    // ------------------------------------------------------------------------
    private void UpdateUI() {
      var deviceDataObject = _displayedDevice.Data as DeviceDataObject;
      var assignedZone = zones.Value.Find(zone => zone.Data.ZoneName == deviceDataObject.zone);

      SetStringProperty(nameLabel, deviceDataObject.component_name, deviceDataObject.hw);
      SetStringProperty(osLabel, deviceDataObject.os);
      SetStringProperty(hardwareLabel, deviceDataObject.hw);
      SetStringProperty(vpnKeyTypeLabel, deviceDataObject.vnpKeyType);
      SetStringProperty(zoneLabel, deviceDataObject.zone);
      SetStringProperty(domainLabel, assignedZone != null ? assignedZone.Data.domain : "Unknown");
      SetStringList(networkList, deviceDataObject.network_list);
    }
  }
}
