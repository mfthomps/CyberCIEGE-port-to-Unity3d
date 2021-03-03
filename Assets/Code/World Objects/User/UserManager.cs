using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;
using Code.World_Objects.Character;
using Code.World_Objects.Staff;

namespace Code.World_Objects.User {
  public class UserManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of staff in the current scenario")]
    public StaffListVariable staffList;
    [Tooltip("List of users in the current scenario")]
    public UserListVariable users;

    [Tooltip("The list of computers available in the current scenario")]
    public ComputerListVariable computers;
    
    [Tooltip("Currently selected object")]
    public GameObjectVariable selectedObject;

    //---------------------------------------------------------------------------
    public void UpdateUserStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      //xmlreader.Read(); // skip BOM ???

      XmlDocument xml_doc = new XmlDocument();

      xml_doc.Load(xmlreader);
      XmlNodeList updateNodes = xml_doc.SelectNodes("//user_status/user");
      foreach (XmlNode updateNode in updateNodes) {
        var username = updateNode["name"].InnerText;
        foreach (var user in users.Value) {
          if (user.Data.user_name == username) {
            UpdateUserStatus(user, updateNode);
          }
        }
        // Staff get updates through the user_status message as well
        foreach (var staff in staffList.Value) {
          if (staff.Data.user_name == username) {
            UpdateStaff(staff, updateNode);
          }
        }
      }
    }

    //---------------------------------------------------------------------------
    public void TrainSelectedUser(int trainingAmount) {
      if (selectedObject.Value != null) {
        var user = selectedObject.Value.GetComponent<UserBehavior>();
        if (user != null) {
          if (user.AddTraining(trainingAmount)) {
            XElement xml = new XElement("userEvent",
              new XElement("train",
                new XElement("name", user.Data.user_name),
                new XElement("level", user.Data.training)),
              new XElement("cost", trainingAmount * 250));

            IPCManagerScript.SendRequest(xml.ToString());
          }
        }
      }
    }

    //---------------------------------------------------------------------------
    private void UpdateUserStatus(UserBehavior user, XmlNode updateNode) {
      UpdateCharacterStatus(user, updateNode);

      var failedGoals = new HashSet<string>();
      XmlNodeList goal_nodes = updateNode.SelectNodes("//goal");
      foreach (XmlNode goal in goal_nodes) {
        string status = goal["status"].InnerText;
        if (status == "fail") {
          failedGoals.Add(goal["name"].InnerText);
        }
      }
      user.UpdateFailedGoals(failedGoals);

      string tmp = updateNode["training"].InnerText;
      if (int.TryParse(tmp, out int training)) {
        user.UpdateTraining(training);
      }

      string assetUsageStr = updateNode["assetUsage"].InnerText;
      if (int.TryParse(assetUsageStr, out int assetUsage)) {
        user.UpdateAssetUsage(assetUsage);
      }

      if (updateNode["assignedZone"] != null) {
        user.UpdateAssignedZone(updateNode["assignedZone"].InnerText);
      }
    }

    //---------------------------------------------------------------------------
    private void UpdateStaff(StaffBehavior staff, XmlNode updateNode) {
      UpdateCharacterStatus(staff, updateNode);
    }
    
    //---------------------------------------------------------------------------
    //Status fields common to both Users and Staff
    private void UpdateCharacterStatus(BaseCharacter character, XmlNode updateNode) {
      character.UpdateCurrentThought(updateNode["thought"].InnerText);
      
      string happinessStr = updateNode["happiness"].InnerText;
      if (int.TryParse(happinessStr, out int happiness)) {
        character.UpdateHappiness(happiness);
      }

      string productivityStr = updateNode["productivity"].InnerText;
      if (int.TryParse(productivityStr, out int productivity)) {
        character.UpdateProductivity(productivity);
      }

      if (bool.Parse(updateNode["speaking"].InnerText)) {
        character.UpdateSpeechText(updateNode["speakText"].InnerText);
      }
      else {
        character.UpdateSpeechText(null);
      }

      string visitingString = GetVisitingString(updateNode);
      
      if (visitingString != character.GetCharacterData().Visiting) {
        character.SetVisiting(visitingString);
        var targetObject = GetTarget(visitingString);
        if (character.CurrentNavTarget != targetObject) {
          character.CurrentNavTarget = targetObject;
          Debug.Log($"Set [{character.GetCharacterData().user_name}] nav target to [{targetObject.name}]");
        }
      }

      var stayStr = updateNode["stay"].InnerText;
      bool stay = stayStr == "1" ? true : false;
      character.UpdateStayAtVisitingObject(stay);
    }

    //--------------------------------------------------------------------------
    //The staff can be visit another user or a computer, but not both at the same time.
    private static string GetVisitingString(XmlNode updateNode) {
      var computer = updateNode["visitingComputer"].InnerText;
      var visiting = updateNode["visiting"].InnerText;
      string visitingTarget = "";
      if (!string.IsNullOrEmpty(computer)) {
        visitingTarget = computer;
      }
      else if (!string.IsNullOrEmpty(visiting)) {
        visitingTarget = visiting;
      }

      return visitingTarget;
    }
    
    //--------------------------------------------------------------------------
    //Get the GameObject representing the User or the Computer that has the supplied 
    //string as a name.
    private GameObject GetTarget(string targetStr) {
      var user = users.Value.Find(x => x.Data.user_name == targetStr);
      if (user) {
        return user.gameObject;
      }

      var computer = computers.Value.Find(x => x.Data.component_name == targetStr);
      if (computer) {
        return computer.gameObject;
      }

      return null;
    }
  }
}
