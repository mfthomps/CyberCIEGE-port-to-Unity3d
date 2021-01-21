using System;
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
      label.text = Enum.GetName(typeof(HardwareType), hardwareType);
      toggle.group = toggleGroup;
    }

    // ------------------------------------------------------------------------
    public void OnToggle(bool isOn) {
      if (isOn) {
        onHardwareTypeSelected?.Invoke();
      }
    }
  }
}
