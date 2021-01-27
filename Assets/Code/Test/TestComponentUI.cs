using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.Hardware;

namespace Code.Test {
  public class TestComponentUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    [Header("Factories")]
    [Tooltip("The factory to use for creating Assets")]
    [SerializeField] private AssetFactory _assetFactory;

    [Tooltip("The factory to use for creating Computers")]
    [SerializeField] private ComputerFactory _computerFactory;

    [Tooltip("The factory to use for creating Organizations")]
    [SerializeField] private OrganizationFactory _organizationFactory;

    [Tooltip("The factory to use for creating Users")]
    [SerializeField] private UserFactory _userFactory;

    [Tooltip("The factory to use for creating Workspaces")]
    [SerializeField] private WorkspaceFactory _workspaceFactory;

    // ------------------------------------------------------------------------
    void Start() {
      var user_app_path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

      var assetBundle = AssetBundle.LoadFromFile(Path.Combine(Application.dataPath, "AssetBundles", "objects"));
      var hardwareTypePath = Path.Combine(Application.dataPath, "HardwareTypes");
      var hardwareDefinitions = new List<Tuple<HardwareType, string>>{
        new Tuple<HardwareType, string>(HardwareType.Servers, Path.Combine(hardwareTypePath, "servers.txt")),
        new Tuple<HardwareType, string>(HardwareType.Workstations, Path.Combine(hardwareTypePath, "workstations.txt")),
        new Tuple<HardwareType, string>(HardwareType.NetworkDevices, Path.Combine(hardwareTypePath, "devices.txt")),
      };
      hardwareCatalog.Value = new HardwareCatalog(assetBundle, hardwareDefinitions, user_app_path);

      _organizationFactory.CreateAll(user_app_path);
      _workspaceFactory.CreateAll(user_app_path);
      _userFactory.CreateAll(user_app_path);
      _assetFactory.CreateAll(user_app_path);
      _computerFactory.CreateAll(user_app_path);
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      hardwareCatalog.Reset();
      selectedObject.Reset();
    }
  }
}
