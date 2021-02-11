using System.IO;
using System.Xml;
using UnityEngine;
using Code.Game_Events;
using Code.User_Interface.Main;

namespace Code.World_Objects.Component {
  public class ComponentManager : MonoBehaviour {
    [Header("Output Events")]
    [Tooltip("Event to open confirmation diallog")]
    public MessageRequestGameEvent showMessage;

    // --------------------------------------------------------------------------
    public void UpdateComponentStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      XmlDocument xml_doc = new XmlDocument();
      xml_doc.Load(xmlreader);
      XmlNode the_node = xml_doc.SelectSingleNode("//component_status/component");
      var componentName = the_node["name"].InnerText;
      var speakText = the_node["speak"].InnerText;
      showMessage?.Raise(new MessageRequest($"Component {componentName} says: \"{speakText}\""));
    }
  }
}
