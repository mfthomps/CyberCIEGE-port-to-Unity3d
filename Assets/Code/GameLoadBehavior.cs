using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Code.Factories;
using UltimateCameraController.Cameras.Controllers;
using UnityEngine;
using Code.Hardware;
using UnityEngine.Serialization;

public class GameLoadBehavior : MonoBehaviour {
  //public static string user_app_path = "C:\\Documents and Settings\\mfthomps\\Application Data\\CyberCIEGE";
  public static string user_app_path =
    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

  public static GameObject main_floor;

  public static DACGroups dac_groups;
  
  [Tooltip("The Camera Controller to use when jumping between items in the scenario.")]
  [SerializeField] private CameraController cameraController;

  [Header("Output Variables")]
  [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
  public HardwareCatalogVariable hardwareCatalog;

  [Header("Factories")]
  [Tooltip("The factory to use for creating Computers")]
  [SerializeField] private ComputerFactory _computerFactory;
  
  [Tooltip("The factory to use for creating Organizations")]
  [SerializeField] private OrganizationFactory _organizationFactory;
  
  [Tooltip("The factory to use for creating Workspaces")]
  [SerializeField] private WorkspaceFactory _workspaceFactory;
  
  [Tooltip("The factory to use for creating Devices")]
  [SerializeField] private DeviceFactory _deviceFactory;
  
  [FormerlySerializedAs("_itStaffFactory")]
  [Tooltip("The factory to use for creating ITStaff")]
  [SerializeField] private StaffFactory _staffFactory;
  
  [Tooltip("The factory to use for creating Users")]
  [SerializeField] private UserFactory _userFactory;
  
  [Tooltip("The factory to use for creating Zones")]
  [SerializeField] private ZoneFactory _zoneFactory;
  
  [Tooltip("The factory to use for creating Assets")]
  [SerializeField] private AssetFactory _assetFactory;

  private void Start() {
    
    /* connect to server*/
    IPCManagerScript.ConnectServer();
    //AfterServerReady();
    
    //GameObject ticker = GameObject.Find("ScrollText");
    //ScrollingTextScript st = (ScrollingTextScript)ticker.GetComponent(typeof(ScrollingTextScript));
    //st.AddMessage("the time has come for all brown dogs to come to the aid of their quick brown foxes");
  }


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
    NetworkBehavior.LoadNetworks(user_app_path);
    InitializeHardwareCatalog();
    _organizationFactory.CreateAll(user_app_path);
    _workspaceFactory.CreateAll(user_app_path);
    dac_groups = new DACGroups();
    _userFactory.CreateAll(user_app_path);
    _assetFactory.CreateAll(user_app_path);
    _computerFactory.CreateAll(user_app_path);
    _deviceFactory.CreateAll(user_app_path);
    _staffFactory.CreateAll(user_app_path);
    _zoneFactory.CreateAll(user_app_path);

    //UserBehavior.UpdateStatus();
    //LoadMainOffice();
  }
  
  private IEnumerator Example() {
    print(Time.time);
    yield return new WaitForSeconds(1);
    print(Time.time);
  }

  public void AfterServerReady() {
    LoadItems();
    
    //TODO Where should the camera start from?
    //This will auto slave the camera target to the first user. If none, try the first component.
    UserBehavior ub = UserBehavior.GetNextUser();
    if (ub != null) {
      cameraController.targetObject = ub.transform;  
    }
    else {
      var component = ComponentBehavior.GetNextComponent();
      if (component != null) {
        cameraController.targetObject = component.transform;
      }
    }

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