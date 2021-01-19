using UnityEngine;
using UnityEngine.UI;
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
    [Tooltip("Pause button icon")]
    public Image pauseIcon;
    [Tooltip("Icon to show when the game is currently paused")]
    public Sprite pausedSprite;
    [Tooltip("Icon to show when the game is currently playing")]
    public Sprite unpausedSprite;

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
      pauseIcon.sprite = gamePaused.Value ? pausedSprite : unpausedSprite;
    }
  }
}
