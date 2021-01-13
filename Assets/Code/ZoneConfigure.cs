using System;
using System.Collections.Generic;
using Code.Policy;
using Code.User_Interface;
using UnityEngine;
using UnityEngine.UI;

public class ZoneConfigure : MonoBehaviour {
  [Tooltip("The list of Policies to apply to the Zone Procedural settings.")]
  [SerializeField] private PolicyList _proceduralPolicyList;
  [Tooltip("The list of Policies to apply to the Zone Configuration settings.")]
  [SerializeField] private PolicyList _configurationPolicyList;
  
  private static GUIStyle label_style = new GUIStyle();
  public GameObject myTextPrefab;

  public RectTransform procPanel;
  public GameObject procPrefab;
  public RectTransform passwordPanel;

  public RectTransform physPanel;
  public GameObject physPrefab;
  public RectTransform accessPanel;
  public GameObject accessPrefab;

  //public GameObject dropdownPrefab;

  public GameObject passwordPrefab;

  public Button close_button;
  private GameObject newText;
  private GameObject newTog;
  private float nextMessage;
  private List<string> stringlist;
  private ZoneBehavior _selectedZone;


  // Use this for initialization
  private void Start() {
    label_style.normal.textColor = Color.black;
    close_button.onClick.AddListener(CloseClicked);
    /* register screen panel with menus system */
    Debug.Log("ZoneConfig register menu screen for " + gameObject.name);
    menus.screen_dict[gameObject.name] = menus.UI_SCREEN_ZONE;
  }

  private void CloseClicked() {
    foreach (Transform child in passwordPanel) Destroy(child.gameObject);
    foreach (Transform child in physPanel) Destroy(child.gameObject);
    foreach (Transform child in accessPanel) Destroy(child.gameObject);

    Debug.Log("Zone menu closed");
    gameObject.SetActive(false);
    menus.ClosedScreen(gameObject.name);
  }

  public void SetPassword(string group_name, Dictionary<string, bool> dict, ZoneBehavior zone) {
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
      t.onValueChanged.AddListener(delegate { zone.PasswordChanged(group_name, t); });
    }
  }

  //---------------------------------------------------------------------------
  //TODO Duplicate of ComputerConfigure.SetProc()
  public void SetProc(Dictionary<Policy, bool> dict, ZoneBehavior zone) {
    _selectedZone = zone;
    
    //remove old items
    _proceduralPolicyList.ClearItems();
    _configurationPolicyList.ClearItems();
    
    foreach (var item in dict) {
      switch (item.Key.PolicyType) {
        case PolicyType.None:
          break;
        case PolicyType.ProceduralSecurity:
          _proceduralPolicyList.AddItem((item.Key, item.Value));
          break;
        case PolicyType.Configuration:
          _configurationPolicyList.AddItem((item.Key, item.Value));
          break;
        case PolicyType.ProceduralOther:
          break;
        case PolicyType.PhysicalSecurity:
          break;
        default:
          throw new ArgumentOutOfRangeException();
      }
    }
  }

  public void SetPhys(Dictionary<string, bool> dict, ZoneBehavior zone) {
    foreach (KeyValuePair<string, bool> entry in dict) {
      GameObject newTog = Instantiate(physPrefab);
      newTog.transform.SetParent(physPanel);

      Toggle t = newTog.GetComponent<Toggle>();
      if (t == null) {
        Debug.Log("Toggle is null");
        return;
      }

      t.GetComponentInChildren<Text>().text = entry.Key;
      t.isOn = entry.Value;
      t.onValueChanged.AddListener(delegate { zone.PhysChanged(t); });
    }
  }

  public void SetAccess(Dictionary<string, bool> dict, ZoneBehavior zone) {
    Debug.Log("ZoneConfig SetAccess dict size is " + dict.Count);
    foreach (KeyValuePair<string, bool> entry in dict) {
      GameObject newTog = Instantiate(accessPrefab);
      newTog.transform.SetParent(accessPanel);

      Toggle t = newTog.GetComponent<Toggle>();
      if (t == null) {
        Debug.Log("Toggle is null");
        return;
      }

      t.GetComponentInChildren<Text>().text = entry.Key;
      t.isOn = entry.Value;
      t.onValueChanged.AddListener(delegate { zone.AccessChanged(t); });
    }
  }
  
  //---------------------------------------------------------------------------
  //Call this when a Policy value should be changed on the selected computer.
  public void OnPolicyChanged(Policy policy, bool isOn) {
    if (_selectedZone) {
      _selectedZone.PolicyValueChanged(policy, isOn);
    }
  }
}