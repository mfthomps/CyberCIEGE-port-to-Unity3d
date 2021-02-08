using UnityEngine.Events;
using Code.World_Objects.User;

namespace Code.User_Interface.User {
  //Represents the list of Users in the User configure UI screen.
  public class UserList : SelectableList<UserListItem, UserBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<UserBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(UserBehavior item, UserListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}