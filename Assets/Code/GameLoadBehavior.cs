using System;
using System.Collections;
using System.IO;
using Code.Factories;
using UnityEngine;

public class GameLoadBehavior : MonoBehaviour {
  //public static string user_app_path = "C:\\Documents and Settings\\mfthomps\\Application Data\\CyberCIEGE";
  public static string user_app_path =
    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

  public static GameObject main_floor;

  public static DACGroups dac_groups;

  /* TBD FIX CAMERA management */
  public static Vector3 home_pos = new Vector3(58.0f, 11.0f, 27.0f);
  public static Quaternion home_rot = Quaternion.Euler(10.6f, -26.8f, 0.3f);

  [Tooltip("The factory to use for creating Computers")]
  [SerializeField] private ComputerFactory _computerFactory;
  
  [Tooltip("The factory to use for creating Organizations")]
  [SerializeField] private OrganizationFactory _organizationFactory;
  
  [Tooltip("The factory to use for creating Workspaces")]
  [SerializeField] private WorkspaceFactory _workspaceFactory;
  
  [Tooltip("The factory to use for creating Devices")]
  [SerializeField] private DeviceFactory _deviceFactory;
  
  [Tooltip("The factory to use for creating ITStaff")]
  [SerializeField] private ITStaffFactory _itStaffFactory;
  
  [Tooltip("The factory to use for creating Users")]
  [SerializeField] private UserFactory _userFactory;
  
  [Tooltip("The factory to use for creating Zones")]
  [SerializeField] private ZoneFactory _zoneFactory;

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

  private void LoadItems() {
    NetworkBehavior.LoadNetworks(user_app_path);
    CatalogBehavior.LoadHardwareTypes();
    CatalogBehavior.LoadCatalog(user_app_path);
    _organizationFactory.CreateAll(user_app_path);
    _workspaceFactory.CreateAll(user_app_path);
    dac_groups = new DACGroups();
    _userFactory.CreateAll(user_app_path);
    AssetBehavior.LoadAssets();
    _computerFactory.CreateAll(user_app_path);
    _deviceFactory.CreateAll(user_app_path);
    _itStaffFactory.CreateAll(user_app_path);
    _zoneFactory.CreateAll(user_app_path);
    ObjectivesBehavior.LoadObjectives();

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
    Debug.Log("Back from LoadItems");

    GameObject mainCamera = GameObject.Find("Main Camera");
    //		Vector3 pos = new Vector3(40.0f, 3.0f, 33.0f);
    //		Quaternion rot = Quaternion.Euler(11.8f, 0.0f, 0.0f);

    //mainCamera.transform.position = pos;
    mainCamera.transform.rotation = home_rot;
    Camera.main.depth = 1;
    MaxCamera cameraScript = (MaxCamera) Camera.main.GetComponent(typeof(MaxCamera));
    cameraScript.setPosition(home_pos);
  }
}