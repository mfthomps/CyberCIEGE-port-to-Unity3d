using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.MainMenu {
  // Logic class for Saved Game Selector UI
  public class SavedGameSelector : StringItemSelector {
    [Header("Input Variables")]
    [Tooltip("Path of the installed CyberCIEGE core game")]
    public StringVariable ccInstallPath;
    [Tooltip("Selected campaign value")]
    public StringVariable selectedCampaign;
    [Tooltip("Selected scenario value")]
    public StringVariable selectedScenario;
    [Header("Output Variables")]
    [Tooltip("Selected scenario value")]
    public StringVariable selectedSavedGame;

    private static string PREF_KEY_SAVED_GAME = @"Selected Saved Game";

    private List<string> _validSavedGames = new List<string>();

    // ------------------------------------------------------------------------
    protected override void Awake() {
      selectedSavedGame.Value = PlayerPrefs.GetString(PREF_KEY_SAVED_GAME);
      base.Awake();
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedSavedGame.Reset();
    }

    // ------------------------------------------------------------------------
    void OnEnable() {
      ccInstallPath.OnValueChanged += ResetList;
      selectedScenario.OnValueChanged += ResetList;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ccInstallPath.OnValueChanged -= ResetList;
      selectedScenario.OnValueChanged -= ResetList;
    }

    // ------------------------------------------------------------------------
    protected override bool CanSetItems() {
      // Do we have a valid CyberCIEGE Install path?
      return !string.IsNullOrEmpty(ccInstallPath.Value);
    }

    // ------------------------------------------------------------------------
    protected override List<string> GetItems() {
      var items = new List<string>{ "New Game" };
      _validSavedGames.Clear();

      CyberCIEGEParser.ForEachSavedGame(ccInstallPath.Value, selectedCampaign.Value, selectedScenario.Value,
        (savedGamePath) => {
          _validSavedGames.Add(savedGamePath);
          items.Add(savedGamePath);
        }
      );

      return items;
    }

    // ------------------------------------------------------------------------
    protected override bool IsItemInteractable(string item) {
      return true;
    }

    // ------------------------------------------------------------------------
    protected override bool IsItemSelected(string item) {
      return selectedSavedGame.Value == item;
    }

    // ------------------------------------------------------------------------
    protected override void ItemSelected(string item) {
      selectedSavedGame.Value = _validSavedGames.Contains(item) ? item : null;
      PlayerPrefs.SetString(PREF_KEY_SAVED_GAME, selectedSavedGame.Value);
    }
  }
}
