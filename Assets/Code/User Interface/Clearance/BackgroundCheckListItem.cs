using UnityEngine;
using TMPro;

namespace Code.User_Interface.Clearance {
  //Represents one selectable Clearance item in the BackgroundCheck List UI screen
  public class BackgroundCheckListItem : SelectableListItem<BackgroundCheck.Level> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField] private TMP_Text nameLabel;
    [Tooltip("The element that should display the item's cost string.")]
    [SerializeField] private TMP_Text costLabel;

    //-------------------------------------------------------------------------
    public override void SetItem(BackgroundCheck.Level item) {
      this.name = BackgroundCheck.ToString(item);
      nameLabel.text = BackgroundCheck.ToString(item);
    }

    //-------------------------------------------------------------------------
    public void SetCost(int cost) {
      costLabel.text = string.Format("{0:C}", cost);
    }
  }
}