using System;
using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using Code.World_Objects.Staff;
using TMPro;

namespace Code.User_Interface.Staff {
  public class StaffTypeListItem : DynamicListItem<StaffType> {
    [Header("UI Elements")]
    [Tooltip("Label for the StaffType")]
    public TMP_Text label;
    [Tooltip("Toggle to select given StaffType")]
    public Toggle toggle;

    // ------------------------------------------------------------------------
    public override void SetItem(StaffType item) {
      label.text = Enum.GetName(typeof(StaffType), item);
    }
  }
}
