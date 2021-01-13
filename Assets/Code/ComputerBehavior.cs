using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Policy;
using Code.Scriptable_Variables;
using UnityEngine;
using UnityEngine.UI;

/*
 * Represents computer attributes, inheriting from ComponentBehavior.
 */
public class ComputerBehavior : ComponentBehavior {
  private static readonly string COMPUTERS = "computers";

  [Tooltip("The variable containing the list of all the Computers currently in the scenario.")]
  [SerializeField] private ComputerListVariable computerListVariable;
  [Tooltip("The variable containing the list of all the Policies available to apply to Computers")]
  [SerializeField] private PolicyListVariable computerPolicyListVariable;
  
  private static Rect ConfigureRect = new Rect(10, 10, 900, 800);
  private static string hw_name;
  private readonly List<string> asset_list = new List<string>();
  private string assigned_user;

  private ComputerConfigure
    computer_config_script; /* menu of current configuration values shared between instances TBC static?*/

  private ConfigurationSettings config_settings;
  private readonly List<string> user_list = new List<string>(); // currently users & groups, TBD separate

  public static void LoadOneComputer(string computer_file) {
    GameObject computer;
    computer = GameObject.Find("Computer");
    //Debug.Log("user_app_path" + user_app_path + " file [" + computer_file+"]");
    string cdir = Path.Combine(GameLoadBehavior.user_app_path, COMPUTERS);
    string cfile = Path.Combine(cdir, computer_file);
    Debug.Log("computer " + cdir);
    GameObject new_c = Instantiate(computer, new Vector3(1.0F, 0, 0), Quaternion.identity);
    ComputerBehavior script = (ComputerBehavior) new_c.GetComponent(typeof(ComputerBehavior));
    script.SetFilePath(cfile);
    new_c.SetActive(true);
    script.LoadComponent();
    script.LoadComputerInfoFromFile();
    script.hw = hw_name;
    //This is the part that will hopefully load the correct assets from dict
    SkinnedMeshRenderer this_render = new_c.GetComponent<SkinnedMeshRenderer>();
    try {
      this_render.sharedMesh = CatalogBehavior.object_mesh_dict[script.hw];
    }
    catch (KeyNotFoundException) {
      Debug.Log("Key Exception in object_mesh_dict caused by " + script.hw);
    }

    try {
      this_render.material = CatalogBehavior.object_mat_dict[script.hw];
    }
    catch (KeyNotFoundException) {
      Debug.Log("Key Exception in object_mat_dict caused by  " + script.hw);
    }

    int pos = script.position;
    //Debug.Log("LoadComputers " + script.computer_name + " pos is " + pos);
    if (pos < 0) {
      Debug.Log("LoadOneComputer got invalid pos for " + script.component_name);
      return;
    }

    WorkSpaceScript.WorkSpace ws = WorkSpaceScript.GetWorkSpace(pos);
    int slot = ws.AddComputer(script.component_name);
    float xf, zf;
    ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
    //Debug.Log(ws.x + " " + ws.y + " " + xf + " " + zf);
    Vector3 v = new Vector3(xf, 0.5f, zf);
    new_c.transform.position = v;
  }

  public static void LoadAllComputers() {
    string cdir = Path.Combine(GameLoadBehavior.user_app_path, COMPUTERS);
    string[] clist = Directory.GetFiles(cdir);
    int i = 1;
    foreach (string computer_file in clist) {
      LoadOneComputer(computer_file);
      i++;
    }
  }

  private void LoadComputerInfoFromFile() {
    config_settings = new ConfigurationSettings(true, component_name, computerPolicyListVariable.Value);

    try {
      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        //Debug.("LoadComputer read from " + filePath);
        ccUtils.PositionAfter(reader, "Component");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag).Trim();
          if (value == null)
            continue;
          //Debug.Log("LoadComputer got " + value + " for tag " + tag);
          if (!config_settings.HandleConfigurationSetting(tag, value))
            switch (tag) {
              case "ComponentProceduralSettings":
                //special case to process all of the sub-elements
                using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""))) {
                  using (var substream = new StreamReader(stream)) {
                    string v = null;
                    do {
                      v = ccUtils.SDTNext(substream, out string t);
                      if (string.IsNullOrEmpty(v)) {
                        continue;
                      }
                      config_settings.HandleConfigurationSetting(t, v);
                    } while (v != null);
                  }
                }
                break;
              case "Assets":
                asset_list.Add(value);
                AssetBehavior asset = AssetBehavior.asset_dict[value];
                asset.SetComputer(this);
                break;
              case "AccessListLocal":
                user_list.Add(value);
                break;
              case "User":
                assigned_user = value;
                break;
              case "HW":
                hw_name = value;
                break;
            }
        } while (value != null);
      }
    }
    catch (Exception e) {
      Debug.LogError(e.Message + " " + e.StackTrace);
    }

    //add ourself to the computer list.
    var componentList = this.computerListVariable.Value;
    componentList.Add(this);
    computerListVariable.Value = new List<ComputerBehavior>(componentList);
  }

  public void ACLConfigure(string asset_name) {
    ConfigureRect = GUILayout.Window(2, ConfigureRect, DoACL, "ACL for " + asset_name);
  }

  //Refresh the UI with current configuration settings
  public void UpdateUI() {
    GameObject computer_panel = menus.menu_panels["ComputerPanel"];
    computer_config_script = (ComputerConfigure) computer_panel.GetComponent(typeof(ComputerConfigure));
    config_settings.ConfigureCanvas(this, computer_config_script);
    computer_config_script.SetAssets(asset_list, this);
    computer_config_script.SetComputers(computerListVariable.Value);
  }

  private void ConfigureCanvas() {
    //Debug.Log("ConfigureCanvas");

    GameObject computer_panel = menus.menu_panels["ComputerPanel"];
    menus.ActiveScreen(computer_panel.name);
    computer_panel.SetActive(true);

    computer_config_script = (ComputerConfigure) computer_panel.GetComponent(typeof(ComputerConfigure));
    config_settings.ConfigureCanvas(this, computer_config_script);

    computer_config_script.SetAssets(asset_list, this);
    computer_config_script.SetComputers(computerListVariable.Value);

    //computer_config_script.SetTest();
    //Debug.Log("return from ConfigureCanvas");
  }

  public void DoACL(int i) {
    Debug.Log("DoACL");
    GUILayout.BeginVertical();
  }

  public void HandleConfigure() {
    if (menus.clicked.EndsWith("Configure")) {
      menus.clicked = "";
      ConfigureCanvas();
    }
    else if (menus.MenuLevel(3) == "ACL") {
      ACLConfigure(menus.MenuLevel(4));
    }
  }

  /*  NOT USED, example of creation as part of OnGui 

  public void DoConfigure(int i)
  {
    Dictionary<string,bool> copy_dict = new Dictionary<string, bool>(this.proc_dict);
    //GUILayout.BeginArea(new Rect(25, 25, 150, 700));
    GUILayout.BeginHorizontal();
    GUILayout.BeginVertical();
    GUILayout.Label("Procedural Settings", label_style);
    foreach (KeyValuePair<string, bool> entry in copy_dict)
    {
      string label = ProceduralScript.proc_dict[entry.Key];
      bool newval = GUILayout.Toggle(entry.Value, label);
      if(newval != entry.Value)
      {
        //Debug.Log("ComputerConfig selected " + entry.Key+" value was "+entry.Value);
        this.proc_dict[entry.Key] = newval;
        XElement xml = new XElement("componentEvent",
          new XElement("name", this.component_name),
          new XElement("procSetting",
            new XElement("field", entry.Key+":"),
            new XElement("value", newval)));

        IPCManagerScript.SendRequest(xml.ToString());
        //Debug.Log("Value now " + this.proc_dict[entry.Key]);
      }
    }
    GUILayout.EndVertical();
    //GUILayout.EndArea();
    
    GUILayout.BeginVertical();
    GUILayout.Label("Password Length", label_style);
    DoToggleGroup(PWD_LEN);
    GUILayout.Label("Change Frequency", label_style);
    DoToggleGroup(PWD_CHANGE);
    GUILayout.Label("Password Complexity", label_style);
    DoToggleGroup(PWD_COMPLEX);
    GUILayout.EndVertical();
    GUILayout.EndHorizontal();
  }
  public void DoToggleGroup(string group_name)
  {
    Dictionary<string, bool> my_dict = this.group_dict[group_name];
    Dictionary<string, bool> copy_dict = new Dictionary<string, bool>(my_dict);
    foreach (KeyValuePair<string, bool> entry in copy_dict)
    {
      bool newval = GUILayout.Toggle(entry.Value, entry.Key);
      if (newval != entry.Value)
      {
        if (this.group_value[group_name] != null)
        {
          SetGroupValue(group_name, my_dict, this.group_value[group_name], false);
          //my_dict[this.group_value[group_name]] = false;
          if (entry.Key != this.group_value[group_name])
          {
            // new selected, turn it on 
  //my_dict[entry.Key] = true;
            SetGroupValue(group_name, my_dict, entry.Key, true);
            this.group_value[group_name] = entry.Key;
          }
          else
          {
            //toggle previous, so length now none ;
            this.group_value[group_name] = null;
          }
        }
        else
        {
          SetGroupValue(group_name, my_dict, entry.Key, true);
          this.group_value[group_name] = entry.Key;
        }
      }
    }
  }

  */

  //Call this when the computer should change the value of a Policy.
  public void PolicyValueChanged(Policy policy, bool isOn) {
    config_settings.ProceduralPolicyChanged(policy, isOn);
  }

  public void PasswordChanged(string group_name, Toggle toggle) {
    config_settings.PasswordChanged(group_name, toggle);
  }

  public void AssetClicked(GameObject go) {
    string asset_name = computer_config_script.GetCurrentAsset();


    Debug.Log("AssetClicked " + asset_name);
  }

  public static void RemoveComputer(string computer_name) {
    if (!computer_dict.ContainsKey(computer_name)) {
      Debug.Log("ERROR: RemoveComputer, no computer named " + computer_name);
      return;
    }

    ComponentBehavior bh = computer_dict[computer_name];
    Destroy(bh.gameObject);
  }
}