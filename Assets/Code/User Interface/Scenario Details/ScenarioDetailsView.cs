using UnityEngine;
using TMPro;
using Shared.ScriptableVariables;

namespace Code.User_Interface.Scenario_Details {
  public class ScenarioDetailsView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Briefing for the current scenario")]
    public StringVariable scenarioBriefing;
    [Header("Output Events")]
    [Tooltip("Restart scenario")]
    public GameEvent restartScenario;
    [Tooltip("Restart scenario from last checkpoint")]
    public GameEvent restartScenarioFromCheckpoint;
    [Tooltip("Save scenario")]
    public GameEvent save;
    [Tooltip("Quit scenario")]
    public GameEvent quit;
    [Header("UI Elements")]
    [Tooltip("Label for the current scenario briefing")]
    public TMP_Text briefingLabel;

    // ------------------------------------------------------------------------
    void OnEnable() {
      scenarioBriefing.OnValueChanged += UpdateBriefing;
      UpdateBriefing();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      scenarioBriefing.OnValueChanged -= UpdateBriefing;
    }

    // ------------------------------------------------------------------------
    public void Restart() {
      restartScenario?.Raise();
    }

    // ------------------------------------------------------------------------
    public void RestartFromCheckpoint() {
      restartScenarioFromCheckpoint?.Raise();
    }

    // ------------------------------------------------------------------------
    public void Save() {
      save?.Raise();
    }

    // ------------------------------------------------------------------------
    public void Quit() {
      quit?.Raise();
    }

    // ------------------------------------------------------------------------
    private void UpdateBriefing() {
      briefingLabel.text = scenarioBriefing.Value;
    }
  }
}
