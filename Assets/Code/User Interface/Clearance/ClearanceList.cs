using UnityEngine.Events;
using Code.Clearance;

namespace Code.User_Interface.Clearance {
  // Represents the list of Clearances in a given scenario
  public class ClearanceList : SelectableList<ClearanceListItem, ClearanceBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<ClearanceBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(ClearanceBehavior item, ClearanceListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}