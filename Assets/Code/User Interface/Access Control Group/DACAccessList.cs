using UnityEngine.Events;
using Shared.SEUI;
using Code.AccessControlGroup;

namespace Code.User_Interface.AccessControlGroup {
  //Represents the list of Assets in the computer configure UI screen.
  public class DACAccessList : DynamicList<DACAccessListItem, DACAccess> {
    [System.Serializable]
    public class AccessChangedEvent : UnityEvent<DACAccess> {}

    public AccessChangedEvent onChangeRead;
    public AccessChangedEvent onChangeWrite;
    public AccessChangedEvent onChangeControl;
    public AccessChangedEvent onChangeExecute;

    // ------------------------------------------------------------------------
    protected override void OnItemAdded(DACAccess item, DACAccessListItem itemUI) {
      itemUI.onChangeRead += () => onChangeRead?.Invoke(item);
      itemUI.onChangeWrite += () => onChangeWrite?.Invoke(item);
      itemUI.onChangeControl += () => onChangeControl?.Invoke(item);
      itemUI.onChangeExecute += () => onChangeExecute?.Invoke(item);
    }
  }
}