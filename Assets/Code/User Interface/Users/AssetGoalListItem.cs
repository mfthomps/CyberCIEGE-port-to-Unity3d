using UnityEngine;
using TMPro;
using Shared.SEUI;
using Code.Scriptable_Variables;

namespace Code.User_Interface.User {
  public class AssetGoalListItem : DynamicListItem<string> {
    [Header("Input Variables")]
    [Tooltip("List of asset goals for the current scenario")]
    public AssetGoalListVariable assetGoals;
    [Header("UI Elements")]
    [Tooltip("Label for the asset goal number")]
    public TMP_Text headerLabel;
    [Tooltip("Label for the item's name")]
    public TMP_Text nameLabel;
    [Tooltip("Label for the item's description")]
    public TMP_Text descriptionLabel;

    // ------------------------------------------------------------------------
    public void SetGoalNumber(int number) {
      headerLabel.text = $"Asset Goal {number}";
      name = headerLabel.text;
    }

    // ------------------------------------------------------------------------
    public override void SetItem(string item) {
      var assetGoal = assetGoals.Value.Find(goal => goal.Data.name == item);
      if (assetGoal != null) {
        nameLabel.text = assetGoal.Data.name;
        descriptionLabel.text = assetGoal.Data.description;
      }
    }
  }
}
