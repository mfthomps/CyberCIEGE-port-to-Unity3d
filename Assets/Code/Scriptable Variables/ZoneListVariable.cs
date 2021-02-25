using UnityEngine;
using Code.World_Objects.Computer;
using Code.World_Objects.Device;
using Code.World_Objects.Zone;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Zone List")]
  public class ZoneListVariable : ListVariable<ZoneBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
  }

#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(ZoneListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class ZoneListVariableVariableEditor : ZoneListVariable.BaseScriptableVariableEditor {
  }
#endif
}