using UnityEngine;

namespace Code.AccessControlGroup {
  public class AccessControlGroupBehavior : MonoBehaviour {
    public AccessControlGroupDataObject Data { get; set; }

    // ------------------------------------------------------------------------
    public void SetBackgroundCheckLevel(BackgroundCheck.Level level) {
      Data.backgroundCheckLevel = level;
    }
  }
}
