using UnityEngine.Events;

namespace Code.User_Interface {
  //Represents the list of Components in the computer configure UI screen.
  public class ComponentList : SelectableList<ComponentListItem, ComponentBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<ComponentBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(ComponentBehavior item, ComponentListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}