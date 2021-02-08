using Shared.SEUI;

namespace Code.User_Interface.User {
  public class AssetGoalList : DynamicList<AssetGoalListItem, string> {
    // ------------------------------------------------------------------------
    protected override void OnItemAdded(string item, AssetGoalListItem itemUI) {
      itemUI.SetGoalNumber(listItems.Count);
    }
  }
}
