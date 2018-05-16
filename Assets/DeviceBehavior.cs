using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeviceBehavior : ComponentBehavior {
	static string DEVICES = "devices";
	static string user_app_path;
	public static void LoadOneDevice(string device_file)
	{
		GameObject device;
		device = GameObject.Find("Device");
		//Debug.Log("user_app_path" + user_app_path + " file [" + computer_file+"]");
		string cdir = System.IO.Path.Combine(user_app_path, DEVICES);
		string cfile = System.IO.Path.Combine(cdir, device_file);
		//Debug.Log("computer " + cdir);
		GameObject new_d = Instantiate(device, new Vector3(1.0F, 0, 0), Quaternion.identity);
		DeviceBehavior script = (DeviceBehavior)new_d.GetComponent(typeof(DeviceBehavior));
		script.SetFilePath(cfile);
		new_d.SetActive(true);
		script.LoadComponent();
		int pos = script.position;
		//Debug.Log("LoadComputers " + script.computer_name + " pos is " + pos);
		if (pos < 0)
		{
			Debug.Log("LoadOneDevice got invalid pos for " + script.component_name);
			return;
		}
		WorkSpaceScript.WorkSpace ws = WorkSpaceScript.GetWorkSpace(pos);
		int slot = ws.AddDevice(script.component_name);
		float xf, zf;
		ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
		//Debug.Log(ws.x + " " + ws.y + " " + xf + " " + zf);
		Vector3 v = new Vector3(xf, 0.5f, zf);
		new_d.transform.position = v;
	}
	public static void LoadDevices(string path)
	{
		user_app_path = path;
		string cdir = System.IO.Path.Combine(user_app_path, DEVICES);
		string[] clist = System.IO.Directory.GetFiles(cdir);
		int i = 1;
		foreach (string device_file in clist)
		{
			LoadOneDevice(device_file);
			i++;
		}
	}
	// Use this for initialization
	void Start () {
		
	}

}
