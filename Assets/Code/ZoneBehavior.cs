using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using UnityEngine;
using UnityEngine.UI;

public class ZoneBehavior : MonoBehaviour {
  [SerializeField] private ZoneListVariable _zoneListVariable;
  
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  
  private static string root_zone_name; //May use to scale computer procedurally if I can't do it manually.
  private static Dictionary<string, ZoneBehavior> zone_dict = new Dictionary<string, ZoneBehavior>();
  public string zone_name;
  private ConfigurationSettings config_settings;

  private string file_path;
  private int lrc_x;
  private int lrc_y;
  private PhysicalSettings phys_settings;
  private int ulc_x;
  private int ulc_y;

  private ZoneConfigure zone_config_script; /* menu of current configuration values shared between instances TBC static?*/

  private static void LoadOneZone(string zone_file, Color color) {
    GameObject zone = GameObject.Find("Zone");
    //Debug.Log("user_app_path" + user_app_path + " file [" + User_file+"]");
    string cfile = Path.Combine(GameLoadBehavior.user_app_path, zone_file);
    //Debug.Log("user " + cdir);
    GameObject new_c = Instantiate(zone, new Vector3(1.0F, 0, 0), Quaternion.identity);
    new_c.GetComponent<Renderer>().material.color = color;
    ZoneBehavior script = (ZoneBehavior) new_c.GetComponent(typeof(ZoneBehavior));
    script.SetFilePath(cfile);
    new_c.SetActive(true);
    script.LoadZone();
    script.DoPosition();
  }

  public static void doItems() {
    WindowRect = GUI.Window(1, WindowRect, ZoneMenu, "Zones");
  }

  private static void ZoneMenu(int id) {
    foreach (string key in zone_dict.Keys)
      if (GUILayout.Button(key)) {
        ZoneBehavior script = zone_dict[key];
        menus.clicked = "";
        script.ConfigureCanvas();
      }
  }

  private void SetFilePath(string path) {
    file_path = path;
  }

  public static void LoadZones() {
    var colors = new Color[6];
    colors[0] = Color.cyan;
    colors[1] = Color.red;
    colors[2] = Color.green;
    colors[3] = Color.blue;
    string zone_dir = Path.Combine(GameLoadBehavior.user_app_path, "zones");
    string[] clist = Directory.GetFiles(zone_dir);
    int i = 0;
    foreach (string zone_file in clist)
      if (zone_file.EndsWith(".sdf")) {
        LoadOneZone(zone_file, colors[i]);
        i++;
      }
  }

  private void LoadZone() {
    config_settings = new ConfigurationSettings(false, "");
    phys_settings = new PhysicalSettings();
    try {
      StreamReader reader = new StreamReader(file_path, Encoding.Default);
      using (reader) {
        string tag;
        //Debug.Log("LoadUser read from " + file_path);
        ccUtils.PositionAfter(reader, "Zone");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value == null)
            continue;
          if (value == "") {
            //Debug.Log("ZoneBehavior empty value");
            continue;
          }

          if (!config_settings.HandleConfigurationSetting(tag, value))
            if (!phys_settings.HandleConfigurationSetting(tag, value)
            ) //Debug.Log("LoadUser got " + value + " for tag " + tag);
              switch (tag) {
                case "Name":
                  zone_name = value;
                  //Debug.Log("LoadComponent adding to dict: " + this.user_name);
                  zone_dict.Add(zone_name, this);
                  config_settings.SetName(value);
                  string lowerName = value.ToLower();
                  if (lowerName.Contains("entire") && root_zone_name == null) root_zone_name = zone_name;

                  break;
                case "ULC":
                  string[] parts = value.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                  if (!int.TryParse(parts[0], out ulc_x)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return;
                  }

                  if (!int.TryParse(parts[1], out ulc_y)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return;
                  }

                  break;
                case "LRC":
                  parts = value.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                  if (!int.TryParse(parts[0], out lrc_x)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return;
                  }

                  if (!int.TryParse(parts[1], out lrc_y)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return;
                  }

                  break;
              }
        } while (value != null);
      }
    }
    catch (Exception e) {
      Console.WriteLine(e.Message + "\n");
    }

    //add ourself to the zone list variable.
    var zoneList = _zoneListVariable.Value;
    zoneList.Add(this);
    _zoneListVariable.Value = new List<ZoneBehavior>(zoneList);
  }

  private void DoPosition() {
    Debug.Log("zone " + zone_name + " " + ulc_x + " " + ulc_y + " " + lrc_x + " " + lrc_y);
    int left = ulc_x;
    int right = lrc_x;
    int top = ulc_y;
    int bottom = lrc_y;
    Vector3 scale = new Vector3();
    Vector3 pos = new Vector3();
    pos.x = left + (right - left) / 2;
    pos.z = bottom + (top - bottom) / 2;
    transform.position = pos;
    scale.x = (right - left) / 10.0f;
    scale.z = (top - bottom) / 10.0f;

    scale.y = 1;
    transform.localScale = scale;
  }

  private void ConfigureCanvas() {
    Debug.Log("ZoneBehavior ConfigureCanvas");

    GameObject zone_panel = menus.menu_panels["ZonePanel"];
    menus.ActiveScreen(zone_panel.name);

    zone_config_script = (ZoneConfigure) zone_panel.GetComponent(typeof(ZoneConfigure));
    config_settings.ConfigureCanvas(this, zone_config_script);
    phys_settings.ConfigureCanvas(this, zone_config_script);
    zone_panel.SetActive(true);
  }

  public void ProcChanged(Toggle toggle) {
    config_settings.ProcChanged(toggle);
  }

  public void PhysChanged(Toggle toggle) {
    phys_settings.PhysChanged(toggle);
  }

  public void PasswordChanged(string group_name, Toggle toggle) {
    config_settings.PasswordChanged(group_name, toggle);
  }

  public void AccessChanged(Toggle toggle) {
    phys_settings.AccessChanged(toggle);
  }
}