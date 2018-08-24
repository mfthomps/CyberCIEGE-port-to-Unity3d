using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System;
using System.Text;
using System.Linq;
using System.Xml.Linq;

public class CatalogBehavior : MonoBehaviour {
	static List<string> server_hw_list = new List<string>();
	static List<string> ws_hw_list = new List<string>();
	static List<string> device_hw_list = new List<string>();
	static List<string> server_list = new List<string>();
	static List<string> ws_list = new List<string>();
	static List<string> device_list = new List<string>();
	private static Rect WindowRect = new Rect(10, 10, 250, 300);
	public static Texture2D background, LOGO;
	static Dictionary<string, int> catalog_ids = new Dictionary<string, int>();
    public static Dictionary<string, Mesh> object_mesh_dict = new Dictionary<string, Mesh>();
    public static Dictionary<string, Material> object_mat_dict = new Dictionary<string, Material>();
	private static GameObject buying_object = null;
	private static string buying_item = null;
	private static bool do_buy = false;
    public static AssetBundle objBundle;
    public static bool objBundleLoaded = false;
    private static string bundle_path = Path.Combine(GameLoadBehavior.user_app_path, "AssetBundles");



    public static void LoadHardwareTypes()
	{
		server_list = new List<string>();
		ws_list = new List<string>();
		device_list = new List<string>();
        if (!objBundleLoaded)
        {
            LoadObjBundle();
        }
        string hw_types_dir = Path.Combine(GameLoadBehavior.user_app_path, "HardwareTypes");
       
    //ccUtils.LoadListFromFile(Path.Combine(hw_types_dir, "servers.txt"), server_hw_list);
    //ccUtils.LoadListFromFile(Path.Combine(hw_types_dir, "workstations.txt"), ws_hw_list);
        ccUtils.LoadListFromFile(Path.Combine(hw_types_dir, "devices.txt"), device_hw_list);
        //Debug.Log("Calling LoadHWInfoFromFile for servers");
        ccUtils.LoadHWInfoFromFile(Path.Combine(hw_types_dir, "servers.txt"), server_hw_list, object_mesh_dict, object_mat_dict);
        //Debug.Log("Calling LoadHWInfoFromFile for workstations");
        ccUtils.LoadHWInfoFromFile(Path.Combine(hw_types_dir, "workstations.txt"), ws_hw_list, object_mesh_dict, object_mat_dict);
        foreach(string s in ws_hw_list)
        {
            Debug.Log(s);
        }

        UnloadObjBundle();

	}

    public static void LoadObjBundle()
    {
        objBundle = AssetBundle.LoadFromFile(Path.Combine(bundle_path, "objects"));
        objBundleLoaded = true;
    }

    public static void UnloadObjBundle()
    {
        objBundle.Unload(false); //Don't want to unload any objects from the bundle we've already loaded.
        objBundleLoaded = false;
    }

    private static bool StringIn(List<string> list, string s)
	{
		//Debug.Log("StringIn, len is "+list.Count);
		foreach (string lvalue in list)
		{
			//Debug.Log("StringIn test " + lvalue);
			if (lvalue == s)
			{
				return true;
			}
		}
		return false;
	}
	public static List<string> GetHWList(string hw)
	{
		//Debug.Log("in GetHWList for "+hw);
		//Debug.Log("GetHWList server_hw_list len is " + server_hw_list.Count);
		if (StringIn(server_hw_list, hw))
		{
			//Debug.Log("is server");
			return server_list;
		}
		else if (StringIn(ws_hw_list,hw))
		{
			//Debug.Log("is ws");
			return ws_list;
		}
		else if (StringIn(device_hw_list,hw))
		{
			//Debug.Log("is dev");
			return device_list;
		}
		//Debug.Log("SOL");
		if (server_hw_list.Any(opt => opt.Equals(hw, StringComparison.InvariantCultureIgnoreCase)))
		{
			//Debug.Log("is server");
			return server_list;
		}
		else if (ws_hw_list.Any(opt => opt.Equals(hw, StringComparison.InvariantCultureIgnoreCase)))
		{
			//Debug.Log("is ws");
			return ws_list;
		}
		else if (device_hw_list.Any(opt => opt.Equals(hw, StringComparison.InvariantCultureIgnoreCase)))
		{
			//Debug.Log("is dev");
			return device_list;
		}
		Debug.Log("ERROR: no hw list for " + hw);
		return null;
	}

	public static void LoadCatalog(string user_app_dir)
	{
		string cat_file = Path.Combine(user_app_dir, "catalog.sdf");
		//Debug.Log("LoadCatalog " + cat_file);
		string line;
		string in_line;
		string cname=null;
		int cur_id = 0;
		List<string> hw_list;
		try
		{
			StreamReader reader = new StreamReader(cat_file, Encoding.Default);
			using (reader)
			{
				do
				{
					in_line = reader.ReadLine();
					if (in_line == null)
						continue;
					line = in_line.Trim();
					//Debug.Log("line " + line);
					if (line.StartsWith("Name"))
					{
						cname = ccUtils.SDTField(line, "Name");
						//Debug.Log("LoadCatalog name is " + cname);
					}
					else if (line.StartsWith("HW"))
					{
						string hw = ccUtils.SDTField(line, "HW");
						//Debug.Log("LoadCatalog hw is " + hw);
						//Debug.Log("len of list is " + server_hw_list.Count);
						hw_list = GetHWList(hw);

						hw_list.Add(cname);
						catalog_ids.Add(cname, cur_id);
						cur_id++;
					}
				}
				while (in_line != null);
				// Use this for initialization

			}
		}
		catch (Exception e)
		{
			Console.WriteLine(e.Message + "\n");
		}
	}


	public static void doMenu()
	{
		if (LOGO != null && menus.clicked != "about")
		{
			GUI.DrawTexture(new Rect((Screen.width / 6) - 100, 30, 200, 200), LOGO);
		}
		WindowRect = GUI.Window(1, WindowRect, menuBuy, "Buy");
	}
	public static void doItems()
	{
		if (menus.clicked == "Catalog:Buying")
		{
			Vector2 pt = ccUtils.GetMouseGrid();
			Vector3 pos = new Vector3(pt.x, 0, pt.y);
			buying_object.transform.position = pos;
			int xout, yout, index;
			WorkSpaceScript.FindClosestWorkspaceCenter(out xout, out yout, out index);
			if (index >= 0)
			{
				WorkSpaceScript.WorkSpace ws = WorkSpaceScript.GetWorkSpace(index);
				bool room = true;
				Debug.Log("buying object name " + buying_object.name);
				if (buying_object.name.StartsWith("Computer"))
				{
					if (!ws.ComputerRoom())
					{
						room = false;
					}
				}
				else
				{
					if (!ws.DeviceRoom())
					{
						room = false;
					}
				}
				Debug.Log("ws " + index + " usage " + ws.usage + " room? "+room);
				if (room && Input.GetMouseButtonDown(0) && !Input.GetKey(KeyCode.LeftAlt))
				{
					Debug.Log("Catalog buy");
					do_buy = true;
				}
			}
			else
			{
				Debug.Log("not here");
			}
		}
		else
		{
//			GUI.DrawTexture(new Rect((Screen.width / 6) - 100, 30, 200, 200), LOGO);
			WindowRect = GUI.Window(1, WindowRect, MenuItems, "Item");
		}
	}
	public static void BuyItHere()
	{
		Destroy(buying_object);
		buying_object = null;
		//int item_id = catalog_ids[buying_item];
		int outx, outy, index;
		WorkSpaceScript.FindClosestWorkspaceCenter(out outx, out outy, out index);
		// catalogName position
		XElement xml = new XElement("componentEvent",
			new XElement("name", ""),
			new XElement("buy",
				new XElement("catalogName", buying_item),
				new XElement("position", index)));

		Debug.Log(xml.ToString());

		IPCManagerScript.SendRequest(xml.ToString());
		menus.clicked = "";
	}
	private static void MenuItems(int id)
	{
		List<string> menu_list= new List<string>();
		//Debug.Log("MenuItems for " + menus.clicked);
		switch (menus.clicked)
		{
			case "Catalog:Servers":
				menu_list = server_list;
				break;
			case "Catalog:Workstations":
				menu_list = ws_list;
				break;
			case "Catalog:Devices":
				menu_list = device_list;
				break;

		}
		//Debug.Log("len is " + menu_list.Count);
		foreach (string item in menu_list)
		{
			//Debug.Log("try " + item);
			if (GUILayout.Button(item))
			{
				Debug.Log("bought " + item);
				buying_item = item;
				GameObject computer = GameObject.Find("Computer");
				buying_object = Instantiate(computer, new Vector3(1.0F, 0, 0), Quaternion.identity);
				menus.clicked = "Catalog:Buying";
				break;
			}
		}
	}
	private static void menuBuy(int id)
	{
		//Debug.Log("in menuBuy");
		if (GUILayout.Button("Servers"))
		{
			menus.clicked = "Catalog:Servers";
		}
		else if (GUILayout.Button("Workstations"))
		{
			menus.clicked = "Catalog:Workstations";
		}
		else if (GUILayout.Button("Devices"))
		{
			menus.clicked = "Catalog:Devices";
		}
		else if (GUILayout.Button("Close menu"))
		{
			menus.clicked = "";
		}
	}
	void Update()
	{
		if (do_buy)
		{
			BuyItHere();
			do_buy = false;
		}
	}
		// Use this for initialization
		void Start () {

	}

}
