using Shared.SEUI;

namespace Code.User_Interface {
  //Represents the list of WorldObjectBehaviors in the computer configure UI screen.
  public abstract class WorldObjectBehaviorList<TDynamicListItem, TValueType> : DynamicList<TDynamicListItem, TValueType> where TDynamicListItem : WorldObjectBehaviorListItem<TValueType> {
    //-------------------------------------------------------------------------
    public void SetSelected(TValueType item, bool isSelected) {
      if (listItems.ContainsKey(item)) {
        listItems[item].SetSelected(isSelected);
      }
    }
  }
}