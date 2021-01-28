using UnityEngine.Events;

namespace Code.User_Interface.Components {
  //Represents the list of Computers in the computer configure UI screen.
  public class ComputerList : SelectableList<ComputerListItem, ComputerBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<ComputerBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(ComputerBehavior item, ComputerListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}