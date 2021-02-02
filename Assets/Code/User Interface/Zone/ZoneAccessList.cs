using UnityEngine;
using Shared.ScriptableVariables;
using Code.Clearance;
using Code.Scriptable_Variables;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Zone {
  // A combination of user, group, and clearance access lists in one large list UI
  public class ZoneAccessList : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of users in the scenario")]
    public UserListVariable users;
    [Tooltip("List of groups in the scenario")]
    public AccessControlGroupListVariable accessControlGroups;
    [Tooltip("List of clearances in the scenario")]
    public ClearanceListVariable clearances;
    [Tooltip("Currentlyl selected object")]
    public GameObjectVariable selectedObject;
    [Header("Output Variables")]
    [Tooltip("Toggles zone access for the given user")]
    public StringGameEvent toggleUserAccess;
    [Tooltip("Toggles zone access for the given group")]
    public StringGameEvent toggleGroupAccess;
    [Tooltip("Toggles zone access for the given clearance")]
    public StringGameEvent setMinimumClearanceAccess;
    [Header("UI Elements")]
    [Tooltip("List of users to explicitly give access to the selected zone")]
    public AccessList userAccessList;
    [Tooltip("List of groups to explicitly give access to the selected zone")]
    public AccessList groupAccessList;
    [Tooltip("List of clearances to explicitly give read access to the selected zone")]
    public AccessList readClearanceAccessList;
    [Tooltip("List of clearances to explicitly give write access to the selected zone")]
    public AccessList writeClearanceAccessList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      users.OnValueChanged += UpdateAccessLists;
      accessControlGroups.OnValueChanged += UpdateAccessLists;
      clearances.OnValueChanged += UpdateAccessLists;
      selectedObject.OnValueChanged += UpdateAccessListSelection;
      UpdateAccessLists();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      users.OnValueChanged -= UpdateAccessLists;
      accessControlGroups.OnValueChanged -= UpdateAccessLists;
      clearances.OnValueChanged -= UpdateAccessLists;
      selectedObject.OnValueChanged -= UpdateAccessListSelection;
    }

    // ------------------------------------------------------------------------
    public void ToggleUserAccess(string userName) {
      toggleUserAccess?.Raise(userName);
      UpdateAccessListSelection();
    }

    // ------------------------------------------------------------------------
    public void ToggleGroupAccess(string groupName) {
      toggleGroupAccess?.Raise(groupName);
      UpdateAccessListSelection();
    }

    // ------------------------------------------------------------------------
    public void SetMinimumClearance(string clearanceName) {
      setMinimumClearanceAccess?.Raise(clearanceName);
      UpdateAccessListSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateAccessLists() {
      userAccessList.SetItems(users.Value.ConvertAll(user => user.Data.user_name));
      groupAccessList.SetItems(accessControlGroups.Value.ConvertAll(group => group.Data.name));
      readClearanceAccessList.SetItems(clearances.Value.FindAll(clearance => clearance.Data.type == ClearanceDataObject.ClearanceType.Secrecy).ConvertAll(clearance => clearance.Data.name));
      writeClearanceAccessList.SetItems(clearances.Value.FindAll(clearance => clearance.Data.type == ClearanceDataObject.ClearanceType.Integrity).ConvertAll(clearance => clearance.Data.name));
      UpdateAccessListSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateAccessListSelection() {
      ZoneBehavior selectedZone = null;
      if (selectedObject.Value != null) {
        selectedZone = selectedObject.Value.GetComponent<ZoneBehavior>();
      }

      // Select any user access list for permitted users
      foreach (var user in users.Value) {
        userAccessList.SetSelected(user.Data.user_name, selectedZone != null &&
          selectedZone.Data.permittedUsers.Contains(user.Data.user_name));
      }

      // Select any group access list for permitted groups
      foreach (var accessControlGroup in accessControlGroups.Value) {
        groupAccessList.SetSelected(accessControlGroup.Data.name, selectedZone != null &&
          selectedZone.Data.permittedUsers.Contains($"*.{accessControlGroup.Data.name}"));
      }

      // Select any clearance access list for current zone's secrecy or integrity level
      foreach (var clearance in clearances.Value) {
        readClearanceAccessList.SetSelected(clearance.Data.name, selectedZone != null &&
          selectedZone.Data.secrecy == clearance.Data.name);
        writeClearanceAccessList.SetSelected(clearance.Data.name, selectedZone != null &&
          selectedZone.Data.integrity == clearance.Data.name);
      }
    }
  }
}
