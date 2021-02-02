using System;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using UnityEngine;
using Code.Factories;
using Code.Scriptable_Variables;

namespace Code.World_Objects.User {
  public class UserBehavior : MonoBehaviour {
    [SerializeField] private GameObject _maleChildGameObject;
    [SerializeField] private GameObject _femaleChildGameObject;
    [SerializeField] private GameObject _techChildGameObject;

    private static UserBehavior current_user;
    
    [SerializeField] private UserDataObject _data;

    //---------------------------------------------------------------------------
    public UserDataObject Data {
      get => _data;
      set {
        _data = value;
        if (_data.department == "Tech")
          _techChildGameObject.SetActive(true);
        else if (_data.gender == "female")
          _femaleChildGameObject.SetActive(true);
        else
          _maleChildGameObject.SetActive(true);
      }
    }
    
    //---------------------------------------------------------------------------
    private void Awake() {
      if (_maleChildGameObject) {_maleChildGameObject.SetActive(false);} 
      if (_femaleChildGameObject) {_femaleChildGameObject.SetActive(false);} 
      if (_techChildGameObject) {_techChildGameObject.SetActive(false);} 
    }

    //---------------------------------------------------------------------------
    public bool IsActiveUser() {
      if (Data.department != "Security" && Data.department != "Tech")
        return true;
      return false;
    }
    
    //---------------------------------------------------------------------------
    public void UpdateStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      //xmlreader.Read(); // skip BOM ???

      XmlDocument xml_doc = new XmlDocument();
      //Debug.Log("UserBehavior UpdateStatus xml is " + message);

      xml_doc.Load(xmlreader);
      XmlNodeList user_nodes = xml_doc.SelectNodes("//user_status/user");
      foreach (XmlNode user in user_nodes) {
        var user_name = user["name"].InnerText;
        //Debug.Log("the name is " + user_name);
        if (Data.user_name == user_name) {
          UpdateUserStatus(user);
        }
      }
    }

    //---------------------------------------------------------------------------
    private void UpdateUserStatus(XmlNode user) {
      Data.failed_goals.Clear();
      Data.current_thought = user["thought"].InnerText;
      //Debug.Log("thought for user " + this.user_name + " is " + this.current_thought);
      XmlNodeList goal_nodes = user.SelectNodes("//goal");
      foreach (XmlNode goal in goal_nodes) {
        string status = goal["status"].InnerText;
        if (status == "fail") {
          Data.failed_goals.Add(goal["name"].InnerText);
        }
      }

      string tmp = user["training"].InnerText;
      if (!int.TryParse(tmp, out Data.training)) {
        Debug.Log("Error: UserBehavior could not parse training " + tmp);
      }
    }

    //---------------------------------------------------------------------------
    public void AddTraining(int add_amount) {
      // adjust training based on given amount, using old game engine algorithm
      // and advise engine of new training value.
      if (Data.training <= 95) {
        int hack_cost = add_amount * 250;
        Data.training = Math.Max(add_amount * 4, 5) + Data.training;
        if (Data.training > 95) {
          Data.training = 95;
        }

        XElement xml = new XElement("userEvent",
          new XElement("train",
            new XElement("name", Data.user_name),
            new XElement("level", Data.training)),
          new XElement("cost", hack_cost));

        IPCManagerScript.SendRequest(xml.ToString());
      }
    }
  }
}
