using System.Collections.Generic;
using System.IO;
using System.Xml;
using UnityEngine;
using TMPro;
using Shared.ScriptableVariables;

namespace Code.User_Interface.Dialog {
  public class MultipleChoiceDialog : MonoBehaviour {
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
    [Tooltip("List of choices")]
    [SerializeField] private SelectableStringList _choiceList;

    private Dictionary<string, int> _choiceIndices = new Dictionary<string, int>();
    private int _selectedChoiceIndex;

    // --------------------------------------------------------------------------
    void Awake() {
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    public void OnServerMultipleChoiceReceived(string serverMessage) {
      StringReader xmlreader = new StringReader(serverMessage);
      XmlDocument xml_doc = new XmlDocument();
      xml_doc.Load(xmlreader);
      XmlNode rootNode = xml_doc.SelectSingleNode("//multipleChoice");
      var message = rootNode["text"].InnerText;
      var choices = new List<string>();
      var choiceNodes = rootNode.SelectNodes("answer");
      foreach (XmlNode choiceNode in choiceNodes) {
        choices.Add(choiceNode.InnerText);
        _choiceIndices.Add(choiceNode.InnerText, _choiceIndices.Count);
      }

      // Setup the UI
      _messageLabel.text = message;
      _choiceList.SetItems(choices);

      dialogUp?.Raise(false);
      ToggleDialog(true);
    }

    // --------------------------------------------------------------------------
    public void OnChoiceSelected(string choice) {
      _selectedChoiceIndex = _choiceIndices[choice];
      foreach (var choiceItem in _choiceList.listItems) {
        choiceItem.Value.SetSelected(choiceItem.Key == choice);
      }
    }

    // --------------------------------------------------------------------------
    public void Accept() {
      IPCManagerScript.SendRequest($"dialogClosed:{(char)('a' + _selectedChoiceIndex)}");
      dialogClosed?.Raise(null);
      ToggleDialog(false);
    }

    // --------------------------------------------------------------------------
    private void ToggleDialog(bool isOn) {
      dialog.SetActive(isOn);
    }
  }
}
