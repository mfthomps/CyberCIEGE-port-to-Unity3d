using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.MainMenu {
  // Logic class for Campaign Selector UI
  public class CampaignSelector : StringItemSelector {
    [Header("Input Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Tooltip("Whether all scenarios are unlocked by default or not")]
    public BooleanVariable scenariosUnlocked;
    [Header("Output Variables")]
    [Tooltip("Selected campaign value")]
    public StringVariable selectedCampaign;

    private static string PREF_KEY_CAMPAIGN = @"Selected Campaign";

    // ------------------------------------------------------------------------
    protected override void Awake() {
      selectedCampaign.Value = PlayerPrefs.GetString(PREF_KEY_CAMPAIGN);
      base.Awake();
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedCampaign.Reset();
    }

    // ------------------------------------------------------------------------
    void OnEnable() {
      ccInstallPath.OnValueChanged += ResetList;
      scenariosUnlocked.OnValueChanged += ResetList;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ccInstallPath.OnValueChanged -= ResetList;
      scenariosUnlocked.OnValueChanged -= ResetList;
    }

    // ------------------------------------------------------------------------
    protected override bool CanSetItems() {
      // Do we have a valid CyberCIEGE Install path?
      return !string.IsNullOrEmpty(ccInstallPath.Value);
    }

    // ------------------------------------------------------------------------
    protected override List<string> GetItems() {
      var items = new List<string>();
      CyberCIEGEParser.ForEachCampaign(ccInstallPath.Value, (campaignName => items.Add(campaignName)));
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
      return selectedCampaign.Value == item;
    }

    // ------------------------------------------------------------------------
    protected override void ItemSelected(string item) {
      selectedCampaign.Value = item;
      PlayerPrefs.SetString(PREF_KEY_CAMPAIGN, item);
    }
  }
}
