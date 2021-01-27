using System;
using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using Code.World_Objects.Staff;

namespace Code.User_Interface.Staff {
  public class StaffTypeList : DynamicList<StaffTypeListItem, StaffType> {
    public delegate void StaffTypeEventHandler(StaffType type);
    public StaffTypeEventHandler onStaffTypeSelected;

    [Header("UI Elements")]
    [Tooltip("ToggleGroup for StaffTypeListItems")]
    public ToggleGroup toggleGroup;
    [Header("Customization")]
    [Tooltip("Starting staff type to display")]
    public StaffType initialStaffType = StaffType.Tech;

    private StaffType _selectedStaffType;

    // ------------------------------------------------------------------------
    void Awake() {
      _selectedStaffType = initialStaffType;

      ClearItems();
      foreach (StaffType staffType in Enum.GetValues(typeof(StaffType))) {
        if (staffType != StaffType.Invalid) {
          AddItem(staffType);
        }
      }
    }

    // ------------------------------------------------------------------------
    public StaffType GetSelectedType() {
      return _selectedStaffType;
    }

    // ------------------------------------------------------------------------
    protected override void OnItemAdded(StaffType item, StaffTypeListItem itemUI) {
      itemUI.toggle.group = toggleGroup;
      itemUI.toggle.isOn = item == initialStaffType;
      itemUI.toggle.onValueChanged.AddListener(isOn => {
        if (isOn) {
          _selectedStaffType = item;
          onStaffTypeSelected?.Invoke(item);
        }
      });
    }
  }
}
