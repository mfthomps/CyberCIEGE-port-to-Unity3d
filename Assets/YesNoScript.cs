using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Xml.Linq;
using System.Xml;
using System.IO;
using System.Linq;
public class YesNoScript : MonoBehaviour {

	public Text text;
	public Button yes_button;
	public Button no_button;
	// Use this for initialization
	void Start()
	{
		this.yes_button.onClick.AddListener(YesClicked);
		this.no_button.onClick.AddListener(NoClicked);

	}
	public void YesClicked()
	{
		this.gameObject.SetActive(false);
		IPCManagerScript.DialogClosed("yes");
	}
	public void NoClicked()
	{
		this.gameObject.SetActive(false);
		IPCManagerScript.DialogClosed("no");
	}
	public void ShowMessage(string message)
	{
		StringReader xmlreader = new StringReader(message);
		XmlDocument xml_doc = new XmlDocument();
		xml_doc.Load(xmlreader);
		XmlNode the_node = xml_doc.SelectSingleNode("//yesNo");
		text.text = the_node["text"].InnerText;
		string yes_text = the_node["yes"].InnerText;
		yes_button.GetComponentInChildren<Text>().text = yes_text;
		string no_text = the_node["no"].InnerText;
		no_button.GetComponentInChildren<Text>().text = no_text;
		this.gameObject.SetActive(true);
	}
}
