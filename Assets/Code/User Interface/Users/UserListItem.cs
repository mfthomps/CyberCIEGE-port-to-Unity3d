using UnityEngine;
using TMPro;
using Code.World_Objects.User;

namespace Code.User_Interface.User {
  //Represents one selectable User item in the User List UI screen
  public class UserListItem : SelectableListItem<UserBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(UserBehavior item) {
      this.name = item.Data.user_name;
      labelUI.text = item.Data.user_name;
    }
  }
}