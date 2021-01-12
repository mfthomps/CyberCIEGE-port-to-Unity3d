﻿using System.Collections.Generic;
using System.Xml.Linq;
using Code.Policy;
using UnityEngine;
using UnityEngine.UI;

public class ConfigurationSettings {
  private static readonly string PWD_LEN = "PasswordLength";
  private static readonly string PWD_CHANGE = "PasswordChangeFrequency";
  private static readonly string PWD_COMPLEX = "PasswordCharacterSet";

  private readonly string event_type = "componentEvent";
  private Dictionary<string, Dictionary<string, bool>> group_dict = new Dictionary<string, Dictionary<string, bool>>();

  private Dictionary<string, string> group_value = new Dictionary<string, string>();

  /* instance-specific data */
  private Dictionary<string, bool> proc_dict = new Dictionary<string, bool>();
  private Dictionary<string, bool> pw_change_dict = new Dictionary<string, bool>();
  private Dictionary<string, bool> pw_complex_dict = new Dictionary<string, bool>();
  private Dictionary<string, bool> pw_len_dict = new Dictionary<string, bool>();
  private string the_name = "";

  public ConfigurationSettings(bool is_computer, string the_name, List<Policy> computerPolicies) {
    this.the_name = the_name;
    if (!is_computer) event_type = "zoneEvent";

    foreach (var key in computerPolicies) {
      proc_dict[key.Name] = false;
    }
    //Debug.Log("LoadComputer proc key " + key);

    pw_len_dict["Short"] = false;
    pw_len_dict["Medium"] = false;
    pw_len_dict["Long"] = false;
    pw_change_dict["two"] = false;
    pw_change_dict["six"] = false;
    pw_change_dict["twelve"] = false;
    pw_change_dict["never"] = false;
    pw_complex_dict["Any"] = false;
    pw_complex_dict["Moderate"] = false;
    pw_complex_dict["Complex"] = false;


    group_dict[PWD_LEN] = pw_len_dict;
    group_dict[PWD_CHANGE] = pw_change_dict;
    group_dict[PWD_COMPLEX] = pw_complex_dict;
    group_value[PWD_LEN] = null;
    group_value[PWD_CHANGE] = null;
    group_value[PWD_COMPLEX] = null;
  }

  public void SetName(string name) {
    the_name = name;
  }

  public void ConfigureCanvas(ComputerBehavior computer, ComputerConfigure computer_config_script) {
    computer_config_script.SetProc(proc_dict, computer);
    computer_config_script.SetPassword(PWD_LEN, pw_len_dict, computer);
    computer_config_script.SetPassword(PWD_CHANGE, pw_change_dict, computer);
    computer_config_script.SetPassword(PWD_COMPLEX, pw_complex_dict, computer);
  }

  public void ConfigureCanvas(ZoneBehavior zone, ZoneConfigure zone_config_script) {
    zone_config_script.SetProc(proc_dict, zone);
    zone_config_script.SetPassword(PWD_LEN, pw_len_dict, zone);
    zone_config_script.SetPassword(PWD_CHANGE, pw_change_dict, zone);
    zone_config_script.SetPassword(PWD_COMPLEX, pw_complex_dict, zone);
  }

  public bool HandleConfigurationSetting(string tag, string value) {
    bool retval = true;
    if (proc_dict.ContainsKey(tag)) {
      bool result = false;
      if (!bool.TryParse(value, out result)) Debug.Log("Error ConfigurationSettings parse " + tag);

      proc_dict[tag] = result;
    }
    else if (group_value.ContainsKey(tag)) {
      group_value[tag] = value;
    }
    else {
      retval = false;
    }

    return retval;
  }

  private void SetGroupValue(string group_name, Dictionary<string, bool> my_dict, string key, bool value) {
    my_dict[key] = value;
    XElement xml = new XElement(event_type,
      new XElement("name", the_name),
      new XElement("procSetting",
        new XElement("field", group_name + ":" + key),
        new XElement("value", value)));
    //Debug.Log(xml);
    IPCManagerScript.SendRequest(xml.ToString());
  }

  public void PasswordChanged(string group_name, Toggle toggle) {
    Dictionary<string, bool> my_dict = group_dict[group_name];
    string field = toggle.GetComponentInChildren<Text>().text;
    if (group_value[group_name] != null) {
      SetGroupValue(group_name, my_dict, group_value[group_name], false);
      //my_dict[this.group_value[group_name]] = false;
      if (field != group_value[group_name]) {
        /* new selected, turn it on */
        //my_dict[entry.Key] = true;
        SetGroupValue(group_name, my_dict, field, true);
        group_value[group_name] = field;
      }
      else {
        /* toggle previous, so length now none */
        group_value[group_name] = null;
      }
    }
    else {
      SetGroupValue(group_name, my_dict, field, true);
      group_value[group_name] = field;
    }
  }

  public void ProcChanged(Toggle toggle) {
    string field = toggle.GetComponentInChildren<Text>().text;
    Debug.Log("Computer ProcChanged " + field + " to " + toggle.isOn);
    proc_dict[field] = toggle.isOn;

    XElement xml = new XElement(event_type,
      new XElement("name", the_name),
      new XElement("procSetting",
        new XElement("field", field + ":"),
        new XElement("value", toggle.isOn)));

    IPCManagerScript.SendRequest(xml.ToString());
  }
}