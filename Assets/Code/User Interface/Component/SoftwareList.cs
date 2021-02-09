using UnityEngine.Events;
using Code.Software;

namespace Code.User_Interface.Software {
  //Represents the list of Softwares in the computer configure UI screen.
  public class SoftwareList : SelectableList<SoftwareListItem, SoftwareBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<SoftwareBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(SoftwareBehavior item, SoftwareListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}