using UnityEngine;
using Shared.ScriptableVariables;
using Code.World_Objects.Staff;

namespace Code.Test {
  public class TestStaffUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Tooltip("List of staff in the given scenario")]
    public IntVariable techCapacityVariable;
    [Tooltip("List of staff in the given scenario")]
    public IntVariable securityCapacityVariable;

    // ------------------------------------------------------------------------
    void Start() {
      techCapacityVariable.Value = 50;
      securityCapacityVariable.Value = 100;
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
      techCapacityVariable.Reset();
      securityCapacityVariable.Reset();
    }

    // ------------------------------------------------------------------------
    public void ToggleStaffHired() {
      if (selectedObject.Value != null) {
        var staff = selectedObject.Value.GetComponent<StaffBehavior>();
        if (staff != null) {
          staff.SetHired(!staff.Data.IsCurrentlyHired());
        }
      }
    }
  }
}
