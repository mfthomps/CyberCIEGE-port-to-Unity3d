using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Net.Sockets;
using System.Text;
using System;
public class GameLoadBehavior : MonoBehaviour {


	//public static string user_app_path = "C:\\Documents and Settings\\mfthomps\\Application Data\\CyberCIEGE";
	public static string user_app_path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");
	public static GameObject main_floor;
	public static ProceduralScript procedural_settings = null;
	public static ProceduralScript physical_settings = null;
	public static DACGroups dac_groups = null;
	/* TBD FIX CAMERA management */
	public static Vector3 home_pos = new Vector3(58.0f, 11.0f, 27.0f);
	public static Quaternion home_rot = Quaternion.Euler(10.6f, -26.8f, 0.3f);


	void LoadMainOffice()
	{
		string path = System.IO.Path.Combine(user_app_path, "mainoffice.txt");
		StreamReader f = new StreamReader(path);
		string line = f.ReadLine();
		string[] parts = line.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
		int top = -1;
		if (!int.TryParse(parts[1], out top))
		{
			Debug.Log("Error LoadMainOffice parse " + parts[1]);
		}
		int left = -1;
		if (!int.TryParse(parts[2], out left))
		{
			Debug.Log("Error LoadMainOffice parse " + parts[1]);
		}
		int bottom = -1;
		if (!int.TryParse(parts[3], out bottom))
		{
			Debug.Log("Error LoadMainOffice parse " + parts[1]);
		}
		int right = -1;
		if (!int.TryParse(parts[4], out right))
		{
			Debug.Log("Error LoadMainOffice parse " + parts[1]);
		}

		GameObject floor = GameObject.Find("Floor");
		main_floor = Instantiate(floor, new Vector3(left*1.0f, 0, top*1.0f), Quaternion.identity);
		FloorScript floor_script = (FloorScript)main_floor.GetComponent(typeof(FloorScript));
		floor_script.DoPosition(top, left, bottom, right);
	}

	static void LoadItems()
	{
		
		NetworkBehavior.LoadNetworks(user_app_path);
		procedural_settings = new ProceduralScript("procedural.txt");
		physical_settings = new ProceduralScript("physical.txt");
        Debug.Log("Calling LoadHardwareTypes");
		CatalogBehavior.LoadHardwareTypes();
		CatalogBehavior.LoadCatalog(user_app_path);
		OrganizationScript.LoadOrganization();
		GameObject ws = GameObject.Find("WorkSpace");
		WorkSpaceScript ws_script = (WorkSpaceScript)ws.GetComponent(typeof(WorkSpaceScript));
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
	IEnumerator Example()
	{
		print(Time.time);
		yield return new WaitForSeconds(1);
		print(Time.time);
	}
	public static void AfterServerReady()
	{
		LoadItems();
		Debug.Log("Back from LoadItems");

		GameObject mainCamera = GameObject.Find("Main Camera");
		//		Vector3 pos = new Vector3(40.0f, 3.0f, 33.0f);
		//		Quaternion rot = Quaternion.Euler(11.8f, 0.0f, 0.0f);

		//mainCamera.transform.position = pos;
		mainCamera.transform.rotation = home_rot;
		MaxCamera cameraScript = (MaxCamera)Camera.main.GetComponent(typeof(MaxCamera));
		cameraScript.setPosition(home_pos);

	}
	void Start () {

		Debug.Log("HI THERE");
		/* connect to server*/
		IPCManagerScript.ConnectServer();
		//AfterServerReady();
		Debug.Log("back from wait init server");
		//GameObject ticker = GameObject.Find("ScrollText");
		//ScrollingTextScript st = (ScrollingTextScript)ticker.GetComponent(typeof(ScrollingTextScript));
		//st.AddMessage("the time has come for all brown dogs to come to the aid of their quick brown foxes");


	}

}
