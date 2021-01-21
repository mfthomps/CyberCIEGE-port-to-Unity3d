using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.Hardware;

namespace Code.User_Interface.Buy {
  public class HardwareTypeToggle : MonoBehaviour {
    public delegate void HardwareTypeEventHandler();
    public event HardwareTypeEventHandler onHardwareTypeSelected;

    [Header("UI Elements")]
    [Tooltip("Toggle this UI represents")]
    public Toggle toggle;
    [Tooltip("Label for what header type this represents")]
    public TMP_Text label;

    // ------------------------------------------------------------------------
    public void SetHardwareType(HardwareType hardwareType, ToggleGroup toggleGroup) {
      label.text = GetHardwareTypeLabel(hardwareType);
      toggle.group = toggleGroup;
    }

    // ------------------------------------------------------------------------
    public void OnToggle(bool isOn) {
      if (isOn) {
        onHardwareTypeSelected?.Invoke();
      }
    }

    // ------------------------------------------------------------------------
    private string GetHardwareTypeLabel(HardwareType hardwareType) {
      switch (hardwareType) {
        case HardwareType.Office:
          return "OFFICE";
        case HardwareType.Workstations:
          return "WORKSTATIONS";
        case HardwareType.Servers:
          return "SERVERS";
        case HardwareType.NetworkDevices:
          return "NETWORK DEVICES";
        case HardwareType.IDDevice:
          return "ID DEVICES";
      }
      return null;
    }
  }
}
