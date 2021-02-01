using UnityEngine;
using Code.World_Objects.User;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/User List")]
  public class UserListVariable : ListVariable<UserBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }

#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(UserListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class UserListVariableVariableEditor : UserListVariable.BaseScriptableVariableEditor {
  }
#endif
}