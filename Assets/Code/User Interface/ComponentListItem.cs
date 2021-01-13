using Shared.SEUI;
using TMPro;
using UnityEngine;

namespace Code.User_Interface {
  //Represents one selectable Component item in the Component List UI screen
  public class ComponentListItem : DynamicListItem<ComponentBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;

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
    //Call this when the item should be selected. Usually connected to a UnityEvent 
    //on a button or toggle.
    public void Click() {
      OnClicked?.Invoke(this);
    }
  }
}