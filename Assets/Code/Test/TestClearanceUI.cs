using UnityEngine;
using Code.Game_Events;
using Code.Scriptable_Variables;

namespace Code.Test {
  public class TestClearanceUI : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the Clearances currently in the scenario.")]
    [SerializeField] private ClearanceListVariable clearances;

    // ------------------------------------------------------------------------
    public void SetClearanceBackgroundCheckLevel(BackgroundCheckChange change) {
      foreach (var clearance in clearances.Value) {
        if (clearance.Data.name == change.objectName) {
          clearance.SetBackgroundCheckLevel(change.level);
        }
      }
    }
  }
}
