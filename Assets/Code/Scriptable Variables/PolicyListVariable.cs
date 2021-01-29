using UnityEngine;
using Code.Policies;

namespace Code.Scriptable_Variables {
  //Represents a list of Policies. This is typically a static list of Policies for the Game. 
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Policy List")]
  public class PolicyListVariable : ListVariable<Policy> {
    
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
    
    //---------------------------------------------------------------------------
    public Policy GetPolicy(string tag, string subTag) {
      foreach (var policy in Value) {
        // If the tags match and either the policy has no subTag and the incoming subTag is "true"
        // or if the subTags match, then this is the policy we want
        if (policy.tag == tag && ((string.IsNullOrEmpty(policy.subTag) && bool.Parse(subTag)) || policy.subTag == subTag)) {
          return policy;
        }
      }
      return null;
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(PolicyListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class PolicyListVariableVariableEditor : PolicyListVariable.BaseScriptableVariableEditor {
  }
#endif
}