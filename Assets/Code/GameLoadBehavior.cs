using System;
using System.Collections;
using System.IO;
using UnityEngine;

public class GameLoadBehavior : MonoBehaviour {
  //public static string user_app_path = "C:\\Documents and Settings\\mfthomps\\Application Data\\CyberCIEGE";
  public static string user_app_path =
    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

  public static GameObject main_floor;
  public static ProceduralScript procedural_settings;
  public static ProceduralScript physical_settings;

  public static DACGroups dac_groups;

  /* TBD FIX CAMERA management */
  public static Vector3 home_pos = new Vector3(58.0f, 11.0f, 27.0f);
  public static Quaternion home_rot = Quaternion.Euler(10.6f, -26.8f, 0.3f);

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

  private static void LoadItems() {
    NetworkBehavior.LoadNetworks(user_app_path);
    procedural_settings = CreateProceduralItems();
    physical_settings = new ProceduralScript("physical.txt");
    Debug.Log("Calling LoadHardwareTypes");
    CatalogBehavior.LoadHardwareTypes();
    CatalogBehavior.LoadCatalog(user_app_path);
    OrganizationScript.LoadOrganization();
    GameObject ws = GameObject.Find("WorkSpace");
    WorkSpaceScript ws_script = (WorkSpaceScript) ws.GetComponent(typeof(WorkSpaceScript));
    WorkSpaceScript.LoadWorkSpace();
    dac_groups = new DACGroups();
    UserBehavior.LoadUsers();
    AssetBehavior.LoadAssets();
    ComputerBehavior.LoadAllComputers();
    DeviceBehavior.LoadDevices(user_app_path);
    ITStaffBehavior.LoadStaffFromFile();
    ZoneBehavior.LoadZones();
    ObjectivesBehavior.LoadObjectives();

    //UserBehavior.UpdateStatus();
    //LoadMainOffice();
  }

  //---------------------------------------------------------------------------
  //Work in progress.  Just hacking out a list of the procedural settings a 
  //computer can be configured with.
  private static ProceduralScript CreateProceduralItems() {
    var procedural = new ProceduralScript {proc_dict = {
      ["NoEmailAttachmentExecute"] = "Beware of Email Attachments"
    }};
    return procedural;
  }

  private IEnumerator Example() {
    print(Time.time);
    yield return new WaitForSeconds(1);
    print(Time.time);
  }

  public static void AfterServerReady() {
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