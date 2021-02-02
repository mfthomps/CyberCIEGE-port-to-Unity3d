using UnityEngine;
using TMPro;
using Shared.SEUI;

namespace Code.User_Interface.User {
  public class AssetGoalListItem : DynamicListItem<string> {
    [Header("UI Elements")]
    [Tooltip("Label for the asset goal number")]
    public TMP_Text headerLabel;
    [Tooltip("Label for the item's name")]
    public TMP_Text nameLabel;

    // ------------------------------------------------------------------------
    public void SetGoalNumber(int number) {
      headerLabel.text = $"Asset Goal {number}";
      name = headerLabel.text;
    }

    // ------------------------------------------------------------------------
    public override void SetItem(string item) {
      nameLabel.text = item;
    }
  }
}
