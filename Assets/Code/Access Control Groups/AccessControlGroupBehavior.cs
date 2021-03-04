using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.AccessControlGroup {
  public class AccessControlGroupBehavior : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The users in the current scenario.")]
    [SerializeField] private UserListVariable users;

    public AccessControlGroupDataObject Data { get; set; }

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
