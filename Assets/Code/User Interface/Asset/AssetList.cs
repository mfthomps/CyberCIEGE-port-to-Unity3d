using UnityEngine.Events;
using Code.World_Objects.Asset;

namespace Code.User_Interface.Asset {
  //Represents the list of Assets in the computer configure UI screen.
  public class AssetList : SelectableList<AssetListItem, AssetBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<AssetBehavior> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(AssetBehavior item, AssetListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      
      itemUI.onClicked += () => onItemClicked?.Invoke(item);
    }
  }
}