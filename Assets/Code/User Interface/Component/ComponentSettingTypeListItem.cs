using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using TMPro;
using ftUI;

namespace Code.User_Interface.Components {
  public class ComponentSettingTypeListItem : DynamicListItem<ComponentSettingType> {
    [Header("UI Elements")]
    [Tooltip("Label for the ComponentSettingType")]
    public TMP_Text label;
    [Tooltip("Tooltip for the ComponentSettingType")]
    public ftTooltip tooltip;
    [Tooltip("Toggle to select given ComponentSettingType")]
    public Toggle toggle;

    // ------------------------------------------------------------------------
    public override void SetItem(ComponentSettingType item) {
      var labelText = GetLabel(item);
      name = labelText;
      label.text = labelText;
      tooltip.TooltipText = labelText;
    }

    // ------------------------------------------------------------------------
    private string GetLabel(ComponentSettingType type) {
      switch (type) {
        case ComponentSettingType.GeneralSettings:
          return "Settings";
        case ComponentSettingType.Software:
          return "Software";
        case ComponentSettingType.Assets:
          return "Assets";
        case ComponentSettingType.UserGroups:
          return "User Groups";
        case ComponentSettingType.Networks:
          return "Networks";
      }
      return "Unknown!?";
    }
  }
}
