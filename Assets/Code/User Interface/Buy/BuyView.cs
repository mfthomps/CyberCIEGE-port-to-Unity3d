using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Shared.ScriptableVariables;
using Code.Hardware;
using Code.User_Interface.View;

namespace Code.User_Interface.Buy {
  public class BuyView : MonoBehaviour {
    [Header("Output Events/Variables")]
    [Tooltip("Event fired with the ID of the hardware the player wants to buy")]
    public StringGameEvent onBuyHardware;
    [Tooltip("Current view type the user is viewing")]
    public ViewTypeVariable currentViewType;
    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Header("UI Elements")]
    [Tooltip("Prefab for creating Hardware Type toggles")]
    public HardwareTypeToggle hardwareTypeTogglePrefab;
    [Tooltip("Content area to put hardware type toggles")]
    public RectTransform hardwareTypeContentArea;
    [Tooltip("Toggle group for hardware type toggles")]
    public ToggleGroup hardwareTypeToggleGroup;
    [Tooltip("Prefab for creating Hardware Type toggles")]
    public HardwareUI hardwareUIPrefab;
    [Tooltip("Content area to put hardware UI")]
    public RectTransform hardwareUIContentArea;
    [Tooltip("UI to display when there are no hardware items of the current type")]
    public GameObject emptyHardwareListUI;
    [Tooltip("UI to display when there are hardware items of the current type")]
    public GameObject nonEmptyHardwareListUI;

    private HardwareType _currentHardwareType = HardwareType.Office;
    private List<HardwareUI> _hardwareUIs = new List<HardwareUI>();

    // ------------------------------------------------------------------------
    void Awake() {
      foreach (HardwareType hardwareType in Enum.GetValues(typeof(HardwareType))) {
        if (hardwareType != HardwareType.Invalid) {
          AddHardwareTypeToggle(hardwareType);
        }
      }
    }

    // ------------------------------------------------------------------------
    void OnEnable() {
      hardwareCatalog.OnValueChanged += ResetHardwareList;
      ResetHardwareList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      hardwareCatalog.OnValueChanged -= ResetHardwareList;
    }

    // ------------------------------------------------------------------------
    private void AddHardwareTypeToggle(HardwareType hardwareType) {
      var toggle = Instantiate(hardwareTypeTogglePrefab, hardwareTypeContentArea);
      toggle.SetHardwareType(hardwareType, hardwareTypeToggleGroup);
      toggle.onHardwareTypeSelected += () => {
        _currentHardwareType = hardwareType;
        ResetHardwareList();
      };
    }

    // ------------------------------------------------------------------------
    private void ResetHardwareList() {
      if (hardwareCatalog.Value != null) {
        // Clear out our previous list
        foreach (var hardwareUI in _hardwareUIs) {
          Destroy(hardwareUI.gameObject);
        }
        _hardwareUIs.Clear();

        var hardwareList = hardwareCatalog.Value.GetHardwareOfType(_currentHardwareType);
        emptyHardwareListUI.SetActive(hardwareList.Count == 0);
        nonEmptyHardwareListUI.SetActive(hardwareList.Count != 0);
        foreach (var hardware in hardwareList) {
          var hardwareUI = Instantiate(hardwareUIPrefab, hardwareUIContentArea);
          hardwareUI.SetHardware(hardware);
          hardwareUI.onBuyHardware += () => {
            onBuyHardware?.Raise(hardware.id);
            currentViewType.Back();
          };
          _hardwareUIs.Add(hardwareUI);
        }
      }
    }
  }
}
