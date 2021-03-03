using System;
using UnityEngine.Events;

namespace Code.User_Interface.Clearance {
  // Represents the list of Clearances in a given scenario
  public class BackgroundCheckList : SelectableList<BackgroundCheckListItem, BackgroundCheck.Level> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<BackgroundCheck.Level> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    void Awake() {
      ClearItems();
      foreach (BackgroundCheck.Level level in Enum.GetValues(typeof(BackgroundCheck.Level))) {
        AddItem(level);
      }
    }

    //-------------------------------------------------------------------------
    public void SetCurrentLevel(BackgroundCheck.Level level) {
      foreach (var listItem in listItems) {
        listItem.Value.SetSelected(listItem.Key == level);
        listItem.Value.SetCost(BackgroundCheck.GetCostDifference(level, listItem.Key));
      }
    }

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(BackgroundCheck.Level item, BackgroundCheckListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}