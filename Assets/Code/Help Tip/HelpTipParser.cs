using System.IO;
using System.Xml;

namespace Code.HelpTip {
  public static class HelpTipParser {
    private static string HELP_TIP_NODE = "//tool_tip";
    private static string HELP_TIP_TEXT = "text";

    // --------------------------------------------------------------------------
    public static string ParseHelpTip(string xmlMessage) {
      var reader = new StringReader(xmlMessage);
      var xmlDocument = new XmlDocument();
      xmlDocument.Load(reader);
      var tipNode = xmlDocument.SelectSingleNode(HELP_TIP_NODE);
      return tipNode[HELP_TIP_TEXT].InnerText;
    }
  }
}
