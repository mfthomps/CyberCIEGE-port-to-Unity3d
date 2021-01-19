using System.Collections.Generic;
using Shared.SEUI;
using UnityEngine;
using UnityEngine.UI;

namespace Code.User_Interface {
  // Logic class for String Item Selector UI
  public abstract class StringItemSelector : DynamicList<StringItemSelectorItem, string> {
    [Header("UI Elements")]
    [Tooltip("Toggle group for campaign ")]
    public ToggleGroup toggleGroup;

    // ------------------------------------------------------------------------
    protected virtual void Awake() {
      ResetList();
    }

    // ------------------------------------------------------------------------
    protected void ResetList() {
      if (CanSetItems()) {
        SetItems(GetItems());
      }
      else {
        ClearItems();
      }
    }

    // ------------------------------------------------------------------------
    protected override void OnItemAdded(string item, StringItemSelectorItem itemUI) {
      // Set the item's toggle group
      itemUI.SetToggleGroup(toggleGroup);

      // Set the item's interactability based on if the campaign is unlocked
      itemUI.SetInteractable(IsItemInteractable(item));

      // Select the item if it was previously selected before a list reset
      itemUI.SetSelected(IsItemSelected(item));

      // Start listening to the toggle's value change
      itemUI.toggle.onValueChanged.AddListener((isOn) => {
        if (isOn) {
          ItemSelected(item);
        }
      });
    }

    // ------------------------------------------------------------------------
    protected abstract bool CanSetItems();

    // ------------------------------------------------------------------------
    protected abstract List<string> GetItems();

    // ------------------------------------------------------------------------
    protected abstract bool IsItemInteractable(string item);

    // ------------------------------------------------------------------------
    protected abstract bool IsItemSelected(string item);

    // ------------------------------------------------------------------------
    protected abstract void ItemSelected(string item);
  }
}
