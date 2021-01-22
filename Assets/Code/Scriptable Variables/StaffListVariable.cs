using UnityEngine;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Staff List")]
  public class StaffListVariable : ListVariable<StaffBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
    
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(StaffListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class StaffListVariableVariableEditor : StaffListVariable.BaseScriptableVariableEditor {
  }
#endif
}