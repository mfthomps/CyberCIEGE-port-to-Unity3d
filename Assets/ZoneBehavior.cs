using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using System.Text;
using System;

public class ZoneBehavior : MonoBehaviour {
	private static Rect WindowRect = new Rect(10, 10, 250, 300);
	public static Texture2D background, LOGO;

    public static string root_zone_name = null; //May use to scale computer procedurally if I can't do it manually.

	string file_path;
	public string zone_name;
	public static Dictionary<string, ZoneBehavior> zone_dict = new Dictionary<string, ZoneBehavior>();
	ConfigurationSettings config_settings = null;
	PhysicalSettings phys_settings = null;
	ZoneConfigure zone_config_script; /* menu of current configuration values shared between instances TBC static?*/
	int ulc_x;
	int ulc_y;
	int lrc_x;
	int lrc_y;
	public static void LoadOneZone(string zone_file, Color color)
	{
		GameObject zone = GameObject.Find("Zone");
		//Debug.Log("user_app_path" + user_app_path + " file [" + User_file+"]");
		string cfile = System.IO.Path.Combine(GameLoadBehavior.user_app_path, zone_file);
		//Debug.Log("user " + cdir);
		GameObject new_c = Instantiate(zone, new Vector3(1.0F, 0, 0), Quaternion.identity);
		new_c.GetComponent<Renderer>().material.color = color;
		ZoneBehavior script = (ZoneBehavior)new_c.GetComponent(typeof(ZoneBehavior));
		script.SetFilePath(cfile);
		new_c.SetActive(true);
		script.LoadZone();
		script.DoPosition();
	}
	public static void doItems()
	{

		WindowRect = GUI.Window(1, WindowRect, ZoneMenu, "Zones");
	}
	private static void ZoneMenu(int id)
	{
		foreach (string key in zone_dict.Keys)
		{
			if (GUILayout.Button(key))
			{
				ZoneBehavior script = zone_dict[key];
				menus.clicked = "";
				script.ConfigureCanvas();

			}
		}
	}
	public void SetFilePath(string path)
	{
		file_path = path;
	}
	public static void LoadZones()
	{
		Color[] colors = new Color[6];
		colors[0] = Color.cyan;
		colors[1] = Color.red;
		colors[2] = Color.green;
		colors[3] = Color.blue;
		string zone_dir = System.IO.Path.Combine(GameLoadBehavior.user_app_path, "zones");
		string[] clist = System.IO.Directory.GetFiles(zone_dir);
		int i = 0;
		foreach (string zone_file in clist)
		{
			if (zone_file.EndsWith(".sdf"))
			{
				LoadOneZone(zone_file, colors[i]);
				i++;
			}
		}

	}
	public void LoadZone()
	{
		this.config_settings = new ConfigurationSettings(false, "");
		this.phys_settings = new PhysicalSettings();
		try
		{
			StreamReader reader = new StreamReader(file_path, Encoding.Default);
			using (reader)
			{
				string tag;
				//Debug.Log("LoadUser read from " + file_path);
				ccUtils.PositionAfter(reader, "Zone");
				string value = null;
				do
				{
					value = ccUtils.SDTNext(reader, out tag);
					if (value == null)
						continue;
					if (value == "")
					{
						Debug.Log("ZoneBehavior empty value");
						continue;
					}
					if (!this.config_settings.HandleConfigurationSetting(tag, value))
					{
						if (!this.phys_settings.HandleConfigurationSetting(tag, value))
						{
							//Debug.Log("LoadUser got " + value + " for tag " + tag);
							switch (tag)
							{
								case "Name":
									this.zone_name = value;
									//Debug.Log("LoadComponent adding to dict: " + this.user_name);
									zone_dict.Add(this.zone_name, this);
									this.config_settings.SetName(value);
                                    string lowerName = value.ToLower();
                                    if (lowerName.Contains("entire") && root_zone_name == null){
                                        root_zone_name = this.zone_name;
                                    }
									break;
								case "ULC":
									string[] parts = value.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
									if (!int.TryParse(parts[0], out this.ulc_x))
									{
										Debug.Log("Error: ZoneBehavior parsing " + value);
										return;
									}
									if (!int.TryParse(parts[1], out this.ulc_y))
									{
										Debug.Log("Error: ZoneBehavior parsing " + value);
										return;
									}
									break;
								case "LRC":
									parts = value.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
									if (!int.TryParse(parts[0], out this.lrc_x))
									{
										Debug.Log("Error: ZoneBehavior parsing " + value);
										return;
									}
									if (!int.TryParse(parts[1], out this.lrc_y))
									{
										Debug.Log("Error: ZoneBehavior parsing " + value);
										return;
									}
									break;
							}
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
	public void DoPosition()
	{
		Debug.Log("zone " + zone_name + " " + ulc_x + " " + ulc_y + " " + lrc_x + " " + lrc_y);
		int left = ulc_x;
		int right = lrc_x;
		int top = ulc_y;
		int bottom = lrc_y;
		Vector3 scale = new Vector3();
		Vector3 pos = new Vector3();
		pos.x = left+(right-left)/2;
		pos.z = bottom+(top-bottom)/2;
		transform.position = pos;
		scale.x = (float)(right - left)/10.0f;
		scale.z = (float)(top - bottom)/10.0f;

		scale.y = 1;
		transform.localScale = scale;
	}
	public void ConfigureCanvas()
	{
		Debug.Log("ZoneBehavior ConfigureCanvas");

		GameObject zone_panel = menus.menu_panels["ZonePanel"];
		menus.ActiveScreen(zone_panel.name);

		zone_config_script = (ZoneConfigure)zone_panel.GetComponent(typeof(ZoneConfigure));
		this.config_settings.ConfigureCanvas(this, zone_config_script);
		this.phys_settings.ConfigureCanvas(this, zone_config_script);
		zone_panel.SetActive(true);


	}
	public void ProcChanged(Toggle toggle)
	{
		this.config_settings.ProcChanged(toggle);
	}
	public void PhysChanged(Toggle toggle)
	{
		this.phys_settings.PhysChanged(toggle);
	}
	public void PasswordChanged(string group_name, Toggle toggle)
	{
		this.config_settings.PasswordChanged(group_name, toggle);
	}
	public void AccessChanged(Toggle toggle)
	{
		this.phys_settings.AccessChanged(toggle);
	}

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
