using System;
using System.IO;
using System.Xml;
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
    [Header("Output Variables")]
    [Tooltip("List of zones")]
    public ZoneListVariable zones;

    private static readonly string ZONE_EVENT_ADD_ACCESS = "accessAdd";
    private static readonly string ZONE_EVENT_REMOVE_ACCESS = "accessRemove";
    private static readonly string ZONE_EVENT_TARGET_KEY_USER = "user";
    private static readonly string ZONE_EVENT_TARGET_KEY_GROUP = "group";
    private static readonly string ZONE_EVENT_TARGET_KEY_CLEARANCE = "clearance";

    // --------------------------------------------------------------------------
    public void UpdateZoneStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      XmlDocument xml_doc = new XmlDocument();
      try {
        xml_doc.Load(xmlreader);
      }
      catch (XmlException  e) {
        Debug.LogError($"Zone status xml contains an error: {message}. {e}");
        return;
      }
      
      XmlNode the_node = xml_doc.SelectSingleNode("//zone_status");
      var zoneStatuses = the_node.SelectNodes("zone");
      foreach (XmlNode zoneStatus in zoneStatuses) {
        var zoneName = zoneStatus["name"].InnerText;
        var security = int.Parse(zoneStatus["security"].InnerText);
        bool hidden = IsZoneHidden(zoneStatus);
        foreach (var zone in zones.Value) {
          if (zone.Data.ZoneName == zoneName) {
            zone.SetSecurity(security);
            zone.SetHidden(hidden);
          }
        }
      }
    }

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
    
    // ------------------------------------------------------------------------
    private static bool IsZoneHidden(XmlNode zoneStatus) {
      string hiddenStr = zoneStatus["hide"]?.InnerText;
      bool hidden = (!string.IsNullOrEmpty(hiddenStr) && hiddenStr == "yes");
      return hidden;
    }
  }
}
