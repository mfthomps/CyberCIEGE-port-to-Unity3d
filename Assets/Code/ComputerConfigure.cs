using System.Collections.Generic;
using Code.User_Interface;
using UnityEngine;
using UnityEngine.UI;

/*
 * Manage gui interactions related to a computer, or zone defaults.
 * Associated with the computer panel.
 */
public class ComputerConfigure : MonoBehaviour {
  protected static GUIStyle label_style = new GUIStyle();

  [SerializeField] private SelectionList _computerListUI;

  //public RectTransform myTextPanel;
  public GameObject myTextPrefab;
  public RectTransform procPanel;
  public GameObject procPrefab;
  public RectTransform passwordPanel;

  //public RectTransform assetPanel;
  public Dropdown asset_dropdown;
  public Button asset_acl_button;

  //public GameObject dropdownPrefab;

  public GameObject passwordPrefab;

  public Button close_button;
  private ComputerBehavior current_computer;
  private GameObject newText;
  private GameObject newTog;
  private float nextMessage;
  
  private List<ComputerBehavior> computerList = new List<ComputerBehavior>();


  // Use this for initialization
  private void Start() {
    nextMessage = Time.time + 1f;
    label_style.normal.textColor = Color.black;
    close_button.onClick.AddListener(CloseClicked);
    asset_acl_button.onClick.AddListener(ACLClicked);
    /* register screen panel with menus system */
    menus.screen_dict[gameObject.name] = menus.UI_SCREEN_COMPONENT;
  }

  public void ACLClicked() {
    string asset_name = asset_dropdown.captionText.text;
    Debug.Log("ACL clicked, current asset is <" + asset_name + ">");
    AssetBehavior asset_script = AssetBehavior.asset_dict[asset_name];
    string dac_string = asset_script.GetDACString();
    Debug.Log(dac_string);
    GameObject acl_panel = menus.menu_panels["ACLPanel"];
    acl_panel.SetActive(true);
    ACLConfigure acl_script = (ACLConfigure) acl_panel.GetComponent(typeof(ACLConfigure));
    acl_script.SetDAC(asset_script.GetDACAccess());
    //menus.clicked = "Component:" + current_computer.component_name + ":Configure:ACL:" + asset_name;
  }

  //---------------------------------------------------------------------------
  private void CloseClicked() {
    foreach (Transform child in procPanel) Destroy(child.gameObject);

    foreach (Transform child in passwordPanel) Destroy(child.gameObject);

    Debug.Log("Component menu closed");
    gameObject.SetActive(false);
    menus.ClosedScreen(gameObject.name);
  }

  //---------------------------------------------------------------------------
  //Called when the UI should show the properties of this selected computer
  public void ComputerSelected(SelectionListItem selectedItem) {
    Debug.Log($"Computer {selectedItem} was selected");
    //TODO Now update the UI with the attributes of the computer
  }

  //---------------------------------------------------------------------------
  public void SetPassword(string group_name, Dictionary<string, bool> dict, ComputerBehavior computer) {
    GameObject newText = Instantiate(myTextPrefab);
    newText.transform.SetParent(passwordPanel);
    newText.GetComponent<Text>().text = group_name;

    foreach (KeyValuePair<string, bool> entry in dict) {
      //Debug.Log("SetPassword for " + entry.Key);
      GameObject newTog = Instantiate(procPrefab);
      newTog.transform.SetParent(passwordPanel);
      Toggle t = newTog.GetComponent<Toggle>();
      if (t == null) {
        Debug.Log("Toggle is null");
        return;
      }

      t.GetComponentInChildren<Text>().text = entry.Key;
      t.isOn = entry.Value;
      t.onValueChanged.AddListener(delegate { computer.PasswordChanged(group_name, t); });
    }
  }

  public void SetProc(Dictionary<string, bool> dict, ComputerBehavior computer) {
    foreach (KeyValuePair<string, bool> entry in dict) {
      GameObject newTog = Instantiate(procPrefab);
      newTog.transform.SetParent(procPanel);

      Toggle t = newTog.GetComponent<Toggle>();
      if (t == null) {
        Debug.Log("Toggle is null");
        return;
      }

      t.GetComponentInChildren<Text>().text = entry.Key;
      t.isOn = entry.Value;
      t.onValueChanged.AddListener(delegate { computer.ProcChanged(t); });

      //Debug.Log("added " + entry.Key);
    }
  }

  //---------------------------------------------------------------------------
  public void SetComputers(List<ComputerBehavior> computers) {
    computerList = computers;
    _computerListUI.Clear(); //wipe out existing list of item
    foreach (ComputerBehavior computer in computerList) {
      if (computer) {
        _computerListUI.AddItem(computer.component_name);
      }
    }
  }

  //---------------------------------------------------------------------------
  public void SetAssets(List<string> asset_list, ComputerBehavior computer) {
    current_computer = computer;
    asset_dropdown.ClearOptions();
    var ddo = new List<Dropdown.OptionData>();
    foreach (string asset in asset_list) {
      Dropdown.OptionData new_data = new Dropdown.OptionData(asset);
      ddo.Add(new_data);
      //asset_dropdown.options.Add(new Dropdown.OptionData(asset));
      //Debug.Log("SetAsset adding " + asset);
    }

    asset_dropdown.AddOptions(ddo);
    //Debug.Log("SetAsset done");
  }
  
  public string GetCurrentAsset() {
    return asset_dropdown.captionText.text;
  }
}