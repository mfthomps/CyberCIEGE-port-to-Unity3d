using UnityEngine;
using Code.User_Interface.Objectives;

namespace Code.Test {
  public class TestObjectivesUI : MonoBehaviour {
    [Header("External Variables")]
    [Tooltip("Currently playing campaign")]
    public ObjectivesView objectivesView;

    // ------------------------------------------------------------------------
    void Awake() {
      objectivesView.Init();
    }

    // ------------------------------------------------------------------------
    public void SetPhaseDone(string phaseName) {
      objectivesView.SetPhaseDone(phaseName);
    }

    // ------------------------------------------------------------------------
    public void SetObjectiveComplete(string objectiveName) {
      objectivesView.ToggleObjectiveComplete(objectiveName, true);
    }

    // ------------------------------------------------------------------------
    public void SetObjectiveIncomplete(string objectiveName) {
      objectivesView.ToggleObjectiveComplete(objectiveName, false);
    }
  }
}
