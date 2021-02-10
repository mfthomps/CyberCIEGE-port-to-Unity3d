using System.IO;
using System.Xml;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class YesNoScript : MonoBehaviour {
  [SerializeField] private TMP_Text _text;

  [SerializeField] private Button _yesButton;

  [SerializeField] private Button _noButton;

  // Use this for initialization
  private void Start() {
    _yesButton.onClick.AddListener(YesClicked);
    _noButton.onClick.AddListener(NoClicked);
  }

  public void YesClicked() {
    gameObject.SetActive(false);
    IPCManagerScript.DialogClosed("yes");
  }

  public void NoClicked() {
    gameObject.SetActive(false);
    IPCManagerScript.DialogClosed("no");
  }

  public void ShowMessage(string message) {
    StringReader xmlreader = new StringReader(message);
    XmlDocument xml_doc = new XmlDocument();
    xml_doc.Load(xmlreader);
    XmlNode the_node = xml_doc.SelectSingleNode("//yesNo");
    _text.text = the_node["text"].InnerText;
    string yes_text = the_node["yes"].InnerText;
    _yesButton.GetComponentInChildren<Text>().text = yes_text;
    string no_text = the_node["no"].InnerText;
    _noButton.GetComponentInChildren<Text>().text = no_text;
    gameObject.SetActive(true);
  }

}