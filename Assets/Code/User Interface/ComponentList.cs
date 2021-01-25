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
    public void SetSelected(ComponentBehavior item, bool isSelected) {
      if (listItems.ContainsKey(item)) {
        listItems[item].SetSelected(isSelected);
      }
    }

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(ComponentBehavior item, ComponentListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.SetLabel(item.Data.component_name);
      itemUI.OnClicked += OnItemClicked;
    }
    
    //-------------------------------------------------------------------------
    private void OnItemClicked(ComponentListItem componentListItem) {
      ItemClicked?.Invoke(componentListItem);
    }
  }
}