using System;
using System.Collections.Generic;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Scriptable_Variables {
  // A list of string values to share across components, scenes, and prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/StringList")]
  public class StringListVariable : ScriptableVariable<List<string>> {
    
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }

#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(StringListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class StringListScriptableVariableEditor : StringListVariable.BaseScriptableVariableEditor {
  }
#endif
}