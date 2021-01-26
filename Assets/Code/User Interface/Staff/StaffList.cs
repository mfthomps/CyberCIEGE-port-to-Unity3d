using UnityEngine.Events;
using Code.World_Objects.Staff;

namespace Code.User_Interface {
  //Represents the list of Staffs in the computer configure UI screen.
  public class StaffList : WorldObjectBehaviorList<StaffListItem, StaffBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<StaffBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(StaffBehavior item, StaffListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}