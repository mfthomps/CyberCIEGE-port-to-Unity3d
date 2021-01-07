using System.IO;
using System.Xml;
using UnityEngine;
using UnityEngine.UI;

public class ToolTipScript : MonoBehaviour {
  public Text tool_tip;

  // Use this for initialization
  private void Start() {
    tool_tip.text = "now is the time";
  }

  // Update is called once per frame
  private void Update() {
  }

  public static void AddTip(string message) {
    GameObject help_tip_panel = menus.menu_panels["HelpTip"];
    ToolTipScript tool_script = (ToolTipScript) help_tip_panel.GetComponent(typeof(ToolTipScript));
    help_tip_panel.SetActive(false);
    StringReader reader = new StringReader(message);
    XmlDocument xml_doc = new XmlDocument();
    xml_doc.Load(reader);
    XmlNode tip_node = xml_doc.SelectSingleNode("//tool_tip");
    tool_script.tool_tip.text = tip_node["text"].InnerText;
    help_tip_panel.SetActive(true);
    Canvas.ForceUpdateCanvases();
  }

  public static void HideTip() {
    GameObject help_tip_panel = menus.menu_panels["HelpTipPanel"];
    help_tip_panel.SetActive(false);
  }
}