using UnityEngine;
using Shared.SEUI;
using TMPro;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Main {
  public class AssetUsageListItem : DynamicListItem<ComputerDataObject.AssetUsage> {
    [Header("UI Elements")]
    [Tooltip("Label for the usage's asset goal")]
    public TMP_Text goalLabel;
    [Tooltip("Label for the amount of asset usage")]
    public TMP_Text usageLabel;

    // ------------------------------------------------------------------------
    public override void SetItem(ComputerDataObject.AssetUsage item) {
      goalLabel.text = item.goalName;
      usageLabel.text = item.usage.ToString();
    }
  }
}
