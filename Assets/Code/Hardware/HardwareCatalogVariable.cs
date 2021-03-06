using System;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.Hardware {
  // A HardwareCatalog value to share across components, scenes, and prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Hardware Catalog")]
  public class HardwareCatalogVariable : ScriptableVariable<HardwareCatalog> {

    [ReorderableList]
    public List<HardwareTypeProperties> listOfAllHardware = new List<HardwareTypeProperties>();

    public void GetHardwareAsset() {
      HardwareAsset hardwareAsset = new HardwareAsset();
      foreach (var element in listOfAllHardware) {
        hardwareAsset.mesh = element.mesh;
        hardwareAsset.material = element.material;
        hardwareAsset.icon = element.icon;
        element.hardwareAsset = hardwareAsset;
      }
    }

    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }

  //#if UNITY_EDITOR
  //  //-----------------------------------------------------------------------------
  //  [UnityEditor.CustomEditor(typeof(HardwareCatalogVariable))]
  //  [UnityEditor.CanEditMultipleObjects]
  //  public class HardwareCatalogScriptableVariableEditor : HardwareCatalogVariable.BaseScriptableVariableEditor {
  //  }
  //#endif

  [Serializable]
  public class HardwareTypeProperties : HardwareAsset {
    public string name;
    public string description;
    public HardwareAsset hardwareAsset;
    public HardwareType hardwareType;
  }

}
