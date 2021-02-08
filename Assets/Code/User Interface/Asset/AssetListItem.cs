using UnityEngine;
using TMPro;
using Code.World_Objects.Asset;

namespace Code.User_Interface.Asset {
  //Represents one selectable Asset item in the Asset List UI screen
  public class AssetListItem : SelectableListItem<AssetBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text nameLabel;

    //-------------------------------------------------------------------------
    public override void SetItem(AssetBehavior item) {
      this.name = item.Data.AssetName;
      nameLabel.text = item.Data.AssetName;
    }
  }
}