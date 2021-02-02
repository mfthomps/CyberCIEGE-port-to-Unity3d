using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;

namespace Code.World_Objects.Zone {
  public class ZoneManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of access control groups")]
    public AccessControlGroupListVariable accessControlGroups;
    [Tooltip("List of clearances")]
    public ClearanceListVariable clearances;
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Tooltip("List of users")]
    public UserListVariable users;

    private static readonly string ZONE_EVENT_ADD_ACCESS = "accessAdd";
    private static readonly string ZONE_EVENT_REMOVE_ACCESS = "accessRemove";
    private static readonly string ZONE_EVENT_TARGET_KEY_USER = "user";
    private static readonly string ZONE_EVENT_TARGET_KEY_GROUP = "group";
    private static readonly string ZONE_EVENT_TARGET_KEY_CLEARANCE = "clearance";

    // ------------------------------------------------------------------------
    public void ToggleUserAccess(string userName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          var toggledUser = users.Value.Find(user => user.Data.user_name == userName);
          zoneBehavior.ToggleUserAccess(toggledUser);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleGroupAccess(string groupName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          var toggledGroup = accessControlGroups.Value.Find(group => group.Data.name == groupName);
          zoneBehavior.ToggleGroupAccess(toggledGroup);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetMinimumClearance(string clearanceName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          var toggledClearance = clearances.Value.Find(clearance => clearance.Data.name == clearanceName);
          zoneBehavior.SetMinimumClearance(toggledClearance);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnUserAccessAdded(string userName) {
      SendServerEventMessage(ZONE_EVENT_ADD_ACCESS, ZONE_EVENT_TARGET_KEY_USER, userName);
    }

    // ------------------------------------------------------------------------
    public void OnUserAccessRemoved(string userName) {
      SendServerEventMessage(ZONE_EVENT_REMOVE_ACCESS, ZONE_EVENT_TARGET_KEY_USER, userName);
    }

    // ------------------------------------------------------------------------
    public void OnGroupAccessAdded(string groupName) {
      SendServerEventMessage(ZONE_EVENT_ADD_ACCESS, ZONE_EVENT_TARGET_KEY_GROUP, groupName);
    }

    // ------------------------------------------------------------------------
    public void OnGroupAccessRemoved(string groupName) {
      SendServerEventMessage(ZONE_EVENT_REMOVE_ACCESS, ZONE_EVENT_TARGET_KEY_GROUP, groupName);
    }

    // ------------------------------------------------------------------------
    public void OnClearanceAccessAdded(string clearanceName) {
      SendServerEventMessage(ZONE_EVENT_ADD_ACCESS, ZONE_EVENT_TARGET_KEY_CLEARANCE, clearanceName);
    }

    // ------------------------------------------------------------------------
    public void OnClearanceAccessRemoved(string clearanceName) {
      SendServerEventMessage(ZONE_EVENT_REMOVE_ACCESS, ZONE_EVENT_TARGET_KEY_CLEARANCE, clearanceName);
    }

    // ------------------------------------------------------------------------
    private void SendServerEventMessage(string eventName, string targetKey, string targetName) {
      XElement xml = new XElement(eventName,
        new XElement(targetKey, targetName)
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}
