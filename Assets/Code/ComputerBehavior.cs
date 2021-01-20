using System.Collections.Generic;
using System.IO;
using System.Text;
using Code;
using Code.Factories;
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

  public void LoadOneComputer(string computer_file) {
    string cdir = Path.Combine(GameLoadBehavior.user_app_path, COMPUTERS);
    string cfile = Path.Combine(cdir, computer_file);
    
    SetFilePath(cfile);
    gameObject.SetActive(true);
    LoadComponent();
    LoadComputerInfoFromFile();
    hw = hw_name;
    //This is the part that will hopefully load the correct assets from dict
    SkinnedMeshRenderer this_render = GetComponent<SkinnedMeshRenderer>();
    try {
      this_render.sharedMesh = CatalogBehavior.object_mesh_dict[hw];
    }
    catch (KeyNotFoundException) {
      Debug.Log("Key Exception in object_mesh_dict caused by " + hw);
    }

    try {
      this_render.material = CatalogBehavior.object_mat_dict[hw];
    }
    catch (KeyNotFoundException) {
      Debug.Log("Key Exception in object_mat_dict caused by  " + hw);
    }

    int pos = position;
    //Debug.Log("LoadComputers " + script.computer_name + " pos is " + pos);
    if (pos < 0) {
      Debug.Log("LoadOneComputer got invalid pos for " + component_name);
      return;
    }

    WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
    int slot = ws.AddComputer(component_name);
    float xf, zf;
    ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
    //Debug.Log(ws.x + " " + ws.y + " " + xf + " " + zf);
    Vector3 v = new Vector3(xf, 0.5f, zf);
    transform.position = v;
  }

  private void LoadComputerInfoFromFile() {
    config_settings = new ConfigurationSettings(true, component_name, computerPolicyListVariable.Value);
    
    StreamReader reader = new StreamReader(filePath, Encoding.Default);
    using (reader) {
      string tag;
      //Debug.("LoadComputer read from " + filePath);
      ccUtils.PositionAfter(reader, "Component");
      string value = null;
      do {
        value = ccUtils.SDTNext(reader, out tag);
        if ((value == null) || (tag == null))
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
              AssetBehavior asset = AssetFactory.asset_dict[value];
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