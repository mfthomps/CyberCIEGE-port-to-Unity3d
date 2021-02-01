using System.Collections.Generic;
using Code;
using Code.Policies;
using UnityEngine;
using UnityEngine.UI;

public class ZoneBehavior : MonoBehaviour {
  private static Rect WindowRect = new Rect(10, 10, 250, 300);

  private ZoneConfigure zone_config_script; /* menu of current configuration values shared between instances TBC static?*/
  
  [Tooltip("The data related to this Zone.")]
  [SerializeField] private ZoneDataObject _data;

  public ZoneDataObject Data {
    get => _data;
    set => _data = value;
  }

  public static void doItems(IEnumerable<ZoneBehavior> zoneBehaviors) {
    WindowRect = GUI.Window(1, WindowRect, func: delegate(int i) {
      foreach (var zone in zoneBehaviors)
        if (GUILayout.Button(zone.Data.ZoneName)) {
          menus.clicked = "";
          zone.ConfigureCanvas();
        }
    }, text: "Zones");
  }
  
  private void ConfigureCanvas() {
    GameObject zone_panel = menus.menu_panels["ZonePanel"];
    menus.ActiveScreen(zone_panel.name);

    zone_config_script = (ZoneConfigure) zone_panel.GetComponent(typeof(ZoneConfigure));
    Data.ConfigSettings.ConfigureCanvas(this, zone_config_script);
    Data.PhysSettings.ConfigureCanvas(this, zone_config_script);
    zone_panel.SetActive(true);
  }
 
  public void PolicyValueChanged(Policy policy, bool isOn) {
    Data.ConfigSettings.ProceduralPolicyChanged(policy, isOn);
  }

  public void PhysChanged(Toggle toggle) {
    Data.PhysSettings.PhysChanged(toggle);
  }

  public void PasswordChanged(string group_name, Toggle toggle) {
    Data.ConfigSettings.PasswordChanged(group_name, toggle);
  }

  public void AccessChanged(Toggle toggle) {
    Data.PhysSettings.AccessChanged(toggle);
  }
}