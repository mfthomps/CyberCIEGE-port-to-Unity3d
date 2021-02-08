using UnityEngine;
using Shared.SEUI;
using TMPro;
using Code.World_Objects.Asset;

namespace Code.User_Interface.Asset {
  //Represents one selectable Asset item in the Asset DAC List UI screen
  public class AssetDACListItem : DynamicListItem<DACAccess> {
    [Header("UI Elements")]
    [Tooltip("The label that should display the item's accessor.")]
    [SerializeField]
    private TMP_Text accessorLabel;
    [Tooltip("The label that should display the item's mode.")]
    [SerializeField]
    private TMP_Text modeLabel;

    //-------------------------------------------------------------------------
    public override void SetItem(DACAccess item) {
      this.name = item.accessor;
      accessorLabel.text = item.accessor;
      modeLabel.text = item.GetMode();
    }
  }
}