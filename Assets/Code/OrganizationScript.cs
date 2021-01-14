using Code.Scriptable_Variables;
using UnityEngine;

public class OrganizationScript : MonoBehaviour {
  [SerializeField] private StringStringVariable properties;

  //-------------------------------------------------------------------------
  public string GetValue(string tag) {
    //Debug.Log("Organization GetValue for " + tag);
    return properties[tag];
  }

  //-------------------------------------------------------------------------
  public void SetValue(string key, string value) {
    properties[key] = value;
  }
}