using UnityEngine;
using UnityEngine.UI;
using Shared.ScriptableVariables;
using Code.World_Objects.Staff;

namespace Code.User_Interface.Staff {
  public class StaffActions : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of staff in the given scenario")]
    public GameObjectVariable selectedObject;
    [Header("Output Variables")]
    [Tooltip("Toggles the hired state of the selected staff member")]
    public GameEvent toggleStaffHired;
    [Header("UI Elements")]
    [Tooltip("Button that hires Staff")]
    public Button hireButton;
    [Tooltip("Button that fires Staff")]
    public Button fireButton;

    // ------------------------------------------------------------------------
    void OnEnable() {
      selectedObject.OnValueChanged += UpdateActionsPossible;
      UpdateActionsPossible();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      selectedObject.OnValueChanged -= UpdateActionsPossible;
    }

    // ------------------------------------------------------------------------
    public void ToggleStaffHired() {
      toggleStaffHired?.Raise();
      UpdateActionsPossible();
    }

    // ------------------------------------------------------------------------
    void UpdateActionsPossible() {
      bool canHire = false, canFire = false;
      if (selectedObject.Value != null) {
        var selectedStaff = selectedObject.Value.GetComponent<StaffBehavior>();
        canHire = selectedStaff != null && !selectedStaff.Data.IsCurrentlyHired();
        canFire = selectedStaff != null && selectedStaff.Data.IsCurrentlyHired();
      }
      hireButton.interactable = canHire;
      fireButton.interactable = canFire;
    }
  }
}
