using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Shared.SEUI;

namespace Code.User_Interface {
  //Represents one selectable Component item in the Component List UI screen
  public class ComponentListItem : DynamicListItem<ComponentBehavior> {
    [Header("UI Elements")]
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;
    [Tooltip("The element that should display the item's label string.")]
    public Toggle selectionToggle;

    public delegate void OnClickedDelegate(ComponentListItem item);
    
    //called when this item has been clicked
    public OnClickedDelegate OnClicked;

    private ComponentBehavior _item;

    //-------------------------------------------------------------------------
    public void SetLabel(string label) {
      labelUI.text = label;
      this.name = label;
    }
    
    //-------------------------------------------------------------------------
    public override void SetItem(ComponentBehavior item) {
      _item = item;
    }

    //-------------------------------------------------------------------------
    public ComponentBehavior GetItem() {
      return _item;
    }

    //-------------------------------------------------------------------------
    public void SetSelected(bool isSelected) {
      if (selectionToggle != null ) {
        selectionToggle.isOn = isSelected;
      }
    }

    //-------------------------------------------------------------------------
    //Call this when the item should be selected. Usually connected to a UnityEvent 
    //on a button or toggle.
    public void Click() {
      OnClicked?.Invoke(this);
    }
  }
}