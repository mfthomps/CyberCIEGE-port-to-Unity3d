using System.Diagnostics;
using System.IO;
using UnityEngine;
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

    private Process _gameProcess;

    // ------------------------------------------------------------------------
    void Awake() {
      DontDestroyOnLoad(this);
    }

    // ------------------------------------------------------------------------
    void OnApplicationQuit() {
      // If we launched a game process, then kill it when we quit
      if (_gameProcess != null) {
        foreach (var process in Process.GetProcessesByName("simsecNoUi")) {
          process.Kill();
        }
        _gameProcess.Kill();
        _gameProcess = null;
      }
    }

    // ------------------------------------------------------------------------
    public void Play() {
      _gameProcess = new Process();
      string args = "";
      if (string.IsNullOrEmpty(selectedSavedGame.Value)) {
        string cmd = Path.Combine(ccInstallPath.Value, "ccse/SAT/bin/CyberCIEGE.bat");
        _gameProcess.StartInfo.FileName = cmd;
        args = $"\"{selectedCampaign.Value}\" {selectedScenario.Value} {selectedScenario.Value} yes";
      }
      else
      {
        var campaignDirectory = Path.Combine(ccInstallPath.Value, "game", selectedCampaign.Value);
        var userDirectory = Path.Combine(campaignDirectory, System.Environment.UserName);
        var sdfPath = Path.Combine(userDirectory, $"{selectedSavedGame.Value}.sdf");
        var logFile = Path.Combine(userDirectory, "logs", selectedScenario.Value);
        args = $"\"{selectedCampaign.Value}\" \"{logFile}\" \"{selectedSavedGame.Value}\" \"{sdfPath}\" headless";

        _gameProcess.StartInfo.FileName = Path.Combine(ccInstallPath.Value, "ccse/SAT/bin/SavedCyberCIEGE.bat");
      }
      // Debug.Log("args is " + args);
      _gameProcess.StartInfo.Arguments = args;

      string working_dir = Path.Combine(ccInstallPath.Value, "ccse");
      _gameProcess.StartInfo.WorkingDirectory = working_dir;
      _gameProcess.Start();
    }
  }
}
