using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using TMPro;
using Code.Scriptable_Variables;
using Code.World_Objects.Staff;

namespace Code.User_Interface.Staff {
  public class StaffView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Workload capactiy of tech staff")]
    public IntVariable techCapacityVariable;
    [Tooltip("Workload capactiy of security staff")]
    public IntVariable securityCapacityVariable;
    [Tooltip("List of staff in the given scenario")]
    public StaffListVariable staffListVariable;
    [Header("Output Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;
    [Header("UI Elements")]
    [Tooltip("List of staff types to display")]
    public StaffTypeList staffTypeList;
    [Tooltip("Label for staff capacity at current workload")]
    public TMP_Text capacityLabel;

    [Tooltip("Fill of the Capacity Meter")]
    [SerializeField] private RectTransform capacityFillMeter;
    [Tooltip("List of staff to display")]
    public StaffList staffList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      techCapacityVariable.OnValueChanged += UpdateCapacity;
      securityCapacityVariable.OnValueChanged += UpdateCapacity;
      staffListVariable.OnValueChanged += UpdateDisplayedStaff;
      staffTypeList.onStaffTypeSelected += UpdateDisplayedStaff;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateDisplayedStaff();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      techCapacityVariable.OnValueChanged -= UpdateCapacity;
      securityCapacityVariable.OnValueChanged -= UpdateCapacity;
      staffListVariable.OnValueChanged -= UpdateDisplayedStaff;
      staffTypeList.onStaffTypeSelected -= UpdateDisplayedStaff;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectStaff(StaffBehavior staffBehavior) {
      selectedObject.Value = staffBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    private void UpdateCapacity() {
      int percentage = GetCapacity(staffTypeList.GetSelectedType());
      capacityLabel.text = string.Format("{0}%", percentage);
      capacityFillMeter.transform.localScale = new Vector3((percentage / 100f), 1f, 1f);
    }

    // ------------------------------------------------------------------------
    private void UpdateDisplayedStaff() {
      UpdateDisplayedStaff(staffTypeList.GetSelectedType());
    }

    // ------------------------------------------------------------------------
    private void UpdateDisplayedStaff(StaffType staffTypeToDisplay) {
      UpdateCapacity();

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

    // ------------------------------------------------------------------------
    private int GetCapacity(StaffType staffTypeToDisplay) {
      switch (staffTypeToDisplay) {
        case StaffType.Tech:
          return techCapacityVariable.Value;
        case StaffType.Security:
          return securityCapacityVariable.Value;
      }
      return (techCapacityVariable.Value + securityCapacityVariable.Value) / 2;
    }
  }
}
