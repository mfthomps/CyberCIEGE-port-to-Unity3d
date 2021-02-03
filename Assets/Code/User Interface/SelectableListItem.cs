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
    public virtual void SetSelected(bool isSelected) {
      if (selectionToggle != null) {
        selectionToggle.isOn = isSelected;

        // get the animator from the non-interactable toggle
        Animator animator = selectionToggle.GetComponent<Animator>();

        if (animator) {
          animator.SetBool("Selected", isSelected);
          animator.SetBool("Normal", !isSelected);
        }
      }
    }

    //-------------------------------------------------------------------------
    //Call this when the item should be selected. Usually connected to a UnityEvent 
    //on a button or toggle.
    public void Click() {
      onClicked?.Invoke();
    }

    //-------------------------------------------------------------------------
    protected bool IsSelected() {
      return selectionToggle.isOn;
    }
  }
}