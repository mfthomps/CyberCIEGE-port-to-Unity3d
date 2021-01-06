using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class menus : MonoBehaviour {
  private static readonly GUIStyle labelStyle = new GUIStyle();
  public static string clockLabelString = "001000";
  public static string clicked = "";
  private static MaxCamera cameraScript;
  private static GameObject mainCamera;
  private static GameObject backdrop;
  private static string clicked_was = "";

  public static Dictionary<string, GameObject> menu_panels = new Dictionary<string, GameObject>();

  /* coordinate screens that are panels and are guilayout's.  Panels
   * added in their respective *Configure scripts.  Guilayouts in start */
  public static Dictionary<string, int> screen_dict = new Dictionary<string, int>();

  /* only updated for panel screens, not for guilayout's */
  public static string active_screen = "office";
  public static int UI_SCREEN_DEBRIEF = 1;
  public static int UI_SCREEN_OFFICE = 2;
  public static int UI_SCREEN_NETWORK = 3;
  public static int UI_SCREEN_COMPONENT = 4;
  public static int UI_SCREEN_ZONE = 5;
  public static int UI_SCREEN_USER = 6;
  public static int UI_SCREEN_ASSET = 7;
  public static int UI_SCREEN_GAME = 8;
  public static int UI_SCREEN_BUY = 9;
  public static int UI_SCREEN_SOFTWARE = 10;
  public static int UI_SCREEN_ITMANAGE = 11;
  public static int UI_SCREEN_OBJECTIVE = 12;
  public static int UI_SCREEN_FILTER = 13;
  public static int UI_SCREEN_ACL = 14;
  public static int UI_SCREEN_LABEL = 15;
  public static int UI_SCREEN_LINK_ENCR = 16;
  public static int UI_SCREEN_VPN = 17;
  public static int UI_SCREEN_EMAIL = 18;
  public static int UI_SCREEN_SSL_CLIENT = 19;
  public static int UI_SCREEN_SSL_SERVER = 20;
  public static int UI_SCREEN_SL_NET = 21;
  public static int UI_SCREEN_ML_NET = 22;
  public static int UI_SCREEN_ATTACKLOG = 23;

  public static int UI_SCREEN_CYBER_CHARK = 24;
  public GUISkin guiSkin;
  public Texture2D background, LOGO;
  public bool DragWindow = true;
  public string levelToLoadWhenClickedPlay = "";
  public string[] AboutTextLines = new string[0];
  public string editableText;
  public int gridSelect = -1;
  public Vector2 scrollPosition;
  public bool inHelp;

  public RectTransform myPanel;
  public GameObject myTextPrefab;
  private Texture2D black;
  private GUIStyle helpStyle;
  private Color savedColor;
  private Rect WindowRect = new Rect(10, 10, 250, 300);
  private Color workingColor;

  // Use this for initialization
  private void Start() {
    Debug.Log("menus start");

    helpStyle = new GUIStyle();
    black = (Texture2D) Resources.Load("Materials/black");

    helpStyle.normal.background = black;
    helpStyle.normal.textColor = Color.white;
    mainCamera = GameObject.Find("Main Camera");
    //mainCamera.transform.position = pos;
    cameraScript = (MaxCamera) Camera.main.GetComponent(typeof(MaxCamera));

    labelStyle.normal.textColor = Color.black;

    /* create dictionary of menu/gui panels so they can be deactivated and yet 
     * still found by the menus script and whatever else may need to name them. */
    GameObject acl_panel = GameObject.Find("ACLPanel");
    menu_panels["ACLPanel"] = acl_panel;
    acl_panel.SetActive(false);

    GameObject computer_panel = GameObject.Find("ComputerPanel");
    menu_panels["ComputerPanel"] = computer_panel;
    computer_panel.SetActive(false);

    GameObject zone_panel = GameObject.Find("ZonePanel");
    menu_panels["ZonePanel"] = zone_panel;
    zone_panel.SetActive(false);

    GameObject user_panel = GameObject.Find("UserPanel");
    menu_panels["UserPanel"] = user_panel;
    user_panel.SetActive(false);

    GameObject message_panel = GameObject.Find("MessagePanel");
    menu_panels["MessagePanel"] = message_panel;
    message_panel.SetActive(false);

    GameObject yesno_panel = GameObject.Find("YesNoPanel");
    menu_panels["YesNoPanel"] = yesno_panel;
    yesno_panel.SetActive(false);

    GameObject help_tip_panel = GameObject.Find("HelpTip");
    menu_panels["HelpTip"] = help_tip_panel;
    help_tip_panel.SetActive(false);

    screen_dict["Objectives"] = UI_SCREEN_OBJECTIVE;
    screen_dict["AttackLog"] = UI_SCREEN_ATTACKLOG;
  }

  // Update is called once per frame
  private void Update() {
    if (Input.GetKeyDown("h")) {
      Debug.Log("h key is down");
      Vector3 pos = GameLoadBehavior.home_pos;

      mainCamera.transform.rotation = GameLoadBehavior.home_rot;
      cameraScript.setPosition(pos);
    }
    else if (Input.GetKeyDown("u")) {
      UserBehavior ub = UserBehavior.GetNextUser();
      //Debug.Log("next user is " + ub.user_name);
      if (ub == null) {
        Debug.Log("Error: menus, no next user");
        return;
      }

      GameObject user = ub.gameObject;
      cameraScript.setPosition(user.transform.position);
    }
    else if (Input.GetKeyDown("?")) {
      Debug.Log("got dump keydown");
      IPCManagerScript.SendRequest("dump_conditions");
    }
    else if (Input.GetKeyDown("d")) {
      Debug.Log("got d keydown");
      IPCManagerScript.SendRequest("dump_conditions");
    }
    else if (Input.GetKeyDown("c")) {
      ComponentBehavior ub = ComponentBehavior.GetNextComponent();
      GameObject computer = ub.gameObject;
      Debug.Log("next component is " + ub.component_name + " pos x" + computer.transform.position.x);
      cameraScript.setPosition(computer.transform.position);
    }
    else if (Input.GetMouseButtonDown(1) && !Input.GetKey(KeyCode.LeftAlt)) {
      menu_panels["HelpTip"].SetActive(false);
      Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
      RaycastHit hit;

      if (Physics.Raycast(ray, out hit, 100)) {
        //Debug.Log("raycast on " + hit.transform.gameObject.name);
        if (hit.transform.gameObject.name.StartsWith("Computer") ||
            hit.transform.gameObject.name.StartsWith("Device")) {
          ComponentBehavior bh = (ComponentBehavior) hit.transform.gameObject.GetComponent(typeof(ComponentBehavior));

          //computer_canvas.SetActive(true);
          if (hit.transform.gameObject.gameObject.name.StartsWith("Computer")) {
            ComputerBehavior computer_script =
              (ComputerBehavior) hit.transform.gameObject.GetComponent(typeof(ComputerBehavior));
            //computer_script.ConfigureCanvas();
            //clicked = "";
          }

          clicked = "Component:" + bh.component_name;
        }
        else if (hit.transform.gameObject.name.StartsWith("User")) {
          UserBehavior bh = (UserBehavior) hit.transform.gameObject.GetComponent(typeof(UserBehavior));
          clicked = "User:" + bh.user_name;
        }
      }
      else {
        if (Input.GetMouseButtonDown(1)) {
          clicked = "menu";
          menu_panels["HelpTip"].SetActive(false);
        }
      }
    }
  }

  private void OnGUI() {
    GUI.skin = guiSkin;
    checkSelect();
    //Debug.Log("time is " + GameStatusScript.time_label);
    GUI.Label(new Rect(200, 5, 475, 20), GameStatusScript.time_label, labelStyle);
    GUI.Label(new Rect(200, 35, 475, 50), GameStatusScript.cash_label, labelStyle);
    //Debug.Log("bonus label " + GameStatusScript.bonus_label);
    GUI.Label(new Rect(700, 65, 875, 80), GameStatusScript.bonus_label, labelStyle);
    //GUI.Label(new Rect(20, 55, 275, 60), "the goose drank", labelStyle);
  }


  private void checkSelect() {
    if (clicked_was == "" && clicked != "") // new click, advise engine
      IPCManagerScript.DialogUp();
    else if (clicked_was != "" && clicked == "" && active_screen == "office") IPCManagerScript.DialogClosed();

    if (clicked_was == "menu" && clicked != "" && clicked != "menu") {
      // new click, advise engine
      //Debug.Log("clicked is " + clicked);
      if (screen_dict.ContainsKey(clicked)) IPCManagerScript.SendRequest("on_screen:" + screen_dict[clicked]);
    }
    else if (clicked_was != "menu" && clicked_was != "" && clicked == "" && active_screen == "office") {
      if (screen_dict.ContainsKey(clicked_was)) IPCManagerScript.SendRequest("on_screen:" + UI_SCREEN_OFFICE);
    }

    clicked_was = clicked;
    //Debug.Log("checkSelect");

    //if (clicked == "" && !inHelp && Event.current.type != EventType.MouseDown)
    if (clicked == "" && !inHelp) {
      string pplabel = "Pause";
      if (GameStatusScript.isPaused()) pplabel = "Play";

      //Debug.Log( && Event.current.type == EventType.Layout
      GUILayout.BeginArea(new Rect(5, 5, 150, 100));

      GUILayout.BeginHorizontal();
      if (GUILayout.Button(pplabel)) //Debug.Log("got button, send " + pplabel);
        IPCManagerScript.SendRequest(pplabel);
      //startup.doUserPause();

      GUILayout.EndHorizontal();
      GUILayout.EndArea();
    }
    else if (clicked == "menu") {
      WindowRect = GUI.Window(1, WindowRect, MenuItemsFunc, "Menu");
    }
    else if (clicked == "help") {
      //Application.OpenURL("file://" + startup.helpHome + "/README.html");
      clicked = "";
    }
    else if (clicked == "Buy") {
      CatalogBehavior.doMenu();
    }
    else if (clicked == "Hire") {
      ITStaffBehavior.doItems();
    }
    else if (clicked == "Objectives") {
      ObjectivesBehavior.doItems();
    }
    else if (clicked == "Zones") {
      ZoneBehavior.doItems();
    }
    else if (clicked == "Save") {
      string fname = Path.Combine(GameLoadBehavior.user_app_path, "debug_save.sdf");
      IPCManagerScript.SendRequest("save:" + fname);
    }
    //else if (clicked == "Servers" || clicked == "Workstations" || clicked == "Devices" ||clicked == "Buying")
    else if (clicked.StartsWith("Catalog:")) {
      CatalogBehavior.doItems();
    }
    else if (clicked.StartsWith("Component:")) {
      ComponentBehavior.doItems();
    }
    else if (clicked.StartsWith("User:")) {
      UserBehavior.doItems();
    }
  }

  private void MenuItemsFunc(int id) {
    if (GUILayout.Button("Help")) {
      clicked = "help";
    }
    else if (GUILayout.Button("Buy")) {
      clicked = "Buy";
    }
    else if (GUILayout.Button("Hire")) {
      clicked = "Hire";
    }
    else if (GUILayout.Button("Objectives")) {
      clicked = "Objectives";
    }
    else if (GUILayout.Button("Zones")) {
      clicked = "Zones";
    }
    else if (GUILayout.Button("Save")) {
      clicked = "Save";
    }
    else if (GUILayout.Button("Quit")) {
      clicked = "";
      Application.Quit();
      Debug.Log("quit from menu");
    }
    else if (GUILayout.Button("Close menu")) {
      clicked = "";
    }
  }

  public static string MenuLevel(int level) {
    string[] parts = clicked.Split(':');
    return parts[level];
  }

  public static void ActiveScreen(string screen) {
    active_screen = screen;
    Debug.Log("menues ActiveScreen for " + screen);
    IPCManagerScript.SendRequest("on_screen:" + screen_dict[screen]);
  }

  public static void ClosedScreen(string screen) {
    active_screen = "office";
    IPCManagerScript.SendRequest("on_screen:" + UI_SCREEN_OFFICE);
    IPCManagerScript.DialogClosed();
  }
}