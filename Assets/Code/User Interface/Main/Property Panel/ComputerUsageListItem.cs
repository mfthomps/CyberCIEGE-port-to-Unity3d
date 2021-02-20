using UnityEngine;
using Shared.SEUI;
using TMPro;

namespace Code.User_Interface.Main {
  public class ComputerUsageListItem : DynamicListItem<ComputerUsage> {
    [Header("UI Elements")]
    [Tooltip("Label for the user involved in this usage")]
    public TMP_Text userLabel;
    [Tooltip("List of asset goals being used by this computer")]
    public AssetUsageList assetUsageList;

    // ------------------------------------------------------------------------
    public override void SetItem(ComputerUsage item) {
      userLabel.text = item.user;
      assetUsageList.SetItems(item.usages);
    }
  }
}
