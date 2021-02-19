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

    //---------------------------------------------------------------------------
    public ZoneBehavior GetZone(ComputerBehavior computer) {
      return GetZone(computer.transform);
    }

    //---------------------------------------------------------------------------
    public ZoneBehavior GetZone(DeviceBehavior device) {
      return GetZone(device.transform);
    }

    //---------------------------------------------------------------------------
    private ZoneBehavior GetZone(Transform transform) {
      ZoneBehavior containingZone = null;
      foreach (var zone in Value) {
        // Is this computer inside this zone?
        if (IsTransformInZone(transform, zone)) {
          // If we didn't already have a containing zone or this zone is inside the other one,
          // then replace our containing zone
          if (containingZone == null || DoesZoneEncapsulatesOtherZone(containingZone, zone)) {
            containingZone = zone;
          }
        }
      }
      return containingZone;
    }

    //---------------------------------------------------------------------------
    private bool IsTransformInZone(Transform transform, ZoneBehavior zone) {
      return zone.Data.GetRect().Contains(new Vector2(transform.position.x, transform.position.z));
    }

    //---------------------------------------------------------------------------
    private bool DoesZoneEncapsulatesOtherZone(ZoneBehavior zone, ZoneBehavior other) {
      var zoneRect = zone.Data.GetRect();
      var otherRect = other.Data.GetRect();
      return zoneRect.Contains(otherRect.min) && zoneRect.Contains(otherRect.max);
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