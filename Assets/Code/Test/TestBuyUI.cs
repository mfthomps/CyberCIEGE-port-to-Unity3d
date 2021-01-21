using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Code.Hardware;
using Code.User_Interface.Main;

namespace Code.Test {
  public class TestBuyUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Header("Input Variables")]
    [Tooltip("Current view type the user is viewing")]
    public ViewTypeVariable currentViewType;

    // --------------------------------------------------------------------------
    void Start() {
      // Setup the hardware catalog just like in the real game
      var assetBundle = AssetBundle.LoadFromFile(Path.Combine(Application.dataPath, "AssetBundles", "objects"));
      var hardwareTypePath = Path.Combine(Application.dataPath, "HardwareTypes");
      var hardwareDefinitions = new List<Tuple<HardwareType, string>>{
        new Tuple<HardwareType, string>(HardwareType.Servers, Path.Combine(hardwareTypePath, "servers.txt")),
        new Tuple<HardwareType, string>(HardwareType.Workstations, Path.Combine(hardwareTypePath, "workstations.txt")),
        new Tuple<HardwareType, string>(HardwareType.NetworkDevices, Path.Combine(hardwareTypePath, "devices.txt")),
      };
      hardwareCatalog.Value = new HardwareCatalog(assetBundle, hardwareDefinitions, GameLoadBehavior.user_app_path);

      currentViewType.Value = ViewType.Buy;
      currentViewType.OnValueChanged += OnCurrentViewChanged;
    }

    // --------------------------------------------------------------------------
    void OnDestroy() {
      currentViewType.OnValueChanged -= OnCurrentViewChanged;
      currentViewType.Reset();
    }

    // --------------------------------------------------------------------------
    public void OnBuyHardware(string hardwareID) {
      Debug.Log($"Started buy process for {hardwareID}");
    }

    // --------------------------------------------------------------------------
    private void OnCurrentViewChanged() {
      Debug.Log($"Current view changed to {currentViewType.Value}");
    }
  }
}
