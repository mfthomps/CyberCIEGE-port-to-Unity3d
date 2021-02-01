using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Linq;
using UnityEngine;
using UnityEngine.UI;
using Code;
using Code.Factories;
using Code.Scriptable_Variables;

[Serializable]
public class DACAccess {
  public static int READ_MASK = 1;
  public static int WRITE_MASK = 2;
  public static int CONTROL_MASK = 4;
  public static int EXECUTE_MASK = 8;
  public AssetBehavior asset;
  public Dictionary<string, DACEntry> dac_dict = new Dictionary<string, DACEntry>();
  private readonly Dictionary<string, char> option_map = new Dictionary<string, char>();
  private bool supress_value_change_hack;
  private UserListVariable _userList;

  public DACAccess(string user_mode_list, AssetBehavior asset, UserListVariable userList) {
    //Debug.Log("DACAccess for " + user_mode_list);
    SetAccess(user_mode_list);
    this.asset = asset;
    option_map["Yes"] = 'Y';
    option_map["No"] = 'N';
    option_map["-"] = '-';
    option_map["Don't care"] = 'X';
    _userList = userList;
  }

  public string DACEntryToString() {
    string retval = "";
    foreach (KeyValuePair<string, DACEntry> entry in dac_dict) {
      DACEntry de = entry.Value;
      retval += de.DACToString() + "\n";
    }

    return retval;
  }

  public void SetAccess(string name_mode_list) {
    StringReader reader = new StringReader(name_mode_list);
    string line = null;
    do {
      line = reader.ReadLine();
      if (line == null)
        continue;
      //Debug.Log("SetAccess got line " + line);
      string[] parts = line.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
      //string[] parts = (string []) Regex.Split(line, @"\s+").Where(s => s != string.Empty);

      string user = parts[0].Trim();
      string modes = parts[1].Trim();
      DACEntry entry = new DACEntry(user, modes);
      dac_dict.Add(user, entry);
    } while (line != null);

    //Debug.Log("out of loop");
  }

  public void ACLChanged(string user_group_name, Dropdown dd, ACLConfigure config) {
    if (supress_value_change_hack)
      return;
    supress_value_change_hack = true;
    Debug.Log("ACL Changed for " + dd.name + " new mode select " + dd.captionText.text);
    char option = option_map[dd.captionText.text];
    DACEntry entry = dac_dict[user_group_name];
    char was_option = 'z';
    switch (dd.name) {
      case "ReadDropdown":
        was_option = entry.read;
        entry.read = option;
        break;
      case "WriteDropdown":
        was_option = entry.write;
        entry.write = option;
        break;
      case "ControlDropdown":
        was_option = entry.control;
        entry.control = option;
        break;
      case "ExecuteDropdown":
        was_option = entry.execute;
        entry.execute = option;
        break;
    }

    Debug.Log("ACLChanged, was option " + was_option);
    if (was_option == '-') {
      Debug.Log("now call CheckDefault");
      config.CheckDefault(dd, option);
    }

    entry.read = option_map[config.read_dropdown.captionText.text];
    entry.write = option_map[config.write_dropdown.captionText.text];
    entry.control = option_map[config.control_dropdown.captionText.text];
    entry.execute = option_map[config.execute_dropdown.captionText.text];
    int mode = entry.GetMode();
    string component_name = asset.Data.Computer.Data.component_name;
    string command = "changeGroupMask";
    string name_string = "groupName";
    if (_userList.Value.Exists(user => user.Data.user_name == user_group_name)) {
      command = "changeUserMask";
      name_string = "userName";
    }

    XElement xml = new XElement("componentEvent",
      new XElement("name", component_name),
      new XElement("assetACL",
        new XElement("assetName", asset.AssetName),
        new XElement(command,
          new XElement(name_string, user_group_name),
          new XElement("mode", mode))));

    IPCManagerScript.SendRequest(xml.ToString());
    supress_value_change_hack = false;
  }

  public void ClearEntry(string user_group_name) {
    DACEntry entry = dac_dict[user_group_name];
    entry.Clear();
    string component_name = asset.Data.Computer.Data.component_name;
    string command = "removeGroup";
    if (_userList.Value.Exists(user => user.Data.user_name == user_group_name)) command = "removeUser";

    XElement xml = new XElement("componentEvent",
      new XElement("name", component_name),
      new XElement("assetACL",
        new XElement("assetName", asset.AssetName),
        new XElement(command, user_group_name)));

    IPCManagerScript.SendRequest(xml.ToString());
  }

  public class DACEntry {
    public char control = '-';
    public char execute = '-';
    public bool is_group; // not used, we don't know yet
    public string name;
    public char read = '-';
    public char write = '-';

    public DACEntry(string name, string modes, bool group = false) {
      //Debug.Log("DACEntry for " + name + " " + modes);
      this.name = name;
      read = modes[0];
      write = modes[1];
      execute = modes[2];
      control = modes[3];
      is_group = group;
    }

    public void Clear() {
      read = '-';
      write = '-';
      execute = '-';
      control = '-';
    }

    public string DACToString() {
      return name + " " + read + write + execute + control;
    }

    public int GetMode() {
      int retval = 0;
      if (read == 'Y')
        retval = retval | READ_MASK;
      if (write == 'Y')
        retval = retval | WRITE_MASK;
      if (control == 'Y')
        retval = retval | CONTROL_MASK;
      if (execute == 'Y')
        retval = retval | EXECUTE_MASK;
      return retval;
    }
  }
}