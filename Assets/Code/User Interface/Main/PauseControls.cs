using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.User_Interface.Main {
  public class PauseControls : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Whether the game is currently paused or not")]
    public BooleanVariable gamePaused;
    [Header("Output Events")]
    [Tooltip("Whether we want to pause the game or not")]
    public BooleanGameEvent pauseGame;
    [Header("UI Elements")]
    [Tooltip("Label to show when game is paused")]
    public GameObject pausedLabel;
    [Tooltip("Play Button")]
    public GameObject playButton;
    [Tooltip("Pause Button")]
    public GameObject pauseButton;

    // ------------------------------------------------------------------------
    void OnEnable() {
      gamePaused.OnValueChanged += OnGamePausedChanged;
      OnGamePausedChanged();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      gamePaused.OnValueChanged -= OnGamePausedChanged;
    }

    // ------------------------------------------------------------------------
    public void TogglePause() {
      pauseGame?.Raise(!gamePaused.Value);
    }

    // ------------------------------------------------------------------------
    private void OnGamePausedChanged() {
      pausedLabel.SetActive(gamePaused.Value);
      playButton.SetActive(gamePaused.Value);
      pauseButton.SetActive(!gamePaused.Value);
    }
  }
}
