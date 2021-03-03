using UnityEngine;

namespace Code.Clearance {
  public class ClearanceBehavior : MonoBehaviour {
    [SerializeField] private ClearanceDataObject _data;

    public ClearanceDataObject Data {
      get => _data;
      set => _data = value;
    }

    // ------------------------------------------------------------------------
    public void SetBackgroundCheckLevel(BackgroundCheck.Level level) {
      _data.backgroundCheckLevel = level;
    }
  }
}
