using UnityEngine;
using Code.Software;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Software List")]
  public class SoftwareListVariable : ListVariable<SoftwareBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(SoftwareListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class SoftwareListVariableVariableEditor : SoftwareListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}