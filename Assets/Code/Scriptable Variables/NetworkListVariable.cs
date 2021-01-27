using UnityEngine;
using Code.World_Objects.Network;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Network List")]
  public class NetworkListVariable : ListVariable<NetworkBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(NetworkListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class NetworkListVariableVariableEditor : NetworkListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}