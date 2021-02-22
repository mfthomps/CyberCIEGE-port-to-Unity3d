using System.IO;
using UnityEngine;
using Shared.SceneLoader;
using Shared.ScriptableVariables;
using Code.MainMenu;

namespace Code.Scenario {
  public class ScenarioManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("User AppData path")]
    public StringVariable userAppDataPath;
    [Tooltip("Is the game currently paused?")]
    public BooleanVariable gamePaused;
    [Header("Output Variables")]
    [Tooltip("Whether the scenario scene should be paused or not")]
    public BooleanVariable scenePaused;
    [Header("Connected Components")]
    [Tooltip("Scenario changer to use when we quit a scenario")]
    public SceneChanger sceneChanger;

    private bool _isDialogUp;

    //-------------------------------------------------------------------------
    private void OnEnable() {
      gamePaused.OnValueChanged += UpdateScenePaused;
      UpdateScenePaused();
    }
    
    //-------------------------------------------------------------------------
    private void OnDisable() {
      gamePaused.OnValueChanged -= UpdateScenePaused;
    }

    // ------------------------------------------------------------------------
    public void Restart() {
      Debug.LogWarning("Server message to restart scenario not implemented yet");
    }

    // ------------------------------------------------------------------------
    public void RestartFromCheckpoint() {
      Debug.LogWarning("Server message to restart scenario from last checkpoint not implemented yet");
    }

    // ------------------------------------------------------------------------
    public void Save() {
      string fname = Path.Combine(userAppDataPath.Value, "debug_save.sdf");
      IPCManagerScript.SendRequest("save:" + fname);
    }

    // ------------------------------------------------------------------------
    public void Quit() {
      IPCManagerScript.SendRequest("exit");

      // Try to find the GameStarter monobehavior and tell it to stop
      var gameStarter = FindObjectOfType<GameStarter>();
      gameStarter.Stop();
      sceneChanger.ChangeScene();
    }

    //-------------------------------------------------------------------------
    public void DialogUp(bool dialogIsUp) {
      _isDialogUp = dialogIsUp;
      UpdateScenePaused();
    }

    //-------------------------------------------------------------------------
    private void UpdateScenePaused() {
      // Pause the scene if either the game is paused according to the server
      // or if a dialog is up
      scenePaused.Value = gamePaused.Value || _isDialogUp;
    }
  }
}
