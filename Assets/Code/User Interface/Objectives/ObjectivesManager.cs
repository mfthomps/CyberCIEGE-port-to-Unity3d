using System.IO;
using System.Xml;
using UnityEngine;

namespace Code.User_Interface.Objectives {
  public class ObjectivesManager : MonoBehaviour {
    [Header("External Variables")]
    [Tooltip("Currently playing campaign")]
    public ObjectivesView objectivesView;

    // ------------------------------------------------------------------------
    public void LoadObjectives() {
      objectivesView.Init();
    }

    // ------------------------------------------------------------------------
    public void SetPhaseDone(string phaseName) {
      objectivesView.SetPhaseDone(phaseName);
    }

    // ------------------------------------------------------------------------
    public void UpdateObjective(string objectiveChangeMessage) {
      StringReader reader = new StringReader(objectiveChangeMessage);

      XmlDocument xmlDocument = new XmlDocument();
      xmlDocument.Load(reader);
      XmlNode objectiveNode = xmlDocument.SelectSingleNode("//objective");
      var objectiveName = objectiveNode["name"].InnerText;
      var status = objectiveNode["completed"].InnerText;
      //Debug.Log("status is " + status);
      bool isCompleted = false;
      if (!bool.TryParse(status, out isCompleted)) {
        Debug.Log("Error: ObjectiveStatus parse " + status);
      }

      objectivesView.ToggleObjectiveComplete(objectiveName, isCompleted);
    }
  }
}
