using Shared.SEUI;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Code.User_Interface {
  // Logic class for String Item Selector Item UI
  public class StringItemSelectorItem : DynamicListItem<string> {
    [Header("UI Elements")]
    [Tooltip("Label for the item's name")]
    public TMP_Text label;
    [Tooltip("Toggle for selecting this item")]
    public Toggle toggle;

    [SerializeField] private SwapAnimators animatorSwap;

    // ------------------------------------------------------------------------
    public override void SetItem(string item) {
      label.text = item;
    }

    // ------------------------------------------------------------------------
    public void SetToggleGroup(ToggleGroup group) {
      toggle.group = group;
    }

    // ------------------------------------------------------------------------
    public void SetInteractable(bool interactable) {
      toggle.interactable = interactable;
    }

    // ------------------------------------------------------------------------
    public void SetSelected(bool isOn) {
      toggle.isOn = isOn;

      if (animatorSwap) {
        animatorSwap.IsUsingAlternateAnimator = toggle.isOn;
      }
    }
  }
}
