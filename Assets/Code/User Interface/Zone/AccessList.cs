using UnityEngine.Events;

namespace Code.User_Interface.Zone {
  // A list of entities that have access to something
  public class AccessList : SelectableList<AccessListItem, string> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<string> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(string item, AccessListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}
