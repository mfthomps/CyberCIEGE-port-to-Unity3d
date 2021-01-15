using UnityEngine;
using UnityEngine.UI;
using Shared.ScriptableVariables;

namespace Code.MainMenu {
  // Logic class for Preferences Dialog UI
  public class ProgressTracker : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Header("UI Elements")]
    [Tooltip("Slider showing our current progress")]
    public Slider slider;

    // ------------------------------------------------------------------------
    void OnEnable() {
      ccInstallPath.OnValueChanged += UpdateProgress;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ccInstallPath.OnValueChanged -= UpdateProgress;
    }

    // ------------------------------------------------------------------------
    private void UpdateProgress() {
      float totalPossible = 0.0f, playerTotal = 0.0f;
      if (!string.IsNullOrEmpty(ccInstallPath.Value)) {
        CyberCIEGEParser.ForEachCampaign(ccInstallPath.Value, (campaign) => {
          CyberCIEGEParser.ForEachScenario(ccInstallPath.Value, campaign.name, (scenario) => {
            totalPossible += scenario.points;
            if (CyberCIEGEParser.DidUserCompleteScenario(ccInstallPath.Value, campaign.name, scenario.id)) {
              playerTotal += scenario.points;
            }
          });
        });
      }
      slider.value = totalPossible > 0.0f ? playerTotal / totalPossible : 0.0f;
    }
  }
}
