using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.Scenario {
  public class ScenarioManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("User AppData path")]
    public StringVariable userAppDataPath;

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
      // TODO: Replace with going back to main menu
#if UNITY_EDITOR
      // Application.Quit() does not work in the editor so
      // UnityEditor.EditorApplication.isPlaying need to be set to false to end the game
      UnityEditor.EditorApplication.isPlaying = false;
#else
  		Application.Quit();
#endif
    }
  }
}
