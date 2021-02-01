using UnityEngine;
using TMPro;

namespace Code.User_Interface.Zone {
  public class AccessListItem : SelectableListItem<string> {
    [Header("UI Elements")]
    [Tooltip("Label for the ZoneSettingType")]
    public TMP_Text label;

    // ------------------------------------------------------------------------
    public override void SetItem(string item) {
      label.text = item;
    }
  }
}
