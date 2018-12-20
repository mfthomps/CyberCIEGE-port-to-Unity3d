using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using System.Text;
using UnityEngine;

public class DeviceBehavior : ComponentBehavior {
	static string DEVICES = "devices";
	static string user_app_path;
    private static string hw_name;

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
        script.LoadDevice();
        script.hw = hw_name;
        SkinnedMeshRenderer this_render = new_d.GetComponent<SkinnedMeshRenderer>();
        try
        {
            this_render.sharedMesh = CatalogBehavior.object_mesh_dict[script.hw];
        } catch (KeyNotFoundException)
        {
            Debug.Log("Key exception in object_mesh_dict caused by " + script.hw);
        }
        try
        {
            this_render.material = CatalogBehavior.object_mat_dict[script.hw];
        } catch (KeyNotFoundException)
        {
            Debug.Log("Key exception in object_mat_dict caused by " + script.hw);
        }
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

    public void LoadDevice()
    {
        try
		{
			StreamReader reader = new StreamReader(filePath, Encoding.Default);
			using (reader)
			{
				string tag;
                //Debug.("LoadDevice read from " + filePath);
                ccUtils.PositionAfter(reader, "Component");
				string value = null;
				do
				{
					value = ccUtils.SDTNext(reader, out tag).Trim();
                    if (value == null)
                    {
                        continue;
                    } else {
                        //Debug.Log("LoadComputer got " + value + " for tag " + tag);

                        switch (tag)
                        {
                            case "HW":  //Right now I think we're only using one of the params here, could change though
                                hw_name = value;
                                break;
                        }
                    }           
                }
				while (value != null);
			}
		}
		catch (Exception e)
		{
			Console.WriteLine(e.Message + "\n");
		}
	}

	void Start () {
		
	}

}
