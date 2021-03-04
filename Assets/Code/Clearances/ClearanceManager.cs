using System;
using System.Xml.Linq;
using UnityEngine;
using Code.Game_Events;
using Code.Scriptable_Variables;

namespace Code.Clearance {
  public class ClearanceManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the Clearances currently in the scenario.")]
    [SerializeField] private ClearanceListVariable clearances;

    // ------------------------------------------------------------------------
    public void SetClearanceBackgroundCheckLevel(BackgroundCheckChange change) {
      foreach (var clearance in clearances.Value) {
        if (clearance.Data.name == change.objectName) {
          var oldLevel = clearance.Data.backgroundCheckLevel;
          clearance.SetBackgroundCheckLevel(change.level);

          // Send a server event to change the background level
          XElement xml = new XElement("userEvent",
            new XElement("backgroundCheck",
              new XElement("clearance", clearance.Data.name),
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
