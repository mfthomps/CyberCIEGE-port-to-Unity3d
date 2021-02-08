using UnityEngine;
using Code.Clearance;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Clearance List")]
  public class ClearanceListVariable : ListVariable<ClearanceBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(ClearanceListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class ClearanceListVariableVariableEditor : ClearanceListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}