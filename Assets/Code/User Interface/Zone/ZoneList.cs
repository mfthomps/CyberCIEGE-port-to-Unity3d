using UnityEngine.Events;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Zone {
  //Represents the list of Zones in the Zone configure UI screen.
  public class ZoneList : SelectableList<ZoneListItem, ZoneBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<ZoneBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(ZoneBehavior item, ZoneListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}