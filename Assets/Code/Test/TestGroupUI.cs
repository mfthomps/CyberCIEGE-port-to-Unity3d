using UnityEngine;
using Code.Game_Events;
using Code.Scriptable_Variables;

namespace Code.Test {
  public class TestGroupUI : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the Groups currently in the scenario.")]
    [SerializeField] private AccessControlGroupListVariable groups;

    // ------------------------------------------------------------------------
    public void SetGroupBackgroundCheckLevel(BackgroundCheckChange change) {
      foreach (var group in groups.Value) {
        if (group.Data.name == change.objectName) {
          group.SetBackgroundCheckLevel(change.level);
        }
      }
    }
  }
}
