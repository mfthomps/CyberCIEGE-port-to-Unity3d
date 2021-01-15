using UnityEngine;

namespace Code.MainMenu {
  // Data structure for a CyberCIEGE scenario
  public class Scenario {
    [Tooltip("Name of the scenario")]
    public string name;
    [Tooltip("ID of the scenario")]
    public string id;
    [Tooltip("How many points this scenario gives for completing it")]
    public int points;
    [Tooltip("Index of the scenario needed to be completed to play this one")]
    public int prerequisiteIndex;

    // ------------------------------------------------------------------------
    public Scenario(string name, string id, int points, int prerequisiteIndex) {
      this.name = name;
      this.id = id;
      this.points = points;
      this.prerequisiteIndex = prerequisiteIndex;
    }
  }
}
