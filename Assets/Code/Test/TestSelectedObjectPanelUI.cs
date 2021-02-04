using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;

namespace Code.Test {
  public class TestSelectedObjectPanelUI : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of computers to select")]
    public ComputerListVariable computerListVariable;
    [Tooltip("List of computers to select")]
    public DeviceListVariable deviceListVariable;
    [Tooltip("List of staff to select")]
    public StaffListVariable staffListVariable;
    [Tooltip("List of users to select")]
    public UserListVariable userListVariable;
    [Tooltip("List of zones to select")]
    public ZoneListVariable zoneListVariable;
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Computer")]
    public void SelectComputer() {
      SelectItemFromList(computerListVariable.Value);
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Device")]
    public void SelectDevice() {
      SelectItemFromList(deviceListVariable.Value);
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Staff")]
    public void SelectStaff() {
      SelectItemFromList(staffListVariable.Value);
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select User")]
    public void SelectUser() {
      SelectItemFromList(userListVariable.Value);
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Zone")]
    public void SelectZone() {
      SelectItemFromList(zoneListVariable.Value);
    }

    // ------------------------------------------------------------------------
    private void SelectItemFromList<T>(List<T> list) where T : MonoBehaviour {
      var selectedIndex = list.FindIndex(item => item.gameObject == selectedObject.Value) + 1;
      if (selectedIndex >= list.Count) {
        selectedIndex = 0;
      }
      if (0 <= selectedIndex && selectedIndex < list.Count) {
        selectedObject.Value = list[selectedIndex].gameObject;
      }
    }
  }
}
