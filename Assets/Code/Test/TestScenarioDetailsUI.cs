using UnityEngine;
using Shared.ScriptableVariables;
using Code.User_Interface.View;

namespace Code.Test {
  public class TestScenarioDetailsUI : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Current view type the user is viewing")]
    public ViewTypeVariable currentViewType;
    [Header("Output Variables")]
    [Tooltip("Briefing for the current scenario")]
    public StringVariable scenarioBriefing;

    // --------------------------------------------------------------------------
    void Start() {
      scenarioBriefing.Value = "This is where the current scenario's briefing would go if we had one";
      currentViewType.SetView(ViewType.Game);
    }

    // --------------------------------------------------------------------------
    void OnDestroy() {
      scenarioBriefing.Reset();
      currentViewType.Reset();
    }

    // ------------------------------------------------------------------------
    public void Restart() {
      Debug.Log("Restart the current scenario");
    }

    // ------------------------------------------------------------------------
    public void RestartFromCheckpoint() {
      Debug.Log("Restart the current scenario from the last checkpoint");
    }

    // ------------------------------------------------------------------------
    public void Save() {
      Debug.Log("Save the current scenario");
    }

    // ------------------------------------------------------------------------
    public void Quit() {
      Debug.Log("Quit the current scenario");
    }
  }
}
