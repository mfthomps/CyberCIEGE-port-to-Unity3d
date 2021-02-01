using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Serialization;
using UltimateCameraController.Cameras.Controllers;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.Hardware;

public class GameLoadBehavior : MonoBehaviour {
  //public static string user_app_path = "C:\\Documents and Settings\\mfthomps\\Application Data\\CyberCIEGE";
  public static string user_app_path =
    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

  public static string ccInstallPath;

  public static GameObject main_floor;

  [Tooltip("The Camera Controller to use when jumping between items in the scenario.")]
  [SerializeField] private CameraController cameraController;

  [Header("Output Events/Variables")]
  [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
  public HardwareCatalogVariable hardwareCatalog;
  [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
  public GameEvent gameInitialized;

  [Header("Factories")]
  [Tooltip("The factory to use for creating AccessControlGroups")]
  [SerializeField] private AccessControlGroupFactory _accessControlGroupFactory;

  [Tooltip("The factory to use for creating Clearances")]
  [SerializeField] private ClearanceFactory _clearanceFactory;

  [Tooltip("The factory to use for creating Assets")]
  [SerializeField] private AssetFactory _assetFactory;

  [Tooltip("The factory to use for creating Computers")]
  [SerializeField] private ComputerFactory _computerFactory;
  
  [Tooltip("The factory to use for creating Devices")]
  [SerializeField] private DeviceFactory _deviceFactory;
  
  [Tooltip("The factory to use for creating Networks")]
  [SerializeField] private NetworkFactory _networkFactory;

  [Tooltip("The factory to use for creating Organizations")]
  [SerializeField] private OrganizationFactory _organizationFactory;
  
  [FormerlySerializedAs("_itStaffFactory")]
  [Tooltip("The factory to use for creating ITStaff")]
  [SerializeField] private StaffFactory _staffFactory;
  
  [Tooltip("The factory to use for creating Users")]
  [SerializeField] private UserFactory _userFactory;
  
  [Tooltip("The factory to use for creating Workspaces")]
  [SerializeField] private WorkspaceFactory _workspaceFactory;

  [Tooltip("The factory to use for creating Zones")]
  [SerializeField] private ZoneFactory _zoneFactory;
  
  // --------------------------------------------------------------------------
  private void Start() {
    /* connect to server*/
    IPCManagerScript.ConnectServer();
    //AfterServerReady();
  }

  // --------------------------------------------------------------------------
  private void LoadMainOffice() {
    string path = Path.Combine(user_app_path, "mainoffice.txt");
    StreamReader f = new StreamReader(path);
    string line = f.ReadLine();
    string[] parts = line.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
    int top = -1;
    if (!int.TryParse(parts[1], out top)) Debug.Log("Error LoadMainOffice parse " + parts[1]);

    int left = -1;
    if (!int.TryParse(parts[2], out left)) Debug.Log("Error LoadMainOffice parse " + parts[1]);

    int bottom = -1;
    if (!int.TryParse(parts[3], out bottom)) Debug.Log("Error LoadMainOffice parse " + parts[1]);

    int right = -1;
    if (!int.TryParse(parts[4], out right)) Debug.Log("Error LoadMainOffice parse " + parts[1]);

    GameObject floor = GameObject.Find("Floor");
    main_floor = Instantiate(floor, new Vector3(left * 1.0f, 0, top * 1.0f), Quaternion.identity);
    FloorScript floor_script = (FloorScript) main_floor.GetComponent(typeof(FloorScript));
    floor_script.DoPosition(top, left, bottom, right);
    Debug.Log("main_floor instantiated, name is " + main_floor.name);
  }

  // --------------------------------------------------------------------------
  private void LoadItems() {
    InitializeHardwareCatalog();
    _accessControlGroupFactory.CreateAll(user_app_path);
    _clearanceFactory.CreateAll(user_app_path);
    _organizationFactory.CreateAll(user_app_path);
    _networkFactory.CreateAll(user_app_path);
    _workspaceFactory.CreateAll(user_app_path);
    _userFactory.CreateAll(user_app_path);
    _assetFactory.CreateAll(user_app_path);
    _computerFactory.CreateAll(user_app_path);
    _deviceFactory.CreateAll(user_app_path);
    _staffFactory.CreateAll(user_app_path);
    _zoneFactory.CreateAll(user_app_path);
  }
  
  // --------------------------------------------------------------------------
  public void AfterServerReady() {
    LoadItems();
    gameInitialized?.Raise();
  }

  // --------------------------------------------------------------------------
  private void InitializeHardwareCatalog() {
    var assetBundle = AssetBundle.LoadFromFile(Path.Combine(Application.dataPath, "AssetBundles", "objects"));
    var hardwareTypePath = Path.Combine(Application.dataPath, "HardwareTypes");
    var hardwareDefinitions = new List<Tuple<HardwareType, string>>{
      new Tuple<HardwareType, string>(HardwareType.Servers, Path.Combine(hardwareTypePath, "servers.txt")),
      new Tuple<HardwareType, string>(HardwareType.Workstations, Path.Combine(hardwareTypePath, "workstations.txt")),
      new Tuple<HardwareType, string>(HardwareType.NetworkDevices, Path.Combine(hardwareTypePath, "devices.txt")),
    };
    hardwareCatalog.Value = new HardwareCatalog(assetBundle, hardwareDefinitions, user_app_path);
  }
}