using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.Clearance {
  public class ClearanceBehavior : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The users in the current scenario.")]
    [SerializeField] private UserListVariable users;

    [SerializeField] private ClearanceDataObject _data;

    public ClearanceDataObject Data {
      get => _data;
      set => _data = value;
    }

    // ------------------------------------------------------------------------
    public void SetBackgroundCheckLevel(BackgroundCheck.Level level) {
      _data.backgroundCheckLevel = level;

      // Update all the user's highest background check level
      foreach (var user in users.Value) {
        user.UpdateHighestBackgroundCheck();
      }
    }
  }
}
