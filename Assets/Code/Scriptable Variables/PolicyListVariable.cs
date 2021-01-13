using UnityEngine;

namespace Code.Scriptable_Variables {
  //Represents a list of Policies. This is typically a static list of Policies for the Game. 
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Policy List")]
  public class PolicyListVariable : ListVariable<Policy.Policy> {
    
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
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