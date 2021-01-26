using Shared.SEUI;
using UnityEngine;
using UnityEngine.Events;
using Code.World_Objects.Network;

namespace Code.User_Interface.Network {
  [System.Serializable]
  public class NetworkEvent : UnityEvent<NetworkBehavior> {}
  
  //Represents the list of Networks in the computer configure UI screen.
  public class NetworkList : DynamicList<NetworkListItem, NetworkBehavior> {
    [Header("Output Events")]
    [Tooltip("Fired when a network connection should be toggled")]
    public NetworkEvent toggleNetwork;

    //-------------------------------------------------------------------------
    public void SetSelected(NetworkBehavior item, bool isSelected) {
      if (listItems.ContainsKey(item)) {
        listItems[item].SetSelected(isSelected);
      }
    }

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
        toggleNetwork?.Invoke(item);
      };
    }
  }
}