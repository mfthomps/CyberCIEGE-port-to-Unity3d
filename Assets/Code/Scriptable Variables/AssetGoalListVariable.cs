using UnityEngine;
using Code.AssetGoal;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Asset Goal List")]
  public class AssetGoalListVariable : ListVariable<AssetGoalBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(AssetGoalListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class AssetGoalListVariableVariableEditor : AssetGoalListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}