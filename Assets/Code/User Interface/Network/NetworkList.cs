using UnityEngine;
using UnityEngine.Events;
using Code.World_Objects.Network;

namespace Code.User_Interface.Network {
  //Represents the list of Networks in the computer configure UI screen.
  public class NetworkList : WorldObjectBehaviorList<NetworkListItem, NetworkBehavior> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<NetworkBehavior> {}

    [Header("Output Events")]
    [Tooltip("Fired when a network list item is clicked")]
    public ItemClickedEvent onItemClicked;

    //-------------------------------------------------------------------------
    public void SetInteractable(NetworkBehavior item, bool isInteractable) {
      if (listItems.ContainsKey(item)) {
        listItems[item].SetInteractable(isInteractable);
      }
    }

    //-------------------------------------------------------------------------
    protected override void OnItemAdded(NetworkBehavior item, NetworkListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      itemUI.onClicked += () => {
        onItemClicked?.Invoke(item);
      };
    }
  }
}