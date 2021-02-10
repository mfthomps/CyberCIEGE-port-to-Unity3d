using UnityEngine.Events;

namespace Code.User_Interface {
  //Represents the list of SelectableStrings in the computer configure UI screen.
  public class SelectableStringList : SelectableList<SelectableStringListItem, string> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<string> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(string item, SelectableStringListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}