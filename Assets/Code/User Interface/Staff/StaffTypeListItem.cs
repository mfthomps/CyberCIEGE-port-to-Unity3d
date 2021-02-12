using System;
using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using Code.World_Objects.Staff;
using TMPro;

namespace Code.User_Interface.Staff {
  public class StaffTypeListItem : DynamicListItem<StaffType> {
    [Header("Input Variables")]
    [Tooltip("The map of StaffType to icon Sprites")]
    public StaffTypeIconMap staffTypeIconMap;
    [Header("UI Elements")]
    [Tooltip("Icon for the StaffType")]
    public Image icon;
    [Tooltip("Label for the StaffType")]
    public TMP_Text label;
    [Tooltip("Toggle to select given StaffType")]
    public Toggle toggle;

    [SerializeField] private SwapAnimators animatorSwap;

    // ------------------------------------------------------------------------
    public override void SetItem(StaffType item) {
      icon.sprite = staffTypeIconMap.GetStaffTypeIcon(item);
      if (icon.sprite == null) {
        icon.gameObject.SetActive(false);
      }
      label.text = Enum.GetName(typeof(StaffType), item);
    }

    // ------------------------------------------------------------------------
    public void OnToggle(bool isOn) {
      
      if (animatorSwap) {
        animatorSwap.IsUsingAlternateAnimator = isOn;
      }
    }
  }
}
