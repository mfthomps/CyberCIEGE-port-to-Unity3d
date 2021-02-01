using Shared.SEUI;

namespace Code.User_Interface {
  //Represents the list of Selectables in the computer configure UI screen.
  public abstract class SelectableList<TDynamicListItem, TValueType> : DynamicList<TDynamicListItem, TValueType> where TDynamicListItem : SelectableListItem<TValueType> {
    //-------------------------------------------------------------------------
    public void SetSelected(TValueType item, bool isSelected) {
      if (listItems.ContainsKey(item)) {
        listItems[item].SetSelected(isSelected);
      }
    }
  }
}