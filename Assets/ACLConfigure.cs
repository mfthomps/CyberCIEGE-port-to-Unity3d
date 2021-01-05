using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ACLConfigure : MonoBehaviour {
  public Dropdown user_group_dropdown;
  public Dropdown read_dropdown;
  public Dropdown write_dropdown;
  public Dropdown control_dropdown;
  public Dropdown execute_dropdown;
  public Button close_button;
  public Button clear_button;

  private DACAccess current_dac;
  private Dropdown[] mode_drops;

  // Use this for initialization
  private void Start() {
    close_button.onClick.AddListener(CloseClicked);
    clear_button.onClick.AddListener(ClearClicked);
    mode_drops = new[] {read_dropdown, write_dropdown, control_dropdown, execute_dropdown};
  }

  public void CloseClicked() {
    gameObject.SetActive(false);
  }

  public void ClearClicked() {
    ModeOptions(read_dropdown, '-', true);
    ModeOptions(write_dropdown, '-', true);
    ModeOptions(control_dropdown, '-', true);
    ModeOptions(execute_dropdown, '-', true);
    current_dac.ClearEntry(user_group_dropdown.captionText.text);
  }

  private void ModeOptions(Dropdown dd, char select_option, bool clear = false) {
    /*
     *   Set the options in a mode dropdown and select the given option.
     *   If clear, the options will include the "-", which is selected.
     */
    dd.ClearOptions();
    dd.onValueChanged.RemoveAllListeners();
    string[] values = {"Yes", "No", "Don't care"};
    var ddo = new List<Dropdown.OptionData>();
    if (clear) {
      Dropdown.OptionData new_data = new Dropdown.OptionData("-");
      ddo.Add(new_data);
    }

    foreach (string option in values) {
      Dropdown.OptionData new_data = new Dropdown.OptionData(option);
      ddo.Add(new_data);
    }

    dd.AddOptions(ddo);
    switch (select_option) {
      case '-':
        dd.value = Array.IndexOf(values, "-");
        break;
      case 'Y':
        dd.value = Array.IndexOf(values, "Yes");
        break;
      case 'N':
        dd.value = Array.IndexOf(values, "No");
        break;
      case 'X':
        dd.value = Array.IndexOf(values, "Don't care");
        break;
    }

    dd.onValueChanged.AddListener(delegate { current_dac.ACLChanged(user_group_dropdown.captionText.text, dd, this); });
  }

  public void SetDAC(DACAccess dac) {
    /* associate a DACAccess with this gui panel */
    current_dac = dac;
    user_group_dropdown.ClearOptions();
    var ddo = new List<Dropdown.OptionData>();
    foreach (KeyValuePair<string, DACAccess.DACEntry> entry in dac.dac_dict) {
      Dropdown.OptionData new_data = new Dropdown.OptionData(entry.Key);
      ddo.Add(new_data);
    }

    user_group_dropdown.AddOptions(ddo);
    string user_group_name = user_group_dropdown.captionText.text;
    DACAccess.DACEntry dac_entry = dac.dac_dict[user_group_name];
    ModeOptions(read_dropdown, dac_entry.read);
    ModeOptions(write_dropdown, dac_entry.write);
    ModeOptions(control_dropdown, dac_entry.control);
    ModeOptions(execute_dropdown, dac_entry.execute);
  }

  public void CheckDefault(Dropdown dd, char option) {
    Debug.Log("CheckDefault for " + dd.name);
    /* Some mode now has a value, set all other modes to N */
    foreach (Dropdown drop in mode_drops)
      if (drop != dd)
        ModeOptions(drop, 'N');
      else
        ModeOptions(dd, option);
  }
}