using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using System.Text;
using System;
using System.Xml;
public class ToolTipScript : MonoBehaviour {
	public Text tool_tip;
	// Use this for initialization
	void Start () {
		tool_tip.text = "now is the time";
	}
	public static void AddTip(string message)
	{


		GameObject help_tip_panel = menus.menu_panels["HelpTip"];
		Debug.Log("ToolTipScript message " + message);
		ToolTipScript tool_script = (ToolTipScript)help_tip_panel.GetComponent(typeof(ToolTipScript));
		help_tip_panel.SetActive(false);
		StringReader reader = new StringReader(message);
		XmlDocument xml_doc = new XmlDocument();
		xml_doc.Load(reader);
		XmlNode tip_node = xml_doc.SelectSingleNode("//tool_tip");
		tool_script.tool_tip.text = tip_node["text"].InnerText;
		help_tip_panel.SetActive(true);
		Canvas.ForceUpdateCanvases();
	}
	public static void HideTip()
	{
		GameObject help_tip_panel = menus.menu_panels["HelpTipPanel"];
		help_tip_panel.SetActive(false);

	}
	// Update is called once per frame
	void Update () {
		
	}
}
