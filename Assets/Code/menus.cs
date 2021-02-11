﻿using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;

public class menus : MonoBehaviour {
  private static readonly GUIStyle labelStyle = new GUIStyle();
  public static string clicked = "";

  [SerializeField] private GUISkin guiSkin;
  
  [Header("Output Events")]
  [Tooltip("Save scenario")]
  public GameEvent save;
  [Tooltip("Quit scenario")]
  public GameEvent quit;

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


  private bool inHelp;
  private Texture2D black;
  private GUIStyle helpStyle;
  private Rect WindowRect = new Rect(10, 10, 250, 300);

  // Use this for initialization
  private void Start() {
    Debug.Log("menus start");

    helpStyle = new GUIStyle();
    black = (Texture2D) Resources.Load("Materials/black");

    helpStyle.normal.background = black;
    helpStyle.normal.textColor = Color.white;

    labelStyle.normal.textColor = Color.black;
  }

  // --------------------------------------------------------------------------
  public void OpenContextMenu() {
    if (string.IsNullOrEmpty(clicked)) {
      clicked = "menu";
    }
    else if (clicked == "menu") {
      clicked = "";
    }
  }

  private void OnGUI() {
    GUI.skin = guiSkin;
    checkSelect();
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
    if (clicked == "menu") {
      WindowRect = GUI.Window(1, WindowRect, MenuItemsFunc, "Menu");
    }
    else if (clicked == "help") {
      //Application.OpenURL("file://" + startup.helpHome + "/README.html");
      clicked = "";
    }
    else if (clicked == "Save") {
      save?.Raise();
    }
  }

  private void MenuItemsFunc(int id) {
    if (GUILayout.Button("Help")) {
      clicked = "help";
    }
    else if (GUILayout.Button("Save")) {
      clicked = "Save";
    }
    else if (GUILayout.Button("Quit")) {
      clicked = "";
      Debug.Log("quit from menu");
      quit?.Raise();
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