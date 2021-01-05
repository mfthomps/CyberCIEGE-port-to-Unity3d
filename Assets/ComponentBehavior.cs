using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using UnityEngine;

public class ComponentBehavior : MonoBehaviour {
  /* static data */
  public static Dictionary<string, ComponentBehavior> computer_dict = new Dictionary<string, ComponentBehavior>();
  protected static GUIStyle label_style = new GUIStyle();
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  public static Texture2D background;
  public static ComponentBehavior current_component;

  public string component_name;
  public string description;
  public string hw;
  public int cost;
  public int position = -1;
  public List<string> network_list = new List<string>();
  public GUISkin guiSkin;
  protected string filePath;

  private void Start() {
    label_style.normal.textColor = Color.black;
  }

  private void OnMouseDown() {
    Debug.Log("down for " + filePath + " component_name " + component_name);
    if (component_name == null || component_name.Length == 0) {
      Debug.Log("Component name is empty");
    }

    //menus.clicked = "Component:" + this.component_name;
  }

  public static ComponentBehavior GetNextComponent() {
    ComponentBehavior first_component = null;
    bool gotit = false;
    Debug.Log("GetNextComponent, num is " + computer_dict.Count);
    foreach (KeyValuePair<string, ComponentBehavior> entry in computer_dict) {
      ComponentBehavior component = entry.Value;
      Debug.Log("check " + component.component_name);
      if (!component.IsActiveComponent())
        continue;
      if (gotit) {
        Debug.Log("got it, return " + component.component_name);
        current_component = component;
        return component;
      }

      if (first_component == null)
        first_component = component;
      if (current_component == null) {
        Debug.Log("current is null, return " + component.component_name);
        current_component = component;
        return component;
      }

      if (component == current_component)
        gotit = true;
    }

    Debug.Log("returning first " + first_component.component_name);
    current_component = first_component;
    return first_component;
  }

  public bool IsActiveComponent() {
    return true;
  }

  public void LoadComponent() {
    try {
      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        //Debug.("LoadComputer read from " + filePath);
        ccUtils.PositionAfter(reader, "Component");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value == null)
            continue;
          //Debug.Log("LoadComputer got " + value + " for tag " + tag);
          switch (tag) {
            case "Name":
              component_name = value;
              //Debug.Log("LoadComponent adding to dict: " + this.component_name);
              computer_dict.Add(component_name, this);
              break;
            case "PosIndex":
              if (!int.TryParse(value, out position)) Debug.Log("Error: LoadComponent position " + value);

              break;
            case "Network":
              //	Debug.Break();
              MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""));

              string network_name = ccUtils.SDTField(stream, "Name");
              network_list.Add(network_name);
              //Debug.Log("component " + this.component_name + " added network " + network_name);
              break;
          }
        } while (value != null);
      }
    }
    catch (Exception e) {
      Console.WriteLine(e.Message + "\n");
    }
  }

  public static void doItems() {
    /* find the computer that brought up a menu, and call its menuItems method */
    string component_name = menus.MenuLevel(1);
    Debug.Log("look in dict for " + component_name);
    if (!computer_dict.ContainsKey(component_name)) {
      Debug.Log("Error ComponentBehavior, doItems, not in computer_dict: " + component_name);
      menus.clicked = "";
      return;
    }

    ComponentBehavior script = computer_dict[component_name];
    int level = ccUtils.SubstringCount(menus.clicked, ":");
    if (level == 1) {
      WindowRect = GUI.Window(1, WindowRect, script.MenuItems, "Item");
    }
    else {
      string submenu = menus.MenuLevel(2);
      Debug.Log("submenu is <" + submenu + "> level is " + level + " clicked " + menus.clicked);
      switch (submenu) {
        case "Networks":
          if (level == 3) {
            string operation = menus.MenuLevel(3);
            Debug.Log("level 3, operation " + operation);
            if (operation == "Connect")
              WindowRect = GUI.Window(2, WindowRect, script.ConnectList, operation);
            else if (operation == "Disconnect")
              WindowRect = GUI.Window(2, WindowRect, script.DisconnectList, operation);
          }
          else {
            WindowRect = GUI.Window(3, WindowRect, script.NetworkItems, "Item");
          }

          break;
        case "Configure":
          Debug.Log("is configure");
          script.Configure();
          break;
      }
    }
  }

  private void MenuItems(int id) {
    if (GUILayout.Button("Help"))
      menus.clicked = "help";
    else if (GUILayout.Button("Networks"))
      menus.clicked += ":Networks";
    else if (GUILayout.Button("Configure"))
      menus.clicked += ":Configure";
    else if (GUILayout.Button("Close menu")) menus.clicked = "";
  }

  private void ConnectList(int id) {
    List<string> copy_list = NetworkBehavior.network_list.ToList();
    bool is_internet = false;
    if (!bool.TryParse(OrganizationScript.GetValue("Internet"), out is_internet))
      Debug.Log("Error: ConnectList parsing internet " + OrganizationScript.GetValue("Internet"));

    if (gameObject.name.StartsWith("Device") && is_internet) copy_list.Add(OrganizationScript.GetValue("InternetName"));

    //Debug.Log("NetworkList len of list is " + network_list.Count);
    foreach (string network in copy_list)
      if (!network_list.Contains(network))
        if (GUILayout.Button(network)) {
          Debug.Log("selected " + network);
          menus.clicked = "";
          XElement xml = new XElement("componentEvent",
            new XElement("name", component_name),
            new XElement("networkConnect", network));

          Debug.Log(xml.ToString());
          network_list.Add(network);
          IPCManagerScript.SendRequest(xml.ToString());
        }

    if (menus.clicked.Length > 0)
      if (GUILayout.Button("Close menu"))
        menus.clicked = "";
  }

  private void DisconnectList(int id) {
    Debug.Log("NetworkList len of list is " + network_list.Count);
    List<string> copy_list = network_list.ToList();
    foreach (string network in copy_list)
      if (GUILayout.Button(network)) {
        Debug.Log("selected " + network);
        menus.clicked = "";
        XElement xml = new XElement("componentEvent",
          new XElement("name", component_name),
          new XElement("networkDisconnect", network));

        Debug.Log(xml);
        network_list.Remove(network);
        IPCManagerScript.SendRequest(xml.ToString());
      }

    if (menus.clicked.Length > 0)
      if (GUILayout.Button("Close menu"))
        menus.clicked = "";
  }

  private void NetworkItems(int id) {
    if (GUILayout.Button("Connect"))
      menus.clicked += ":Connect";
    else if (GUILayout.Button("Disconnect"))
      menus.clicked += ":Disconnect";
    else if (GUILayout.Button("Close menu")) menus.clicked = "";

    Debug.Log("NetworkItems clicked now " + menus.clicked);
  }

  public void SetFilePath(string path) {
    filePath = path;
  }

  public void Configure() {
    Debug.Log("ComponentBehavior Configure");
    if (gameObject.name.StartsWith("Computer")) {
      ComputerBehavior computer_script = (ComputerBehavior) this;
      //menus.clicked = "";
      //computer_script.ComputerConfigure();
      computer_script.HandleConfigure();
    }
    else {
      Debug.Log("do support for devices yet");
      menus.clicked = "";
    }
  }
}