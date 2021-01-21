using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using Code;
using Code.Factories;
using Code.Scriptable_Variables;
using UnityEngine;

public class ComponentBehavior : MonoBehaviour {
  [SerializeField] private StringStringVariable _organizationDict;

  public virtual ComponentDataObject Data { get; set; }
  
  /* static data */
  private static GUIStyle label_style = new GUIStyle();
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  private static ComponentBehavior current_component;

  private void Start() {
    label_style.normal.textColor = Color.black;
  }
  
  public static ComponentBehavior GetNextComponent() {
    ComponentBehavior first_component = null;
    bool gotit = false;
    foreach (KeyValuePair<string, ComponentBehavior> entry in ComponentFactory.computer_dict) {
      ComponentBehavior component = entry.Value;
      if (!component.IsActiveComponent())
        continue;
      if (gotit) {
        current_component = component;
        return component;
      }

      if (first_component == null)
        first_component = component;
      if (current_component == null) {
        current_component = component;
        return component;
      }

      if (component == current_component)
        gotit = true;
    }
    
    current_component = first_component;
    return first_component;
  }

  public bool IsActiveComponent() {
    return true;
  }

  public static void doItems() {
    /* find the computer that brought up a menu, and call its menuItems method */
    string component_name = menus.MenuLevel(1);
    //Debug.Log("look in dict for " + component_name);
    if (!ComponentFactory.computer_dict.ContainsKey(component_name)) {
      Debug.Log("Error ComponentBehavior, doItems, not in computer_dict: " + component_name);
      menus.clicked = "";
      return;
    }

    ComponentBehavior script = ComponentFactory.computer_dict[component_name];
    int level = ccUtils.SubstringCount(menus.clicked, ":");
    if (level == 1) {
      WindowRect = GUI.Window(1, WindowRect, script.MenuItems, "Item");
    }
    else {
      string submenu = menus.MenuLevel(2);
      //Debug.Log("submenu is <" + submenu + "> level is " + level + " clicked " + menus.clicked);
      switch (submenu) {
        case "Networks":
          if (level == 3) {
            string operation = menus.MenuLevel(3);
            //Debug.Log("level 3, operation " + operation);
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
    if (!bool.TryParse(_organizationDict["Internet"], out is_internet))
      Debug.Log("Error: ConnectList parsing internet " + _organizationDict["Internet"]);

    if (gameObject.name.StartsWith("Device") && is_internet) copy_list.Add(_organizationDict["InternetName"]);

    //Debug.Log("NetworkList len of list is " + network_list.Count);
    foreach (string network in copy_list)
      if (!Data.network_list.Contains(network))
        if (GUILayout.Button(network)) {
          Debug.Log("selected " + network);
          menus.clicked = "";
          XElement xml = new XElement("componentEvent",
            new XElement("name", Data.component_name),
            new XElement("networkConnect", network));

          Debug.Log(xml.ToString());
          Data.network_list.Add(network);
          IPCManagerScript.SendRequest(xml.ToString());
        }

    if (menus.clicked.Length > 0)
      if (GUILayout.Button("Close menu"))
        menus.clicked = "";
  }

  private void DisconnectList(int id) {
    Debug.Log("NetworkList len of list is " + Data.network_list.Count);
    List<string> copy_list = Data.network_list.ToList();
    foreach (string network in copy_list)
      if (GUILayout.Button(network)) {
        Debug.Log("selected " + network);
        menus.clicked = "";
        XElement xml = new XElement("componentEvent",
          new XElement("name", Data.component_name),
          new XElement("networkDisconnect", network));

        Debug.Log(xml);
        Data.network_list.Remove(network);
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

    //Debug.Log("NetworkItems clicked now " + menus.clicked);
  }

  private void Configure() {
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