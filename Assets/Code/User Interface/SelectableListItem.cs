using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;

namespace Code.User_Interface {
  //Represents one selectable Selectable item in a Selectable List
  public abstract class SelectableListItem<T> : DynamicListItem<T> {
    [Header("UI Elements")]
    [Tooltip("The element that should display the item's label string.")]
    public Toggle selectionToggle;

    //called when this item has been clicked
    public delegate void OnClickedDelegate();
    public OnClickedDelegate onClicked;

    //-------------------------------------------------------------------------
    public void SetSelected(bool isSelected) {
      if (selectionToggle != null) {
        selectionToggle.isOn = isSelected;
      }
    }

    //-------------------------------------------------------------------------
    //Call this when the item should be selected. Usually connected to a UnityEvent 
    //on a button or toggle.
    public void Click() {
      onClicked?.Invoke();
    }
  }
}