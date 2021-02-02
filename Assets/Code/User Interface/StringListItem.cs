using Shared.SEUI;
using TMPro;
using UnityEngine;

namespace Code.User_Interface {
  // Logic class for String Item Selector Item UI
  public class StringListItem : DynamicListItem<string> {
    [Header("UI Elements")]
    [Tooltip("Label for the item's name")]
    public TMP_Text label;

    // ------------------------------------------------------------------------
    public override void SetItem(string item) {
      name = item;
      label.text = item;
    }
  }
}
