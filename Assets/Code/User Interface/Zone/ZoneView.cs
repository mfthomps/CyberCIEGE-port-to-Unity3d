using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Zone {
  public class ZoneView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of zones in the given scenario")]
    public ZoneListVariable zoneListVariable;
    [Header("Output Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;
    [Header("UI Elements")]
    [Tooltip("List of zones to display")]
    public ZoneList zoneList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      zoneListVariable.OnValueChanged += UpdateZoneList;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateZoneList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      zoneListVariable.OnValueChanged -= UpdateZoneList;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectZone(ZoneBehavior ZoneBehavior) {
      selectedObject.Value = ZoneBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    private void UpdateZoneList() {
      zoneList.SetItems(zoneListVariable.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var zone in zoneListVariable.Value) {
        if (zone != null) {
          zoneList.SetSelected(zone, zone.gameObject == selectedObject.Value);
        }
      }
    }
  }
}
