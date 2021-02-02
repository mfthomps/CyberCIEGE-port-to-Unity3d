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
      selectedObject.Value = computerListVariable.Value[0].gameObject;
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Device")]
    public void SelectDevice() {
      selectedObject.Value = deviceListVariable.Value[0].gameObject;
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Staff")]
    public void SelectStaff() {
      selectedObject.Value = staffListVariable.Value[0].gameObject;
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select User")]
    public void SelectUser() {
      selectedObject.Value = userListVariable.Value[0].gameObject;
    }

    // ------------------------------------------------------------------------
    [ContextMenu("Select Zone")]
    public void SelectZone() {
      selectedObject.Value = zoneListVariable.Value[0].gameObject;
    }
  }
}
