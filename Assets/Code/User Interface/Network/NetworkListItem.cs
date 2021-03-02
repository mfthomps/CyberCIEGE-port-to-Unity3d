using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.World_Objects.Network;

namespace Code.User_Interface.Network {
  //Represents one selectable Network item in the Network List UI screen
  public class NetworkListItem : SelectableListItem<NetworkBehavior> {
    [Tooltip("Display the item's name")]
    public TMP_Text label;
    [Tooltip("Displays the network's color")]
    public Image colorIcon;
    [Tooltip("The button that controls clicking on this network to toggle its connection state")]
    public Button clickButton;

    [SerializeField] private Toggle toggle;

    //-------------------------------------------------------------------------
    public override void SetItem(NetworkBehavior item) {
      label.text = item.Data.name;
      colorIcon.color = item.Data.color;
    }

    //-------------------------------------------------------------------------
    public void SetInteractable(bool isInteractable) {
      if (clickButton != null ) {
        clickButton.interactable = isInteractable;
      }
      if (toggle) {
        toggle.interactable = isInteractable;
      }
    }
  }
}