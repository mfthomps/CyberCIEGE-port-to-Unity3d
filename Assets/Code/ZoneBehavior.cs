using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Policy;
using Code.Scriptable_Variables;
using UnityEngine;
using UnityEngine.UI;

public class ZoneBehavior : MonoBehaviour {
  [SerializeField] private ZoneListVariable _zoneListVariable;
  [Tooltip("The variable containing the game's list of policies available to the Computers.")]
  [SerializeField] private PolicyListVariable computerPolicyListVariable;
  [Tooltip("The variable containing the game's list of physical security policies available to the Zones.")]
  [SerializeField] private PolicyListVariable physicalPolicyListVariable;
  
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  
  private static string root_zone_name; //May use to scale computer procedurally if I can't do it manually.
  private static Dictionary<string, ZoneBehavior> zone_dict = new Dictionary<string, ZoneBehavior>();
  public string zone_name;
  private ConfigurationSettings config_settings;

  // private string file_path;
  private int lrc_x;
  private int lrc_y;
  private PhysicalSettings phys_settings;
  private int ulc_x;
  private int ulc_y;

  private ZoneConfigure zone_config_script; /* menu of current configuration values shared between instances TBC static?*/

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


  public void LoadZone(string zoneFile) {
    config_settings = new ConfigurationSettings(false, "", computerPolicyListVariable.Value);
    phys_settings = new PhysicalSettings(physicalPolicyListVariable.Value);
    try {
      StreamReader reader = new StreamReader(zoneFile, Encoding.Default);
      using (reader) {
        string tag;
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

  public void DoPosition() {
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

 
  public void PolicyValueChanged(Policy policy, bool isOn) {
    config_settings.ProceduralPolicyChanged(policy, isOn);
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