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
    [Header("Connected Components")]
    [Tooltip("Scenario changer to use when we quit a scenario")]
    public SceneChanger sceneChanger;

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
      // Try to find the GameStarter monobehavior and tell it to stop
      var gameStarter = FindObjectOfType<GameStarter>();
      gameStarter.Stop();
      sceneChanger.ChangeScene();
    }
  }
}
