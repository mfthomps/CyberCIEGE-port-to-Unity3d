using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Code.User_Interface {
  //Represents one selectable Component item in the Component List UI screen
  public class ComponentListItem : SelectableListItem<ComponentBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;
    
    [Tooltip("The button that controls clicking on this network to toggle its connection state")]
    public Button clickButton;

    //-------------------------------------------------------------------------
    public override void SetItem(ComponentBehavior item) {
      labelUI.text = item.Data.component_name;
      this.name = item.Data.component_name;
    }

    public void Click () {
      base.Click();

      SetSelected(true);

      Debug.Log("Click");
    }
  }
}