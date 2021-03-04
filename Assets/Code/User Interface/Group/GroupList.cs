using UnityEngine.Events;
using Code.AccessControlGroup;

namespace Code.User_Interface.Group {
  // Represents the list of Groups in a given scenario
  public class GroupList : SelectableList<GroupListItem, AccessControlGroupBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<AccessControlGroupBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(AccessControlGroupBehavior item, GroupListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}