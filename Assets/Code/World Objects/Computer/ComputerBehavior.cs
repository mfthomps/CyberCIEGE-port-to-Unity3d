using Code.Factories;
using Code.Scriptable_Variables;
using UnityEngine;
using UnityEngine.UI;
using Code.Policies;

/*
 * Represents computer attributes, inheriting from ComponentBehavior.
 */
namespace Code {
  public class ComputerBehavior : ComponentBehavior {
    [Tooltip("The variable containing the list of all the Computers currently in the scenario.")]
    [SerializeField] private ComputerListVariable computerListVariable;

    public override ComponentDataObject Data {
      get { return _data; }
      set {
        //TODO I'm not excited about overriding this and casting to our derived type
        base.Data = value;
        _data = value as ComputerDataObject;
      }
    }

    [SerializeField] private ComputerDataObject _data;

    private static Rect ConfigureRect = new Rect(10, 10, 900, 800);

    //----------------------------------------------------------------------------
    private void ACLConfigure(string asset_name) {
      ConfigureRect = GUILayout.Window(2, ConfigureRect, DoACL, "ACL for " + asset_name);
    }

    //----------------------------------------------------------------------------
    //Refresh the UI with current configuration settings
    public void UpdateUI() {
      GameObject computer_panel = menus.menu_panels["ComputerPanel"];
      var computer_config_script = (ComputerConfigure) computer_panel.GetComponent(typeof(ComputerConfigure));
      _data.config_settings.ConfigureCanvas(this, computer_config_script);
      computer_config_script.SetAssets(_data.asset_list, this);
      computer_config_script.SetComputers(computerListVariable.Value);
    }

    //----------------------------------------------------------------------------
    private void ConfigureCanvas() {
      GameObject computer_panel = menus.menu_panels["ComputerPanel"];
      menus.ActiveScreen(computer_panel.name);
      computer_panel.SetActive(true);

      var computer_config_script = (ComputerConfigure) computer_panel.GetComponent(typeof(ComputerConfigure));
      _data.config_settings.ConfigureCanvas(this, computer_config_script);

      computer_config_script.SetAssets(_data.asset_list, this);
      computer_config_script.SetComputers(computerListVariable.Value);
    }

    //----------------------------------------------------------------------------
    private void DoACL(int i) {
      GUILayout.BeginVertical();
    }

    //----------------------------------------------------------------------------
    public void HandleConfigure() {
      if (menus.clicked.EndsWith("Configure")) {
        menus.clicked = "";
        ConfigureCanvas();
      }
      else if (menus.MenuLevel(3) == "ACL") {
        ACLConfigure(menus.MenuLevel(4));
      }
    }
  
    //----------------------------------------------------------------------------
    //Call this when the computer should change the value of a Policy.
    public void PolicyValueChanged(Policy policy, bool isOn) {
      _data.config_settings.ProceduralPolicyChanged(policy, isOn);
    }

    //----------------------------------------------------------------------------
    public void PasswordChanged(string group_name, Toggle toggle) {
      _data.config_settings.PasswordChanged(group_name, toggle);
    }

  
    //----------------------------------------------------------------------------
    public static void RemoveComputer(string computer_name) {
      if (!ComponentFactory.computer_dict.ContainsKey(computer_name)) {
        Debug.Log("ERROR: RemoveComputer, no computer named " + computer_name);
        return;
      }

      ComponentBehavior bh = ComponentFactory.computer_dict[computer_name];
      Destroy(bh.gameObject);
    }
  }
}