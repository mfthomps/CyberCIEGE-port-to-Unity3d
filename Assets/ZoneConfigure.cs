using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ZoneConfigure : MonoBehaviour {
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
  private float nextMessage;
  private int myNumber = 0;
  private GameObject newText;
  private GameObject newTog;
  List<string> stringlist;
  protected static GUIStyle label_style = new GUIStyle();
  ZoneBehavior current_zone = null;


  // Use this for initialization
  void Start() {
    label_style.normal.textColor = Color.black;
    this.close_button.onClick.AddListener(CloseClicked);
    /* register screen panel with menus system */
    Debug.Log("ZoneConfig register menu screen for " + this.gameObject.name);
    menus.screen_dict[this.gameObject.name] = menus.UI_SCREEN_ZONE;
  }

  public void CloseClicked() {
    foreach (Transform child in procPanel) {
      GameObject.Destroy(child.gameObject);
    }

    foreach (Transform child in passwordPanel) {
      GameObject.Destroy(child.gameObject);
    }

    foreach (Transform child in physPanel) {
      GameObject.Destroy(child.gameObject);
    }

    foreach (Transform child in accessPanel) {
      GameObject.Destroy(child.gameObject);
    }

    Debug.Log("Zone menu closed");
    this.gameObject.SetActive(false);
    menus.ClosedScreen(this.gameObject.name);
  }

  public void SetPassword(string group_name, Dictionary<string, bool> dict, ZoneBehavior zone) {
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
      t.onValueChanged.AddListener(delegate { zone.PasswordChanged(group_name, t); });
    }
  }

  public void SetProc(Dictionary<string, bool> dict, ZoneBehavior zone) {
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
      t.onValueChanged.AddListener(delegate { zone.ProcChanged(t); });

      //Debug.Log("added " + entry.Key);
    }
  }

  public void SetPhys(Dictionary<string, bool> dict, ZoneBehavior zone) {
    foreach (KeyValuePair<string, bool> entry in dict) {
      GameObject newTog = (GameObject) Instantiate(physPrefab);
      newTog.transform.SetParent(physPanel);

      Toggle t = (Toggle) newTog.GetComponent<Toggle>();
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
      GameObject newTog = (GameObject) Instantiate(accessPrefab);
      newTog.transform.SetParent(accessPanel);

      Toggle t = (Toggle) newTog.GetComponent<Toggle>();
      if (t == null) {
        Debug.Log("Toggle is null");
        return;
      }

      t.GetComponentInChildren<Text>().text = entry.Key;
      t.isOn = entry.Value;
      t.onValueChanged.AddListener(delegate { zone.AccessChanged(t); });
    }
  }

  // Update is called once per frame
  void Update() {
  }
}