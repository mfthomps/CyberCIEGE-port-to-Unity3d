using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DisplayTextScript : MonoBehaviour {
  protected static GUIStyle label_style = new GUIStyle();
  public RectTransform myTextPanel;
  public GameObject myTextPrefab;
  public RectTransform procPanel;
  public GameObject procPrefab;
  public RectTransform passwordPanel;

  //public RectTransform assetPanel;
  public Dropdown asset_dropdown;

  //public GameObject dropdownPrefab;

  public GameObject passwordPrefab;

  public Button closeButton;
  private int myNumber;
  private GameObject newText;
  private GameObject newTog;
  private float nextMessage;
  private List<string> stringlist;


  // Use this for initialization
  private void Start() {
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
    closeButton.onClick.AddListener(CloseClicked);
  }

  // Update is called once per frame
  private void Update() {
    if (Time.time > nextMessage && myNumber < stringlist.Count) {
      GameObject newText = Instantiate(myTextPrefab);
      newText.transform.SetParent(myTextPanel);
      newText.GetComponent<Text>().text = stringlist[myNumber];
      myNumber++;
      nextMessage = Time.time + 1f;
    }
  }

  public void CloseClicked() {
    foreach (Transform child in procPanel) Destroy(child.gameObject);

    foreach (Transform child in passwordPanel) Destroy(child.gameObject);


    Debug.Log("Component menu closed");
    gameObject.SetActive(false);
  }

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

  public void SetAssets(List<string> asset_list, ComputerBehavior computer) {
    asset_dropdown.ClearOptions();
    var ddo = new List<Dropdown.OptionData>();
    foreach (string asset in asset_list) {
      Dropdown.OptionData new_data = new Dropdown.OptionData(asset);
      ddo.Add(new_data);
      //asset_dropdown.options.Add(new Dropdown.OptionData(asset));
      Debug.Log("SetAsset adding " + asset);
    }

    asset_dropdown.AddOptions(ddo);
    Debug.Log("SetAsset done");
  }
}