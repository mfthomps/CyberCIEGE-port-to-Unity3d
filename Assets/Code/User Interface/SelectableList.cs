using UnityEngine;
using Shared.ScriptableVariables;
using Shared.SEUI;

namespace Code.User_Interface {
  //Represents the list of Selectables in the computer configure UI screen.
  public abstract class SelectableList<TDynamicListItem, TValueType> : DynamicList<TDynamicListItem, TValueType> where TDynamicListItem : SelectableListItem<TValueType> {
    [Tooltip("Event to fire when item is double clicked")]
    public GameEvent itemDoubleClicked;

    //-------------------------------------------------------------------------
    public void SetSelected(TValueType item, bool isSelected) {
      if (listItems.ContainsKey(item)) {
        listItems[item].SetSelected(isSelected);
      }
    }

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(TValueType item, TDynamicListItem itemUI) {
      base.OnItemAdded(item, itemUI);

      // If an item is double clicked, then reset our view to the Office
      itemUI.onDoubleClicked += () => {
        itemDoubleClicked?.Raise();
      };
    }
  }
}