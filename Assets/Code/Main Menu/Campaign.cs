using UnityEngine;

namespace Code.MainMenu {
  // Data structure for a CyberCIEGE campaign
  public class Campaign {
    [Tooltip("Name of the campaign")]
    public string name;
    [Tooltip("Name of the prerequisite campaign in order to play this one")]
    public string prerequisite;

    // ------------------------------------------------------------------------
    public Campaign(string name, string prerequisite) {
      this.name = name;
      this.prerequisite = prerequisite;
    }
  }
}
