using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;
using Code.World_Objects.Staff;

namespace Code.User_Interface.Staff {
  public class StaffView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of staff in the given scenario")]
    public StaffListVariable staffListVariable;
    [Header("Output Variables")]
    [Tooltip("List of staff in the given scenario")]
    public GameObjectVariable selectedObject;
    [Header("UI Elements")]
    [Tooltip("List of staff types to display")]
    public StaffTypeList staffTypeList;
    [Tooltip("List of staff to display")]
    public StaffList staffList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      staffListVariable.OnValueChanged += UpdateDisplayedStaff;
      staffTypeList.onStaffTypeSelected += UpdateDisplayedStaff;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateDisplayedStaff();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      staffListVariable.OnValueChanged -= UpdateDisplayedStaff;
      staffTypeList.onStaffTypeSelected -= UpdateDisplayedStaff;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectStaff(StaffBehavior staffBehavior) {
      selectedObject.Value = staffBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    private void UpdateDisplayedStaff() {
      UpdateDisplayedStaff(staffTypeList.GetSelectedType());
    }

    // ------------------------------------------------------------------------
    private void UpdateDisplayedStaff(StaffType staffTypeToDisplay) {
      var staffToDisplay = new List<StaffBehavior>();
      foreach (var staff in staffListVariable.Value) {
        if (staffTypeToDisplay == StaffType.All || staff.Data.type == staffTypeToDisplay) {
          staffToDisplay.Add(staff);
        }
      }
      staffList.SetItems(staffToDisplay);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var staff in staffListVariable.Value) {
        if (staff != null) {
          staffList.SetSelected(staff, staff.gameObject == selectedObject.Value);
        }
      }
    }
  }
}
