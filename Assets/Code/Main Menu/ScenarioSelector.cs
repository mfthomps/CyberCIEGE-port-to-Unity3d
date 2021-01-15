using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.MainMenu {
  // Logic class for Scenario Selector UI
  public class ScenarioSelector : StringItemSelector {
    [Header("Input Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Tooltip("Whether all scenarios are unlocked by default or not")]
    public BooleanVariable scenariosUnlocked;
    [Tooltip("Selected campaign value")]
    public StringVariable selectedCampaign;
    [Header("Output Variables")]
    [Tooltip("Selected scenario value")]
    public StringVariable selectedScenario;

    private static string PREF_KEY_SCENARIO = @"Selected Scenario";

    private Dictionary<string, string> _scenarioIDMap = new Dictionary<string, string>();

    // ------------------------------------------------------------------------
    protected override void Awake() {
      selectedScenario.Value = PlayerPrefs.GetString(PREF_KEY_SCENARIO);
      base.Awake();
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedScenario.Reset();
    }

    // ------------------------------------------------------------------------
    void OnEnable() {
      ccInstallPath.OnValueChanged += ResetList;
      scenariosUnlocked.OnValueChanged += ResetList;
      selectedCampaign.OnValueChanged += ResetList;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ccInstallPath.OnValueChanged -= ResetList;
      scenariosUnlocked.OnValueChanged -= ResetList;
      selectedCampaign.OnValueChanged -= ResetList;
    }

    // ------------------------------------------------------------------------
    protected override bool CanSetItems() {
      // Do we have a valid CyberCIEGE Install path?
      return !string.IsNullOrEmpty(ccInstallPath.Value);
    }

    // ------------------------------------------------------------------------
    protected override List<string> GetItems() {
      var items = new List<string>();
      _scenarioIDMap.Clear();

      CyberCIEGEParser.ForEachScenario(ccInstallPath.Value, selectedCampaign.Value,
        (scenarioName, scenarioID) => {
          _scenarioIDMap.Add(scenarioName, scenarioID);
          items.Add(scenarioName);
        }
      );

      return items;
    }

    // ------------------------------------------------------------------------
    protected override bool IsItemInteractable() {
      // If the scenarios are unlocked, then all campaigns are unlocked
      if (scenariosUnlocked.Value) {
        return true;
      }

      // TODO: Figure out campaign's point value and player's point value
      return true;
    }

    // ------------------------------------------------------------------------
    protected override bool IsItemSelected(string item) {
      return selectedScenario.Value == _scenarioIDMap[item];
    }

    // ------------------------------------------------------------------------
    protected override void ItemSelected(string item) {
      selectedScenario.Value = _scenarioIDMap[item];
      PlayerPrefs.SetString(PREF_KEY_SCENARIO, selectedScenario.Value);
    }
  }
}
