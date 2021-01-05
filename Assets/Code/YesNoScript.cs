using System.IO;
using System.Xml;
using UnityEngine;
using UnityEngine.UI;

public class YesNoScript : MonoBehaviour {
  public Text text;
  public Button yes_button;

  public Button no_button;

  // Use this for initialization
  private void Start() {
    yes_button.onClick.AddListener(YesClicked);
    no_button.onClick.AddListener(NoClicked);
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
    text.text = the_node["text"].InnerText;
    string yes_text = the_node["yes"].InnerText;
    yes_button.GetComponentInChildren<Text>().text = yes_text;
    string no_text = the_node["no"].InnerText;
    no_button.GetComponentInChildren<Text>().text = no_text;
    gameObject.SetActive(true);
  }
}