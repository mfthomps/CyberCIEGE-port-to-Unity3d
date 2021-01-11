using Shared.SEUI;
using UnityEngine.Events;

namespace Code.User_Interface {
  [System.Serializable]
  public class ItemClickedEvent : UnityEvent<ComponentListItem> {}
  
  //Represents the list of Components in the computer configure UI screen.
  public class ComponentList : DynamicList<ComponentListItem, ComponentBehavior> {
    //Called when an Item in the list has been selected
    public ItemClickedEvent ItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(ComponentBehavior item, ComponentListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.SetLabel(item.component_name);
      itemUI.OnClicked += OnItemClicked;
    }
    
    //-------------------------------------------------------------------------
    private void OnItemClicked(ComponentListItem componentListItem) {
      ItemClicked?.Invoke(componentListItem);
    }
  }
}