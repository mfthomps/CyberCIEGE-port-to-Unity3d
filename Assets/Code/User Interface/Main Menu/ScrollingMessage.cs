using System.Collections;
using UnityEngine;
using TMPro;
using Shared.ScriptableVariables;

namespace Code.User_Interface.MainMenu {
  public class ScrollingMessage : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Whether the game is currently paused or not")]
    public BooleanVariable gamePaused;
    [Tooltip("The current user message to display to the user")]
    public StringVariable userMessage;
    [Header("UI Elements")]
    [Tooltip("Transform to move when scrolling the message")]
    public RectTransform labelTransform;
    [Tooltip("Label to show scrolling message")]
    public TMP_Text pausedLabel;
    [Header("Customization")]
    [Tooltip("How fast the message should scroll (pixels per second)")]
    public float scrollSpeed = 100.0f;

    private Coroutine _scrollingCoroutine;

    // ------------------------------------------------------------------------
    void OnEnable() {
      userMessage.OnValueChanged += OnMessageChanged;
      OnMessageChanged();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      userMessage.OnValueChanged -= OnMessageChanged;
    }

    // ------------------------------------------------------------------------
    private void OnMessageChanged() {
      if (_scrollingCoroutine != null) {
        StopCoroutine(_scrollingCoroutine);
      }
      _scrollingCoroutine = StartCoroutine(ScrollMessage());
    }

    // ------------------------------------------------------------------------
    private IEnumerator ScrollMessage() {
      // Move our label off the right side of the parent container
      var containerTransform = labelTransform.parent as RectTransform;
      labelTransform.localPosition = new Vector2(containerTransform.rect.width, labelTransform.localPosition.y);

      // Update the label's text
      pausedLabel.text = userMessage.Value;

      yield return null;

      while (labelTransform.localPosition.x + labelTransform.rect.width >= 0.0f) {
        if (!gamePaused.Value) {
          labelTransform.Translate(-Time.deltaTime * scrollSpeed, 0.0f, 0.0f);
        }
        yield return null;
      }
    }
  }
}
