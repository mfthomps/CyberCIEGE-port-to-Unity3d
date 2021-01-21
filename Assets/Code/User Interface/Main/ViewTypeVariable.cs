using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.User_Interface.Main {
  // A ViewType value to share across components, scenes, and prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/View Type")]
  public class ViewTypeVariable : ScriptableVariable<ViewType> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }

    //---------------------------------------------------------------------------
    // TODO: Put in ability to add views to stack and pop them from stack in this function
    public void Back() {
      Reset();
    }
  }

#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(ViewTypeVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class ViewTypeScriptableVariableEditor : ViewTypeVariable.BaseScriptableVariableEditor {
  }
#endif
}
