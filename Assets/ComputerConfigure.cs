using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/*
 * Manage gui interactions related to a computer, or zone defaults.
 * Associated with the computer panel.
 */
public class ComputerConfigure : MonoBehaviour {
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
  private float nextMessage;
  private int myNumber = 0;
  private GameObject newText;
  private GameObject newTog;
  List<string> stringlist;
  protected static GUIStyle label_style = new GUIStyle();
  ComputerBehavior current_computer = null;


  // Use this for initialization
  void Start() {
    stringlist = new List<string>();
    stringlist.Add("hi");
    stringlist.Add("there");
    stringlist.Add("what?");
    stringlist.Add("hi");
    stringlist.Add("there");
    stringlist.Add("what?");
    stringlist.Add("hi");
    stringlist.Add("there");
    stringlist.Add("what?");
    stringlist.Add("hi");
    stringlist.Add("there");
    stringlist.Add("what?");
    stringlist.Add("hi");
    stringlist.Add("there");
    stringlist.Add("what?");
    nextMessage = Time.time + 1f;
    label_style.normal.textColor = Color.black;
    this.close_button.onClick.AddListener(CloseClicked);
    this.asset_acl_button.onClick.AddListener(ACLClicked);
    /* register screen panel with menus system */
    menus.screen_dict[this.gameObject.name] = menus.UI_SCREEN_COMPONENT;
  }

  public void ACLClicked() {
    string asset_name = this.asset_dropdown.captionText.text;
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

  public void CloseClicked() {
    foreach (Transform child in procPanel) {
      GameObject.Destroy(child.gameObject);
    }

    foreach (Transform child in passwordPanel) {
      GameObject.Destroy(child.gameObject);
    }

    Debug.Log("Component menu closed");
    this.gameObject.SetActive(false);
    menus.ClosedScreen(this.gameObject.name);
  }

  public void SetPassword(string group_name, Dictionary<string, bool> dict, ComputerBehavior computer) {
    GameObject newText = (GameObject) Instantiate(myTextPrefab);
    newText.transform.SetParent(passwordPanel);
    newText.GetComponent<Text>().text = group_name;

    foreach (KeyValuePair<string, bool> entry in dict) {
      //Debug.Log("SetPassword for " + entry.Key);
      GameObject newTog = (GameObject) Instantiate(procPrefab);
      newTog.transform.SetParent(passwordPanel);
      Toggle t = (Toggle) newTog.GetComponent<Toggle>();
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
      GameObject newTog = (GameObject) Instantiate(procPrefab);
      newTog.transform.SetParent(procPanel);

      Toggle t = (Toggle) newTog.GetComponent<Toggle>();
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

  public void SetAssets(List<string> asset_list, ComputerBehavior computer) {
    current_computer = computer;
    asset_dropdown.ClearOptions();
    List<Dropdown.OptionData> ddo = new List<Dropdown.OptionData>();
    foreach (string asset in asset_list) {
      Dropdown.OptionData new_data = new Dropdown.OptionData(asset);
      ddo.Add(new_data);
      //asset_dropdown.options.Add(new Dropdown.OptionData(asset));
      //Debug.Log("SetAsset adding " + asset);
    }

    asset_dropdown.AddOptions(ddo);
    //Debug.Log("SetAsset done");
  }

  /*
  public void SetTest()
  {
    foreach (string s in stringlist)
    {
      GameObject newText = (GameObject)Instantiate(myTextPrefab);
      newText.transform.SetParent(myTextPanel);
      newText.GetComponent<Text>().text = s;
    }
  }
  */
  public string GetCurrentAsset() {
    return asset_dropdown.captionText.text;
  }
}