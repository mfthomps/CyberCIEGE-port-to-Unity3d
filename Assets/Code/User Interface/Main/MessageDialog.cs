using System;
using UnityEngine;
using TMPro;

namespace Code.User_Interface.Main {
  public class MessageDialog : MonoBehaviour {
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
