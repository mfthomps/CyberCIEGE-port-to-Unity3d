using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using TMPro;
using ftUI;

namespace Code.User_Interface.Zone {
  public class ZoneSettingTypeListItem : DynamicListItem<ZoneSettingType> {
    [Header("UI Elements")]
    [Tooltip("Label for the ZoneSettingType")]
    public TMP_Text label;
    [Tooltip("Tooltip for the ComponentSettingType")]
    public ftTooltip tooltip;
    [Tooltip("Toggle to select given ZoneSettingType")]
    public Toggle toggle;

    // ------------------------------------------------------------------------
    public override void SetItem(ZoneSettingType item) {
      var labelText = GetLabel(item);
      name = labelText;
      label.text = labelText;
      tooltip.TooltipText = labelText;
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
