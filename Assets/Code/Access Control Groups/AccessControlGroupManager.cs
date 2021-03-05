using System;
using System.Xml.Linq;
using UnityEngine;
using Code.Game_Events;
using Code.Scriptable_Variables;

namespace Code.AccessControlGroup {
  public class AccessControlGroupManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the AccessControlGroups currently in the scenario.")]
    [SerializeField] private AccessControlGroupListVariable groups;

    // ------------------------------------------------------------------------
    public void SetAccessControlGroupBackgroundCheckLevel(BackgroundCheckChange change) {
      foreach (var group in groups.Value) {
        if (group.Data.name == change.objectName) {
          var oldLevel = group.Data.backgroundCheckLevel;
          group.SetBackgroundCheckLevel(change.level);

          // Send a server event to change the background level
          XElement xml = new XElement("userEvent",
            new XElement("backgroundCheck",
              new XElement("group", group.Data.name),
              new XElement("oldCheck", GetBackgroundCheckLevelName(oldLevel)),
              new XElement("newCheck", GetBackgroundCheckLevelName(change.level))),
            new XElement("cost", BackgroundCheck.GetCostDifference(oldLevel, change.level)));

          IPCManagerScript.SendRequest(xml.ToString());
        }
      }
    }

    // ------------------------------------------------------------------------
    private string GetBackgroundCheckLevelName(BackgroundCheck.Level level) {
      return Enum.GetName(typeof(BackgroundCheck.Level), level).ToUpper();
    }
  }
}
