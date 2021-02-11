using System;
using System.IO;
using System.Xml;
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
    public void OnServerConfirmationReceived(string message) {
      StringReader xmlreader = new StringReader(message);
      XmlDocument xml_doc = new XmlDocument();
      xml_doc.Load(xmlreader);
      XmlNode the_node = xml_doc.SelectSingleNode("//yesNo");
      var confirmationMessage = the_node["text"].InnerText;
      var acceptText = the_node["yes"].InnerText;
      var canceltext = the_node["no"].InnerText;
      GetConfirmation(new ConfirmationRequest(confirmationMessage, acceptText, canceltext, (bool accepted) => IPCManagerScript.DialogClosed(accepted ? "yes" : "no")));
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
