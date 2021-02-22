using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;
using Code.World_Objects.Staff;

namespace Code.World_Objects.User {
  public class UserManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of staff in the current scenario")]
    public StaffListVariable staffList;
    [Tooltip("List of users in the current scenario")]
    public UserListVariable users;
    [Tooltip("Currently selected object")]
    public GameObjectVariable selectedObject;

    //---------------------------------------------------------------------------
    public void UpdateUserStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      //xmlreader.Read(); // skip BOM ???

      XmlDocument xml_doc = new XmlDocument();

      xml_doc.Load(xmlreader);
      XmlNodeList userNodes = xml_doc.SelectNodes("//user_status/user");
      foreach (XmlNode userNode in userNodes) {
        var username = userNode["name"].InnerText;
        foreach (var user in users.Value) {
          if (user.Data.user_name == username) {
            UpdateUserStatus(user, userNode);
          }
        }
        // Staff get updates through the user_status message as well
        foreach (var staff in staffList.Value) {
          if (staff.Data.user_name == username) {
            UpdateStaff(staff, userNode);
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
    private void UpdateUserStatus(UserBehavior user, XmlNode userNode) {
      user.UpdateCurrentThought(userNode["thought"].InnerText);

      var failedGoals = new HashSet<string>();
      XmlNodeList goal_nodes = userNode.SelectNodes("//goal");
      foreach (XmlNode goal in goal_nodes) {
        string status = goal["status"].InnerText;
        if (status == "fail") {
          failedGoals.Add(goal["name"].InnerText);
        }
      }
      user.UpdateFailedGoals(failedGoals);

      string tmp = userNode["training"].InnerText;
      if (int.TryParse(tmp, out int training)) {
        user.UpdateTraining(training);
      }

      string happinessStr = userNode["happiness"].InnerText;
      if (int.TryParse(happinessStr, out int happiness)) {
        user.UpdateHappiness(happiness);
      }
      
      string productivityStr = userNode["productivity"].InnerText;
      if (int.TryParse(productivityStr, out int productivity)) {
        user.UpdateProductivity(productivity);
      }

      string assetUsageStr = userNode["assetUsage"].InnerText;
      if (int.TryParse(assetUsageStr, out int assetUsage)) {
        user.UpdateAssetUsage(assetUsage);
      }

      if (userNode["assignedZone"] != null) {
        user.UpdateAssignedZone(userNode["assignedZone"].InnerText);
      }
    }

    //---------------------------------------------------------------------------
    private void UpdateStaff(StaffBehavior staff, XmlNode userNode) {
      staff.UpdateCurrentThought(userNode["thought"].InnerText);

      string happinessStr = userNode["happiness"].InnerText;
      if (int.TryParse(happinessStr, out int happiness)) {
        staff.UpdateHappiness(happiness);
      }
      
      string productivityStr = userNode["productivity"].InnerText;
      if (int.TryParse(productivityStr, out int productivity)) {
        staff.UpdateProductivity(productivity);
      }
    }
  }
}
