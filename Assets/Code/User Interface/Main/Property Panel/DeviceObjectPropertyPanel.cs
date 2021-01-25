using UnityEngine;
using TMPro;

namespace Code.User_Interface.Main {
  public class DeviceObjectPropertyPanel : GenericObjectPropertyPanel<DeviceBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for selected object's name")]
    public TMP_Text nameLabel;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(DeviceBehavior component) {
      nameLabel.text = component.Data.component_name;
    }
  }
}
