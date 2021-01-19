using System.Collections.Generic;
using Code.User_Interface;
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

    private Dictionary<string, Scenario> _scenarioMap = new Dictionary<string, Scenario>();
    private Dictionary<int, Scenario> _scenarioIndexMap = new Dictionary<int, Scenario>();

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
      _scenarioMap.Clear();
      _scenarioIndexMap.Clear();

      CyberCIEGEParser.ForEachScenario(ccInstallPath.Value, selectedCampaign.Value,
        (scenario) => {
          _scenarioMap.Add(scenario.name, scenario);
          _scenarioIndexMap.Add(items.Count, scenario);
          items.Add(scenario.name);
        }
      );

      return items;
    }

    // ------------------------------------------------------------------------
    protected override bool IsItemInteractable(string item) {
      // If the scenarios are unlocked, then all campaigns are unlocked
      // Also, if the scenario has no prerequisite, it is unlocked
      var scenario = _scenarioMap[item];
      if (scenariosUnlocked.Value || scenario.prerequisiteIndex < 0) {
        return true;
      }

      // This scenario is interactable if its prerequisite has been completed
      var prerequisite = _scenarioIndexMap[scenario.prerequisiteIndex];
      return CyberCIEGEParser.DidUserCompleteScenario(ccInstallPath.Value, selectedCampaign.Value, prerequisite.id);
    }

    // ------------------------------------------------------------------------
    protected override bool IsItemSelected(string item) {
      return selectedScenario.Value == _scenarioMap[item].id;
    }

    // ------------------------------------------------------------------------
    protected override void ItemSelected(string item) {
      selectedScenario.Value = _scenarioMap[item].id;
      PlayerPrefs.SetString(PREF_KEY_SCENARIO, selectedScenario.Value);
    }
  }
}
