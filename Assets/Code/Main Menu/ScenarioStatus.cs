using UnityEngine;
using Shared.ScriptableVariables;
using TMPro;

namespace Code.MainMenu {
  // Logic class for Scenario Status UI
  public class ScenarioStatus : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Tooltip("Selected campaign value")]
    public StringVariable selectedCampaign;
    [Tooltip("Selected scenario value")]
    public StringVariable selectedScenario;
    [Header("UI Elements")]
    [Tooltip("Label for displaying player status for selected scenario")]
    public TMP_Text label;

    // ------------------------------------------------------------------------
    void OnEnable() {
      ccInstallPath.OnValueChanged += UpdateStatus;
      selectedScenario.OnValueChanged += UpdateStatus;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ccInstallPath.OnValueChanged -= UpdateStatus;
      selectedScenario.OnValueChanged -= UpdateStatus;
    }

    // ------------------------------------------------------------------------
    private void UpdateStatus() {
      if (!string.IsNullOrEmpty(ccInstallPath.Value) &&
          !string.IsNullOrEmpty(selectedCampaign.Value) &&
          !string.IsNullOrEmpty(selectedScenario.Value)) {
        label.text = $"Farthest Progress:\n{CyberCIEGEParser.GetScenarioStatus(ccInstallPath.Value, selectedCampaign.Value, selectedScenario.Value)}";
      }
    }
  }
}
