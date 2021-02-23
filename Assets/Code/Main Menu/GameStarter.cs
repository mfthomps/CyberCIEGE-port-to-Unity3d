using System.Diagnostics;
using UnityEngine;
using UnityEngine.UI;
using Shared.ScriptableVariables;

namespace Code.MainMenu {
  // Logic class for Preferences Dialog UI
  public class GameStarter : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Tooltip("Selected campaign value")]
    public StringVariable selectedCampaign;
    [Tooltip("Selected scenario value")]
    public StringVariable selectedScenario;
    [Tooltip("Selected scenario value")]
    public StringVariable selectedSavedGame;
    [Header("Input Variables")]
    [Tooltip("Button to play the game")]
    public Button playButton;

    private Process _gameProcess;

    // ------------------------------------------------------------------------
    void Awake() {
      DontDestroyOnLoad(this);
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      // If we launched a game process, then kill it when we quit
      if (_gameProcess != null) {
        foreach (var process in Process.GetProcessesByName("simsecNoUi")) {
          process.Kill();
        }
        if (!_gameProcess.HasExited) {
          _gameProcess.Kill();
        }
        _gameProcess = null;
      }
    }

    // ------------------------------------------------------------------------
    void OnEnable() {
      ccInstallPath.OnValueChanged += UpdatePlayButton;
      selectedCampaign.OnValueChanged += UpdatePlayButton;
      selectedScenario.OnValueChanged += UpdatePlayButton;
      selectedSavedGame.OnValueChanged += UpdatePlayButton;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ccInstallPath.OnValueChanged -= UpdatePlayButton;
      selectedCampaign.OnValueChanged -= UpdatePlayButton;
      selectedScenario.OnValueChanged -= UpdatePlayButton;
      selectedSavedGame.OnValueChanged -= UpdatePlayButton;
    }

    // ------------------------------------------------------------------------
    public void Play() {
      GameLoadBehavior.StoreCCInstallPath(ccInstallPath.Value);

      var newGame = string.IsNullOrEmpty(selectedSavedGame.Value);
      _gameProcess = new Process();
      _gameProcess.StartInfo.FileName = CyberCIEGEParser.GetCyberCIEGELauncher(ccInstallPath.Value, newGame);
      string args = "";
      if (newGame) {
        args = $"\"{selectedCampaign.Value}\" {selectedScenario.Value} {selectedScenario.Value} yes";
      }
      else {
        var logFile = CyberCIEGEParser.GetLogFile(ccInstallPath.Value, selectedCampaign.Value, selectedScenario.Value);
        var sdfPath = CyberCIEGEParser.GetSaveFile(ccInstallPath.Value, selectedCampaign.Value, selectedSavedGame.Value);
        args = $"\"{selectedCampaign.Value}\" \"{logFile}\" \"{selectedSavedGame.Value}\" \"{sdfPath}\" headless";

      }
      UnityEngine.Debug.Log("args is " + args);
      _gameProcess.StartInfo.Arguments = args;

      string working_dir = CyberCIEGEParser.GetCyberCIEGEWorkingDirectory(ccInstallPath.Value);
      _gameProcess.StartInfo.WorkingDirectory = working_dir;
      _gameProcess.Start();
    }

    // ------------------------------------------------------------------------
    public void Stop() {
      Destroy(gameObject);
    }

    // ------------------------------------------------------------------------
    private void UpdatePlayButton() {
      // Only enable the play button if the input variables are valid
      playButton.interactable = !string.IsNullOrEmpty(ccInstallPath.Value) &&
        !string.IsNullOrEmpty(selectedCampaign.Value) &&
        !string.IsNullOrEmpty(selectedScenario.Value);
    }
  }
}
