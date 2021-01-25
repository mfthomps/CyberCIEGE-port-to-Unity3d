using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Shared.SEUI;
using Code.World_Objects.Network;

namespace Code.User_Interface.Network {
  //Represents one selectable Network item in the Network List UI screen
  public class NetworkListItem : DynamicListItem<NetworkBehavior> {
    [Header("UI Elements")]
    [Tooltip("Display the item's name")]
    public TMP_Text label;
    [Tooltip("Displays the network's color")]
    public Image colorIcon;
    [Tooltip("Displays whether the ")]
    public Toggle selectionToggle;

    public delegate void NetworkEventHandler();
    public NetworkEventHandler onClicked;

    //-------------------------------------------------------------------------
    public override void SetItem(NetworkBehavior item) {
      label.text = item.Data.name;
      colorIcon.color = item.Data.color;
    }

    //-------------------------------------------------------------------------
    public void SetSelected(bool isSelected) {
      if (selectionToggle != null ) {
        selectionToggle.isOn = isSelected;
      }
    }

    //-------------------------------------------------------------------------
    public void OnClicked() {
      onClicked?.Invoke();
    }
  }
}