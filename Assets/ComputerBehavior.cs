using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System;
using System.Text;
using System.Xml.Linq;
using UnityEngine.UI;
/*
 * Represents computer attributes, inheriting from ComponentBehavior.
 */
public class ComputerBehavior : ComponentBehavior {
	static string COMPUTERS = "computers";

	
	private static Rect ConfigureRect = new Rect(10, 10, 900, 800);

	ComputerConfigure computer_config_script; /* menu of current configuration values shared between instances TBC static?*/
	ConfigurationSettings config_settings = null;
	List<string> asset_list = new List<string>();
	List<string> user_list = new List<string>(); // currently users & groups, TBD separate
	string assigned_user;

	public static void LoadOneComputer(string computer_file)
	{
		GameObject computer;
		computer = GameObject.Find("Computer");
		//Debug.Log("user_app_path" + user_app_path + " file [" + computer_file+"]");
		string cdir = System.IO.Path.Combine(GameLoadBehavior.user_app_path, COMPUTERS);
		string cfile = System.IO.Path.Combine(cdir, computer_file);
		//Debug.Log("computer " + cdir);
		GameObject new_c = Instantiate(computer, new Vector3(1.0F, 0, 0), Quaternion.identity);
        //string asset_dir = System.IO.Path.Combine(GameLoadBehavior.user_app_path, "MayaArt");
        //asset_dir = System.IO.Path.Combine(asset_dir, "objects");
        //asset_dir = System.IO.Path.Combine(asset_dir, "dell");
        //string mesh_path = System.IO.Path.Combine(asset_dir, "dell.asset")
        Mesh dell_mesh = Resources.Load<Mesh>("dell.asset");
        Material dell_mat = Resources.Load<Material>("dell_mat.mat");
        SkinnedMeshRenderer comp_render = new_c.GetComponent<SkinnedMeshRenderer>();
        comp_render.sharedMesh = dell_mesh;
        comp_render.material = dell_mat;
		ComputerBehavior script = (ComputerBehavior)new_c.GetComponent(typeof(ComputerBehavior));
		script.SetFilePath(cfile);
		new_c.SetActive(true);
		script.LoadComponent();
		script.LoadComputer();
		int pos = script.position;
		//Debug.Log("LoadComputers " + script.computer_name + " pos is " + pos);
		if (pos < 0)
		{
			Debug.Log("LoadOneComputer got invalid pos for " + script.component_name);
			return;
		}
		WorkSpaceScript.WorkSpace ws = WorkSpaceScript.GetWorkSpace(pos);
		int slot = ws.AddComputer(script.component_name);
		float xf, zf;
		ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
		//Debug.Log(ws.x + " " + ws.y + " " + xf + " " + zf);
		Vector3 v = new Vector3(xf, 0.5f, zf);
		new_c.transform.position = v;
	}
	public static void LoadAllComputers()
	{
		string cdir = System.IO.Path.Combine(GameLoadBehavior.user_app_path, COMPUTERS);
		string[] clist = System.IO.Directory.GetFiles(cdir);
		int i = 1;
		foreach (string computer_file in clist)
		{
			LoadOneComputer(computer_file);
			i++;
		}
	}
	public void LoadComputer()
	{
		this.config_settings = new ConfigurationSettings(true, this.component_name);

		try
		{
			StreamReader reader = new StreamReader(filePath, Encoding.Default);
			using (reader)
			{
				string tag;
				//Debug.("LoadComputer read from " + filePath);
				ccUtils.PositionAfter(reader, "Component");
				string value = null;
				do
				{
					value = ccUtils.SDTNext(reader, out tag).Trim();
					if (value == null)
						continue;
					//Debug.Log("LoadComputer got " + value + " for tag " + tag);
					if(!this.config_settings.HandleConfigurationSetting(tag, value))
					{
						switch (tag)
						{
							case "Assets":
								asset_list.Add(value);
								AssetBehavior asset = AssetBehavior.asset_dict[value];
								asset.SetComputer(this);
								break;
							case "AccessListLocal":
								user_list.Add(value);
								break;
							case "User":
								assigned_user = value;
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
	public void ACLConfigure(string asset_name)
	{
		
		ConfigureRect = GUILayout.Window(2, ConfigureRect, this.DoACL, "ACL for " + asset_name);
	}



	public void ConfigureCanvas()
	{
		//Debug.Log("ConfigureCanvas");

		GameObject computer_panel = menus.menu_panels["ComputerPanel"];
		menus.ActiveScreen(computer_panel.name);
		computer_panel.SetActive(true);

		computer_config_script = (ComputerConfigure)computer_panel.GetComponent(typeof(ComputerConfigure));
		config_settings.ConfigureCanvas(this, computer_config_script);


		computer_config_script.SetAssets(this.asset_list, this);

		//computer_config_script.SetTest();
		//Debug.Log("return from ConfigureCanvas");
	}
	public void DoACL(int i)
	{
		Debug.Log("DoACL");
		GUILayout.BeginVertical();

	}
	public void HandleConfigure()
	{
		Debug.Log("HandleConfigure");
		if (menus.clicked.EndsWith("Configure"))
		{
			menus.clicked = "";
			ConfigureCanvas();
		}
		else if (menus.MenuLevel(3) == "ACL")
		{
			ACLConfigure(menus.MenuLevel(4));
		}

	}
	/*  NOT USED, example of creation as part of OnGui 

	public void DoConfigure(int i)
	{
		Dictionary<string,bool> copy_dict = new Dictionary<string, bool>(this.proc_dict);
		//GUILayout.BeginArea(new Rect(25, 25, 150, 700));
		GUILayout.BeginHorizontal();
		GUILayout.BeginVertical();
		GUILayout.Label("Procedural Settings", label_style);
		foreach (KeyValuePair<string, bool> entry in copy_dict)
		{
			string label = ProceduralScript.proc_dict[entry.Key];
			bool newval = GUILayout.Toggle(entry.Value, label);
			if(newval != entry.Value)
			{
				//Debug.Log("ComputerConfig selected " + entry.Key+" value was "+entry.Value);
				this.proc_dict[entry.Key] = newval;
				XElement xml = new XElement("componentEvent",
					new XElement("name", this.component_name),
					new XElement("procSetting",
						new XElement("field", entry.Key+":"),
						new XElement("value", newval)));

				IPCManagerScript.SendRequest(xml.ToString());
				//Debug.Log("Value now " + this.proc_dict[entry.Key]);
			}
		}
		GUILayout.EndVertical();
		//GUILayout.EndArea();
		
		GUILayout.BeginVertical();
		GUILayout.Label("Password Length", label_style);
		DoToggleGroup(PWD_LEN);
		GUILayout.Label("Change Frequency", label_style);
		DoToggleGroup(PWD_CHANGE);
		GUILayout.Label("Password Complexity", label_style);
		DoToggleGroup(PWD_COMPLEX);
		GUILayout.EndVertical();
		GUILayout.EndHorizontal();
	}
	public void DoToggleGroup(string group_name)
	{
		Dictionary<string, bool> my_dict = this.group_dict[group_name];
		Dictionary<string, bool> copy_dict = new Dictionary<string, bool>(my_dict);
		foreach (KeyValuePair<string, bool> entry in copy_dict)
		{
			bool newval = GUILayout.Toggle(entry.Value, entry.Key);
			if (newval != entry.Value)
			{
				if (this.group_value[group_name] != null)
				{
					SetGroupValue(group_name, my_dict, this.group_value[group_name], false);
					//my_dict[this.group_value[group_name]] = false;
					if (entry.Key != this.group_value[group_name])
					{
						// new selected, turn it on 
	//my_dict[entry.Key] = true;
						SetGroupValue(group_name, my_dict, entry.Key, true);
						this.group_value[group_name] = entry.Key;
					}
					else
					{
						//toggle previous, so length now none ;
						this.group_value[group_name] = null;
					}
				}
				else
				{
					SetGroupValue(group_name, my_dict, entry.Key, true);
					this.group_value[group_name] = entry.Key;
				}
			}
		}
	}

	*/
	public void ProcChanged(Toggle toggle)
	{
		this.config_settings.ProcChanged(toggle);
	}
	public void PasswordChanged(string group_name, Toggle toggle)
	{
		this.config_settings.PasswordChanged(group_name, toggle);
	}
	public void AssetClicked(GameObject go)
	{
		string asset_name = computer_config_script.GetCurrentAsset();


		Debug.Log("AssetClicked " + asset_name);
	}
	public static void RemoveComputer(string computer_name)
	{
		if (!computer_dict.ContainsKey(computer_name))
		{
			Debug.Log("ERROR: RemoveComputer, no computer named " + computer_name);
			return;
		}
		ComponentBehavior bh = computer_dict[computer_name];
		GameObject.Destroy(bh.gameObject);
	}
	// Use this for initialization
	void Start () {

	}
	

}
