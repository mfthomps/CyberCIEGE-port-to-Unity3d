using Code.World_Objects.Device;
using UnityEngine;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Device List")]
  public class DeviceListVariable : ListVariable<DeviceBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(DeviceListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class DeviceListVariableVariableEditor : DeviceListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}