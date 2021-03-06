﻿using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.Hardware {
  // A HardwareCatalog value to share across components, scenes, and prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Hardware Catalog")]
  public class HardwareCatalogVariable : ScriptableVariable<HardwareCatalog> {

    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }

#if UNITY_EDITOR
  //-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(HardwareCatalogVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class HardwareCatalogScriptableVariableEditor : HardwareCatalogVariable.BaseScriptableVariableEditor {
  }
#endif
}
