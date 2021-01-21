using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using Code;
using Code.Factories;
using UnityEngine;

public class UserBehavior : MonoBehaviour {
  [SerializeField] private GameObject _maleChildGameObject;
  [SerializeField] private GameObject _femaleChildGameObject;
  [SerializeField] private GameObject _techChildGameObject;

  private static UserBehavior current_user;
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  
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
  public static UserBehavior GetNextUser() {
    UserBehavior first_user = null;
    bool gotit = false;
    foreach (KeyValuePair<string, UserBehavior> entry in UserFactory.user_dict) {
      UserBehavior user = entry.Value;
      if (!user.IsActiveUser())
        continue;
      if (gotit) {
        current_user = user;
        return user;
      }

      if (first_user == null)
        first_user = user;
      if (current_user == null) {
        current_user = user;
        return user;
      }

      if (user == current_user)
        gotit = true;
    }

    current_user = first_user;
    return first_user;
  }

  //---------------------------------------------------------------------------
  private bool IsActiveUser() {
    if (Data.department != "Security" && Data.department != "Tech")
      return true;
    return false;
  }
  
  //---------------------------------------------------------------------------
  public static void UpdateStatus(string message) {
    StringReader xmlreader = new StringReader(message);
    //xmlreader.Read(); // skip BOM ???

    XmlDocument xml_doc = new XmlDocument();
    //Debug.Log("UserBehavior UpdateStatus xml is " + message);

    xml_doc.Load(xmlreader);
    XmlNodeList user_nodes = xml_doc.SelectNodes("//user_status/user");
    foreach (XmlNode user in user_nodes) {
      string user_name = user["name"].InnerText;
      //Debug.Log("the name is " + user_name);
      if (!UserFactory.user_dict.ContainsKey(user_name)) //Debug.Log("UserBehavior name not in dictionary " + user_name);
        continue;

      UserBehavior user_script = UserFactory.user_dict[user_name];
      user_script.UpdateUserStatus(user);
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
  private void Configure() {
    if (menus.clicked.EndsWith("Configure")) {
      menus.clicked = "";
      ConfigureCanvas();
    }
  }

  //---------------------------------------------------------------------------
  private void ConfigureCanvas() {
    //Debug.Log("ConfigureCanvas");

    GameObject user_panel = menus.menu_panels["UserPanel"];
    UserConfigure user_config_script = (UserConfigure) user_panel.GetComponent(typeof(UserConfigure));
    user_config_script.SetUser(this);
    user_panel.SetActive(true);
    menus.ActiveScreen(user_panel.name);
  }

  //---------------------------------------------------------------------------
  public static void doItems() {
    /* find the user that brought up a menu, and call its menuItems method */
    string user_name = menus.MenuLevel(1);
    //Debug.Log("look in dict for " + component_name);
    UserBehavior script = UserFactory.user_dict[user_name];
    int level = ccUtils.SubstringCount(menus.clicked, ":");
    if (level == 1) {
      WindowRect = GUI.Window(1, WindowRect, script.MenuItems, "Item");
    }
    else {
      string submenu = menus.MenuLevel(2);
      switch (submenu) {
        case "Configure":
          script.Configure();
          break;
      }
    }
  }

  //---------------------------------------------------------------------------
  private void MenuItems(int id) {
    if (GUILayout.Button("Help"))
      menus.clicked = "help";

    else if (GUILayout.Button("Configure"))
      menus.clicked += ":Configure";
    else if (GUILayout.Button("Close menu")) menus.clicked = "";
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