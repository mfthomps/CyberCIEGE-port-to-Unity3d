using UnityEngine;
using Shared.ScriptableVariables;
using Code.World_Objects.User;

namespace Code.Test {
  public class TestUserUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }

    //---------------------------------------------------------------------------
    public void TrainSelectedUser(int trainingAmount) {
      if (selectedObject.Value != null) {
        var user = selectedObject.Value.GetComponent<UserBehavior>();
        if (user != null) {
          Debug.Log($"Increasing training for {user.Data.user_name} by {trainingAmount}");
        }
      }
    }
  }
}
