using Code.World_Objects.Device;
using UnityEngine;
using TMPro;

namespace Code.User_Interface.Main {
  public class DeviceObjectPropertyPanel : GenericObjectPropertyPanel<DeviceBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for selected object's name")]
    public TMP_Text nameLabel;
    [Tooltip("Label for selected device's OS")]
    public TMP_Text osLabel;
    [Tooltip("Label for selected device's hardware")]
    public TMP_Text hardwareLabel;
    [Tooltip("Label for selected device's VPN key type")]
    public TMP_Text vpnKeyTypeLabel;
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

      SetStringProperty(nameLabel, deviceDataObject.component_name, deviceDataObject.hw);
      SetStringProperty(osLabel, deviceDataObject.os);
      SetStringProperty(hardwareLabel, deviceDataObject.hw);
      SetStringProperty(vpnKeyTypeLabel, deviceDataObject.vnpKeyType);
      SetStringList(networkList, deviceDataObject.network_list);
    }
  }
}
