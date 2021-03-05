using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Serialization;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.Hardware;

public class GameLoadBehavior : MonoBehaviour {
  public static GameObject main_floor;

  [Header("Output Events/Variables")]
  [Tooltip("Path to the CyberCIEGE Install folder")]
  public StringVariable ccInstallPath;
  [Tooltip("Path to the user's AppData folder")]
  public StringVariable userAppPath;
  [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
  public HardwareCatalogVariable hardwareCatalog;
  [Tooltip("TBD")]  // TODO: complete tooltip
  public HardwareCatalogVariable hardwareScriptableObject;
  [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
  public GameEvent gameInitialized;

  [Header("Factories")]
  [Tooltip("The factory to use for creating AccessControlGroups")]
  [SerializeField] private AccessControlGroupFactory _accessControlGroupFactory;
  [Tooltip("The factory to use for creating Assets")]
  [SerializeField] private AssetFactory _assetFactory;
  [Tooltip("The factory to use for creating AssetGoals")]
  [SerializeField] private AssetGoalFactory _assetGoalFactory;
  [Tooltip("The factory to use for creating Clearances")]
  [SerializeField] private ClearanceFactory _clearanceFactory;
  [Tooltip("The factory to use for creating Computers")]
  [SerializeField] private ComputerFactory _computerFactory;
  [Tooltip("The factory to use for creating Devices")]
  [SerializeField] private DeviceFactory _deviceFactory;
  [Tooltip("The factory to use for creating Networks")]
  [SerializeField] private NetworkFactory _networkFactory;
  [Tooltip("The factory to use for creating Organizations")]
  [SerializeField] private OrganizationFactory _organizationFactory;
  [Tooltip("The factory to use for creating Software")]
  [SerializeField] private SoftwareFactory _ssoftwareFactory;
  [FormerlySerializedAs("_itStaffFactory")]
  [Tooltip("The factory to use for creating ITStaff")]
  [SerializeField] private StaffFactory _staffFactory;
  [Tooltip("The factory to use for creating Users")]
  [SerializeField] private UserFactory _userFactory;
  [Tooltip("The factory to use for creating Workspaces")]
  [SerializeField] private WorkspaceFactory _workspaceFactory;
  [Tooltip("The factory to use for creating Zones")]
  [SerializeField] private ZoneFactory _zoneFactory;
  [Tooltip("The factory to use for creating ViewPoints")]
  [SerializeField] private ViewPointFactory _viewPointFactory;

  private static string _ccInstallPath;

  private AssetBundle _loadedAssetBundle;
  
  // --------------------------------------------------------------------------
  void Awake() {
    ccInstallPath.Value = _ccInstallPath;
    userAppPath.Value = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");
  }

  // --------------------------------------------------------------------------
  void OnDestroy() {
    ccInstallPath.Reset();
    userAppPath.Reset();
    hardwareCatalog.Reset();
    if (_loadedAssetBundle != null) {
      _loadedAssetBundle.Unload(true);
    }
  }

  // --------------------------------------------------------------------------
  public static void StoreCCInstallPath(string path) {
    // We need to temporarily store this path in a static variable since
    // ScriptableVariables don't handle scene changes very well
    _ccInstallPath = path;
  }

  // --------------------------------------------------------------------------
  public void AfterServerReady() {
    InitializeHardwareCatalog(userAppPath.Value);
    _accessControlGroupFactory.CreateAll(userAppPath.Value);
    _assetGoalFactory.CreateAll(userAppPath.Value);
    _clearanceFactory.CreateAll(userAppPath.Value);
    _organizationFactory.CreateAll(userAppPath.Value);
    _networkFactory.CreateAll(userAppPath.Value);
    _workspaceFactory.CreateAll(userAppPath.Value);
    _userFactory.CreateAll(userAppPath.Value);
    _assetFactory.CreateAll(userAppPath.Value);
    _computerFactory.CreateAll(userAppPath.Value);
    _deviceFactory.CreateAll(userAppPath.Value);
    _ssoftwareFactory.CreateAll(userAppPath.Value);
    _staffFactory.CreateAll(userAppPath.Value);
    _zoneFactory.CreateAll(userAppPath.Value);
    _viewPointFactory.CreateAll(userAppPath.Value);


    // Let everyone know we are done initializing
    gameInitialized?.Raise();
  }

  // --------------------------------------------------------------------------
  private void InitializeHardwareCatalog(string userAppPath) {
    //_loadedAssetBundle = AssetBundle.LoadFromFile(Path.Combine(Application.dataPath, "AssetBundles", "objects"));
    //var hardwareTypePath = Path.Combine(Application.dataPath, "HardwareTypes");
    //var hardwareDefinitions = new List<Tuple<HardwareType, string>>{
    //  new Tuple<HardwareType, string>(HardwareType.Servers, Path.Combine(hardwareTypePath, "servers.txt")),
    //  new Tuple<HardwareType, string>(HardwareType.Workstations, Path.Combine(hardwareTypePath, "workstations.txt")),
    //  new Tuple<HardwareType, string>(HardwareType.NetworkDevices, Path.Combine(hardwareTypePath, "devices.txt")),
    //};
    // skip first two parameters, and pass in the scriptable variable I just made...
    //hardwareCatalog.Value = new HardwareCatalog(_loadedAssetBundle, hardwareDefinitions, userAppPath);

    hardwareCatalog.Value = new HardwareCatalog(hardwareScriptableObject, userAppPath);
  }

}

// 1. list of assets: scriptable variable
// 2. use that to create the hardware needed in a specific scenario -> GameLoadBehavior