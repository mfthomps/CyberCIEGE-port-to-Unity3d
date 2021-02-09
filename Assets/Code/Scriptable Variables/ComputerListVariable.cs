using UnityEngine;
using Code.World_Objects.Computer;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Computer List")]
  public class ComputerListVariable : ListVariable<ComputerBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(ComputerListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class ComputerListVariableVariableEditor : ComputerListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}