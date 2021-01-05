using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ZoneConfigure : MonoBehaviour {
  protected static GUIStyle label_style = new GUIStyle();
  public RectTransform myTextPanel;
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
  private ZoneBehavior current_zone = null;
  private int myNumber = 0;
  private GameObject newText;
  private GameObject newTog;
  private float nextMessage;
  private List<string> stringlist;


  // Use this for initialization
  private void Start() {
    label_style.normal.textColor = Color.black;
    close_button.onClick.AddListener(CloseClicked);
    /* register screen panel with menus system */
    Debug.Log("ZoneConfig register menu screen for " + gameObject.name);
    menus.screen_dict[gameObject.name] = menus.UI_SCREEN_ZONE;
  }

  // Update is called once per frame
  private void Update() {
  }

  public void CloseClicked() {
    foreach (Transform child in procPanel) Destroy(child.gameObject);

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

  public void SetProc(Dictionary<string, bool> dict, ZoneBehavior zone) {
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
      t.onValueChanged.AddListener(delegate { zone.ProcChanged(t); });

      //Debug.Log("added " + entry.Key);
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
}