using UnityEngine;
using TMPro;

namespace Code.User_Interface {
  //Represents one selectable SelectableString item in the SelectableString List UI screen
  public class SelectableStringListItem : SelectableListItem<string> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(string item) {
      labelUI.text = item;
      this.name = item;
    }
  }
}