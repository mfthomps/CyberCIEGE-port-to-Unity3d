using UnityEngine;
using Code.AccessControlGroup;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Access Control Group List")]
  public class AccessControlGroupListVariable : ListVariable<AccessControlGroupBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(AccessControlGroupListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class AccessControlGroupListVariableVariableEditor : AccessControlGroupListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}