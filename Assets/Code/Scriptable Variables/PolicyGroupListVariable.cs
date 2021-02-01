using UnityEngine;
using Code.Policies;

namespace Code.Scriptable_Variables {
  //Represents a list of Policy Groups. This is typically a static list of Policy Groups for the Game. 
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Policy Group List")]
  public class PolicyGroupListVariable : ListVariable<PolicyGroup> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }

    //---------------------------------------------------------------------------
    public PolicyGroup GetContainingPolicyGroup(Policy policy) {
      foreach (var group in Value) {
        if (group.policies.Contains(policy)) {
          return group;
        }
      }
      return null;
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(PolicyGroupListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class PolicyGroupListVariableVariableEditor : PolicyGroupListVariable.BaseScriptableVariableEditor {
  }
#endif
}