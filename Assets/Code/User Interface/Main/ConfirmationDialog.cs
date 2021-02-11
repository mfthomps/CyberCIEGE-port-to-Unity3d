using System;
using UnityEngine;
using TMPro;

namespace Code.User_Interface.Main {
  public class ConfirmationDialog : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("Main Dialog UI")]
    public GameObject dialog;
    [Tooltip("Main message text label")]
    [SerializeField] private TMP_Text _messageLabel;
    [Tooltip("Accept button text label")]
    [SerializeField] private TMP_Text _acceptLabel;
    [Tooltip("Cancel button text label")]
    [SerializeField] private TMP_Text _declineLabel;

    private Action<bool> _callback;

    // --------------------------------------------------------------------------
    void Awake() {
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    public void GetConfirmation(ConfirmationRequest request) {
      _messageLabel.text = request.message;
      _acceptLabel.text = request.acceptText;
      _declineLabel.text = request.declineText;
      _callback = request.callback;
      ToggleDialog(true);
    }

    // --------------------------------------------------------------------------
    public void Accept() {
      _callback(true);
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    public void Cancel() {
      _callback(false);
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    private void ToggleDialog(bool isOn) {
      dialog.SetActive(isOn);
    }
  }
}
