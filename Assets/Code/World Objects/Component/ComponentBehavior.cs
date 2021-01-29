using System.Collections.Generic;
using Code;
using Code.Factories;
using Code.Scriptable_Variables;
using UnityEngine;

public class ComponentBehavior : MonoBehaviour {
  [Header("Input Variables")]
  [SerializeField] private StringStringVariable _organizationDict;
  [Tooltip("The variable containing the list of all the Networks currently in the scenario.")]
  [SerializeField] private NetworkListVariable networkListVariable;

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
    else if (GUILayout.Button("Configure"))
      menus.clicked += ":Configure";
    else if (GUILayout.Button("Close menu")) menus.clicked = "";
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