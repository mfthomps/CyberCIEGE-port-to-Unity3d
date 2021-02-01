using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Zone {
  // A combination of user, group, and clearance access lists in one large list UI
  public class ZoneAccessList : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of users in the scenario")]
    public UserListVariable userListVariable;
    [Tooltip("List of groups in the scenario")]
    public AccessControlGroupListVariable accessControlGroups;
    [Header("UI Elements")]
    [Tooltip("List of users to explicitly give access to the selected zone")]
    public AccessList userAccessList;
    [Tooltip("List of groups to explicitly give access to the selected zone")]
    public AccessList groupAccessList;
    [Tooltip("List of clearances to explicitly give access to the selected zone")]
    public AccessList clearanceAccessList;
  }
}
