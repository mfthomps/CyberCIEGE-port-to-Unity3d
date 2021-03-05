using UnityEngine;
using UnityEngine.UI;
using TMPro;
using ftUI;
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
    [Tooltip("Tooltip for the ComponentSettingType")]
    public ftTooltip tooltip;
    [SerializeField] private SwapAnimators animatorSwap;

    // ------------------------------------------------------------------------
    public void SetHardwareType(HardwareType hardwareType, ToggleGroup toggleGroup) {
      var labelText = GetHardwareTypeLabel(hardwareType);
      name = labelText;
      label.text = labelText.ToUpper();
      tooltip.TooltipText = labelText;
      toggle.group = toggleGroup;
    }

    // ------------------------------------------------------------------------
    public void OnToggle(bool isOn) {
      if (isOn) {
        onHardwareTypeSelected?.Invoke();
      }

      if (animatorSwap) {
        animatorSwap.IsUsingAlternateAnimator = isOn;
      }
    }

    // ------------------------------------------------------------------------
    private string GetHardwareTypeLabel(HardwareType hardwareType) {
      switch (hardwareType) {
        case HardwareType.Office:
          return "Office";
        case HardwareType.Workstations:
          return "Workstations";
        case HardwareType.Servers:
          return "Servers";
        case HardwareType.NetworkDevices:
          return "Network Devices";
        case HardwareType.IDDevice:
          return "ID Devices";
      }
      return null;
    }
  }
}
