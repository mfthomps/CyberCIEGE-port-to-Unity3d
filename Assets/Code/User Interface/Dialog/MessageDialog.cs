using System;
using UnityEngine;
using TMPro;
using Shared.ScriptableVariables;

namespace Code.User_Interface.Dialog {
  public class MessageDialog : MonoBehaviour {
    [Header("Output Events")]
    [Tooltip("Event to fire when dialog is up")]
    public BooleanGameEvent dialogUp;
    [Tooltip("Event to fire when dialog is closed")]
    public StringGameEvent dialogClosed;
    [Header("UI Elements")]
    [Tooltip("Main Dialog UI")]
    public GameObject dialog;
    [Tooltip("Main message text label")]
    [SerializeField] private TMP_Text _messageLabel;

    private Action _callback;

    // --------------------------------------------------------------------------
    void Awake() {
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    public void OnServerMessageReceived(string message) {
      ShowMessage(new MessageRequest(message, () => dialogClosed?.Raise(null)));
      dialogUp?.Raise(false);
    }

    // --------------------------------------------------------------------------
    public void ShowMessage(MessageRequest request) {
      _messageLabel.text = request.message;
      _callback = request.callback;
      ToggleDialog(true);
    }

    // --------------------------------------------------------------------------
    public void Close() {
      if (_callback != null) {
        _callback();
      }
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    private void ToggleDialog(bool isOn) {
      dialog.SetActive(isOn);
    }
  }
}
