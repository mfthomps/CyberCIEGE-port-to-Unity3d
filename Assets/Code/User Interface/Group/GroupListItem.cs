using UnityEngine;
using TMPro;
using Code.AccessControlGroup;

namespace Code.User_Interface.Group {
  //Represents one selectable Group item in the Group List UI screen
  public class GroupListItem : SelectableListItem<AccessControlGroupBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField] private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(AccessControlGroupBehavior item) {
      this.name = item.Data.name;
      labelUI.text = item.Data.name;
    }
  }
}