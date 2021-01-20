using System;
using System.Collections.Generic;
using System.Xml.Linq;
using Code.Factories;
using Code.Policy;
using UnityEngine;
using UnityEngine.UI;

[Serializable]
public class PhysicalSettings {
  private List<string> groups_allowed = new List<string>();
  private Dictionary<string, bool> phys_dict = new Dictionary<string, bool>();
  private List<string> users_allowed = new List<string>();
  private ZoneBehavior zone;

  public PhysicalSettings(List<Policy> physicalSecurityPolicies) {
    foreach (var key in physicalSecurityPolicies) {
      phys_dict[key.Name] = false;
    }

    //Debug.Log("LoadComputer proc key " + key);
  }

  public bool HandleConfigurationSetting(string tag, string value) {
    if (string.IsNullOrEmpty(tag)) {
      return false;
    }
    bool retval = true;
    if (phys_dict.ContainsKey(tag)) {
      bool result = false;
      if (!bool.TryParse(value, out result)) Debug.Log("Error PhysicalSettings parse " + tag);

      phys_dict[tag] = result;
    }
    else if (tag == "PermittedUsers") {
      //Debug.Log("PhysicalSettings PermittedUsers " + value);
      if (UserFactory.user_dict.ContainsKey(value)) users_allowed.Add(value);
      //Debug.Log("PhysicalSettings add user " + value);
      else if (value.StartsWith("*.")) groups_allowed.Add(value.Substring(2));
      //Debug.Log("PhysicalSettings add group " + value);
    }
    else {
      retval = false;
    }

    return retval;
  }

  public void ConfigureCanvas(ZoneBehavior zone, ZoneConfigure zone_config_script) {
    Debug.Log("PhysicalSettings ConfigureCanvas for " + zone.Data.ZoneName + "items in dict: " + phys_dict.Count);
    zone_config_script.SetPhys(phys_dict, zone);
    var user_access_dict = new Dictionary<string, bool>();
    var group_access_dict = new Dictionary<string, bool>();
    foreach (string key in UserFactory.user_dict.Keys) {
      bool allowed = false;
      if (users_allowed.Contains(key))
        allowed = true;
      user_access_dict[key] = allowed;
    }

    foreach (string key in DACGroups.group_dict.Keys) {
      bool allowed = false;
      if (groups_allowed.Contains(key))
        allowed = true;
      group_access_dict[key] = allowed;
    }

    zone_config_script.SetAccess(user_access_dict, zone);
    zone_config_script.SetAccess(group_access_dict, zone);
    this.zone = zone;
  }

  public void PhysChanged(Toggle toggle) {
    string field = toggle.GetComponentInChildren<Text>().text;
    Debug.Log("Zone PhysChanged " + field + " to " + toggle.isOn);
    phys_dict[field] = toggle.isOn;

    XElement xml = new XElement("zoneEvent",
      new XElement("name", zone.Data.ZoneName),
      new XElement("setting",
        new XElement("field", field + ":"),
        new XElement("value", toggle.isOn)));
    Debug.Log(xml.ToString());
    IPCManagerScript.SendRequest(xml.ToString());
  }

  public void AccessChanged(Toggle toggle) {
    string field = toggle.GetComponentInChildren<Text>().text;
    Debug.Log("Zone AccessChanged " + field + " to " + toggle.isOn);
    string user_or_group = "user";
    string add_or_remove = "accessAdd";
    if (UserFactory.user_dict.ContainsKey(field)) {
      if (toggle.isOn) {
        users_allowed.Add(field);
      }
      else {
        add_or_remove = "accessRemove";
        users_allowed.Remove(field);
      }
    }
    else {
      user_or_group = "group";
      if (toggle.isOn) {
        groups_allowed.Add(field);
      }
      else {
        add_or_remove = "accessRemove";
        groups_allowed.Remove(field);
      }
    }

    XElement xml = new XElement("zoneEvent",
      new XElement("name", zone.Data.ZoneName),
      new XElement(add_or_remove,
        new XElement(user_or_group, field)));

    IPCManagerScript.SendRequest(xml.ToString());
  }
}