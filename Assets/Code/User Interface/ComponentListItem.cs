using UnityEngine;
using TMPro;

namespace Code.User_Interface {
  //Represents one selectable Component item in the Component List UI screen
  public class ComponentListItem : WorldObjectBehaviorListItem<ComponentBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(ComponentBehavior item) {
      labelUI.text = item.Data.component_name;
      this.name = item.Data.component_name;
    }
  }
}