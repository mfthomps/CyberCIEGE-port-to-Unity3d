using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.User_Interface.MainMenu {
  // A ViewType value to share across components, scenes, and prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/View Type")]
  public class ViewTypeVariable : ScriptableVariable<ViewType> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
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
