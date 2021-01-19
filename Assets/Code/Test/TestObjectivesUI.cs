using UnityEngine;
using Code.User_Interface.Objectives;

namespace Code.Test {
  public class TestObjectivesUI : MonoBehaviour {
    [Header("External Variables")]
    [Tooltip("Currently playing campaign")]
    public ObjectivesView objectivesView;

    // ------------------------------------------------------------------------
    public void SetPhaseDone(string phaseName) {
      objectivesView.SetPhaseDone(phaseName);
    }

    // ------------------------------------------------------------------------
    public void SetObjectiveComplete(string objectiveName) {
      objectivesView.SetObjectiveComplete(objectiveName);
    }

    // ------------------------------------------------------------------------
    public void SetObjectiveIncomplete(string objectiveName) {
      objectivesView.SetObjectiveIncomplete(objectiveName);
    }
  }
}
