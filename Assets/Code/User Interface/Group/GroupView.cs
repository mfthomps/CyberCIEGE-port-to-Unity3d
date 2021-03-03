using UnityEngine;
using Code.AccessControlGroup;
using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.User_Interface.Background_Check;

namespace Code.User_Interface.Group {
  public class GroupView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the AccessControlGroups currently in the scenario.")]
    [SerializeField] private AccessControlGroupListVariable groups;
    [Tooltip("The users in the current scenario.")]
    [SerializeField] private UserListVariable users;
    [Header("Output Events")]
    [Tooltip("Change the background check level for the selected group")]
    public BackgroundCheckChangeGameEvent changeBackgroundLevel;
    [Header("UI Elements")]
    [Tooltip("List of groups to display")]
    public GroupList groupList;
    [Tooltip("GameObject for settings section")]
    public GameObject settingsSection;
    [Tooltip("List of user's in the selected group")]
    public StringList usersInGroupList;
    [Tooltip("List of background check levels")]
    public BackgroundCheckList backgroundCheckList;

    private AccessControlGroupBehavior _selectedAccessControlGroup;

    // ------------------------------------------------------------------------
    void OnEnable() {
      groups.OnValueChanged += UpdateAccessControlGroupList;
      UpdateAccessControlGroupList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      groups.OnValueChanged -= UpdateAccessControlGroupList;
    }

    // ------------------------------------------------------------------------
    public void SelectAccessControlGroup(AccessControlGroupBehavior group) {
      _selectedAccessControlGroup = group;
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    public void SetBackgroundCheckLevel(BackgroundCheck.Level level) {
      if (_selectedAccessControlGroup.Data.backgroundCheckLevel != level) {
        changeBackgroundLevel?.Raise(new BackgroundCheckChange(_selectedAccessControlGroup.Data.name, level));
        DisplayAccessControlGroupInformation(_selectedAccessControlGroup);
      }
    }

    // ------------------------------------------------------------------------
    private void UpdateAccessControlGroupList() {
      groupList.SetItems(groups.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var group in groups.Value) {
        if (group != null) {
          groupList.SetSelected(group, group == _selectedAccessControlGroup);
        }
      }

      DisplayAccessControlGroupInformation(_selectedAccessControlGroup);
    }

    // ------------------------------------------------------------------------
    private void DisplayAccessControlGroupInformation(AccessControlGroupBehavior group) {
      if (group != null) {
        usersInGroupList.SetItems(users.Value.FindAll(user => user.Data.groups.Contains(group.Data.name)).ConvertAll(user => user.Data.user_name));
      }
      else {
        usersInGroupList.ClearItems();
      }
      backgroundCheckList.SetCurrentLevel(group != null ? group.Data.backgroundCheckLevel : BackgroundCheck.Level.None);
      settingsSection.SetActive(group != null);
    }
  }
}
