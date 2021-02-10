using UnityEngine;
using UnityEngine.Events;
using Shared.SEUI;
using Code.AccessControlGroup;

namespace Code.User_Interface.AccessControlGroup {
  //Represents the list of Assets in the computer configure UI screen.
  public class DACAccessList : DynamicList<DACAccessListItem, DACAccess> {
    [System.Serializable]
    public class AccessChangedEvent : UnityEvent<DACAccess> {}

    [Header("Output Events")]
    public AccessChangedEvent onClear;
    public AccessChangedEvent onChangeRead;
    public AccessChangedEvent onChangeWrite;
    public AccessChangedEvent onChangeControl;
    public AccessChangedEvent onChangeExecute;

    [Header("Customization")]
    [Tooltip("Can this access list be modified?")]
    public bool interactable;

    // ------------------------------------------------------------------------
    protected override void OnItemAdded(DACAccess item, DACAccessListItem itemUI) {
      itemUI.SetInteractable(interactable);
      itemUI.onClear += () => onClear?.Invoke(item);
      itemUI.onChangeRead += () => onChangeRead?.Invoke(item);
      itemUI.onChangeWrite += () => onChangeWrite?.Invoke(item);
      itemUI.onChangeControl += () => onChangeControl?.Invoke(item);
      itemUI.onChangeExecute += () => onChangeExecute?.Invoke(item);
    }
  }
}