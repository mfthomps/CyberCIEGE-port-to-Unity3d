using System;
using System.Collections;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.User_Interface.MainMenu;

namespace Code.Test {
  public class TestMainUI : MonoBehaviour {
    [Header("External Variables")]
    [Tooltip("Currently playing campaign")]
    public StringVariable currentCampaign;
    [Tooltip("Currently playing scenario")]
    public StringVariable currentScenario;
    [Tooltip("Currently funds")]
    public FloatVariable currentFunds;
    [Tooltip("Currently bonus")]
    public FloatVariable currentBonus;
    [Tooltip("Currently building")]
    public StringVariable currentBuilding;
    [Tooltip("Currently simulation date")]
    public StringVariable currentDate;
    [Tooltip("Currently simulation time")]
    public StringVariable currentTime;
    [Tooltip("Currently user message")]
    public StringVariable currentMessage;
    [Tooltip("Simulation Paused state")]
    public BooleanVariable gamePaused;
    [Tooltip("The current view type we have selected")]
    public ViewTypeVariable currentViewType;

    // --------------------------------------------------------------------------
    IEnumerator Start() {
      currentCampaign.Value = "Current Campaign";
      currentScenario.Value = "Current Scenario";
      currentFunds.Value = 99999.0f;
      currentBonus.Value = 100.0f;
      currentBuilding.Value = "Corner Office";
      currentDate.Value = DateTime.Now.ToString("MMMM dd");
      currentTime.Value = DateTime.Now.ToString("hh:mm tt");
      gamePaused.Value = false;

      yield return new WaitForSeconds(2.0f);
      currentMessage.Value = "Received new user message!";
    }

    // --------------------------------------------------------------------------
    void OnDestroy() {
      currentCampaign.Reset();
      currentScenario.Reset();
      currentFunds.Reset();
      currentBonus.Reset();
      currentBuilding.Reset();
      currentDate.Reset();
      currentTime.Reset();
      gamePaused.Reset();
      currentMessage.Reset();
    }

    // --------------------------------------------------------------------------
    void OnEnable() {
      currentViewType.OnValueChanged += OnCurrentViewChanged;
    }

    // --------------------------------------------------------------------------
    void OnDisable() {
      currentViewType.OnValueChanged -= OnCurrentViewChanged;
    }

    // --------------------------------------------------------------------------
    public void ToggleScenarioDetails(bool isOn) {
      Debug.Log($"Scenario Details Dialog toggled {(isOn ? "on" : "off")}");
    }

    // --------------------------------------------------------------------------
    public void TogglePause(bool isOn) {
      gamePaused.Value = isOn;
      Debug.Log($"Simulation {(isOn ? "paused" : "unpaused")}");
    }

    // --------------------------------------------------------------------------
    public void ToggleAttackLog(bool isOn) {
      Debug.Log($"Attack Log Dialog toggled {(isOn ? "on" : "off")}");
    }

    // --------------------------------------------------------------------------
    public void ToggleLab(bool isOn) {
      Debug.Log($"Lab Dialog toggled {(isOn ? "on" : "off")}");
    }

    // --------------------------------------------------------------------------
    public void ToggleHelp(bool isOn) {
      Debug.Log($"Help Dialog toggled {(isOn ? "on" : "off")}");
    }

    // --------------------------------------------------------------------------
    private void OnCurrentViewChanged() {
      Debug.Log($"Current View: {Enum.GetName(typeof(ViewType), currentViewType.Value)}");
    }
  }
}
