using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using TMPro;

namespace Code.User_Interface.Zone {
  public class ZoneSettingTypeListItem : DynamicListItem<ZoneSettingType> {
    [Header("UI Elements")]
    [Tooltip("Label for the ZoneSettingType")]
    public TMP_Text label;
    [Tooltip("Toggle to select given ZoneSettingType")]
    public Toggle toggle;

    // ------------------------------------------------------------------------
    public override void SetItem(ZoneSettingType item) {
      label.text = GetLabel(item);
    }

    // ------------------------------------------------------------------------
    private string GetLabel(ZoneSettingType type) {
      switch (type) {
        case ZoneSettingType.GeneralSettings:
          return "Zone Settings";
        case ZoneSettingType.DefaultComponent:
          return "Default Component Settings";
      }
      return "Unknown!?";
    }
  }
}
