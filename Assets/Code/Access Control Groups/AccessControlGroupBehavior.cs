using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.AccessControlGroup {
  public class AccessControlGroupBehavior : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The users in the current scenario.")]
    [SerializeField] private UserListVariable users;

    [SerializeField] private AccessControlGroupDataObject _data;

    public AccessControlGroupDataObject Data {
      get => _data;
      set => _data = value;
    }

    // ------------------------------------------------------------------------
    public void SetBackgroundCheckLevel(BackgroundCheck.Level level) {
      Data.backgroundCheckLevel = level;

      // Update all the user's highest background check level
      foreach (var user in users.Value) {
        user.UpdateHighestBackgroundCheck();
      }
    }
  }
}
