using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using System.Text;
using UnityEngine.SceneManagement;
using System;

public class PlayerScript : MonoBehaviour {
	XmlDocument catalog_doc = new XmlDocument();
	XmlDocument campaign_doc;
	//string game_path = "c:/cyberciege";
	public Dropdown campaign_dropdown;
	public Dropdown scenario_dropdown;
	public Dropdown saved_game_dropdown;
	public Button play_button;
	public Button quit_button;
	public Button browse_button;
	public InputField game_path_field;
	private string NEW_GAME = "new_game";
	Dictionary<string, XmlNode> campaign_dict = new Dictionary<string, XmlNode>();
	Dictionary<string, XmlNode> scenario_dict;

	string prefs_path = null;
	bool updating_prefs = false;

	public GUISkin skin;
	public Texture2D file, folder, back, drive;
	string[] layoutTypes = { "Type 0", "Type 1" };
	FileBrowser fb = new FileBrowser();
	bool bs = false;
	// Use this for initialization
	void Start()
	{
		game_path_field.text = "c:\\cc_svn";

		updating_prefs = true;
		prefs_path = Path.Combine(GameLoadBehavior.user_app_path, "PlayerPrefs.xml");
		try{
			Directory.CreateDirectory (GameLoadBehavior.user_app_path);
		}catch(Exception e){
			Debug.Log ("could not create directory " + prefs_path);
		}
		RestorePrefs();
		updating_prefs = false;
		PopulateCampaigns();
		campaign_dropdown.onValueChanged.AddListener(delegate
		{
			CampaignChanged();

		});
		play_button.onClick.AddListener(PlayClicked);
		quit_button.onClick.AddListener(QuitClicked);
		browse_button.onClick.AddListener(BrowseClicked);

		scenario_dropdown.onValueChanged.AddListener(delegate
		{
			ScenarioChanged();
		});



		fb.guiSkin = skin; //set the starting skin
							   //set the various textures
		fb.fileTexture = file;
		fb.directoryTexture = folder;
		fb.backTexture = back;
		fb.driveTexture = drive;
		//show the search bar
		fb.showSearch = true;

	}
	void PopulateCampaigns()
	{

		string catalog_xml = Path.Combine(game_path_field.text, "ccse/SAT/bin/CampaignCatalog.xml");
		if (!File.Exists(catalog_xml))
		{
			Debug.Log("Bad game path"+catalog_xml);
			campaign_dropdown.ClearOptions();
			scenario_dropdown.ClearOptions();
			saved_game_dropdown.ClearOptions();
			return;
		}
		catalog_doc.Load(catalog_xml);
		campaign_dropdown.ClearOptions();
		List<Dropdown.OptionData> ddo = new List<Dropdown.OptionData>();

		XmlNodeList campaign_nodes = catalog_doc.SelectNodes("//campaigncatalog/campaign");
		foreach (XmlNode campaign in campaign_nodes)
		{
			string campaign_name = campaign["name"].InnerText.Trim();
			//Debug.Log("campaign name is " + campaign_name);
			Dropdown.OptionData new_data = new Dropdown.OptionData(campaign_name);
			ddo.Add(new_data);
			campaign_dict[campaign_name] = campaign;
		}
		campaign_dropdown.AddOptions(ddo);
		CampaignChanged();
	}
	void SetDropdown(Dropdown dd, string value)
	{
		Debug.Log("SetDropdown for " + value);
		int i = 0;
		int found = -1;
		foreach (Dropdown.OptionData option in dd.options)
		{
			Debug.Log("check " + option.text);
			if (option.text.Trim() == value.Trim())
			{
				Debug.Log("found IT");
				found = i;
				break;
			}
			i++;
		}
		if (found >= 0)
		{
			dd.value = found;
		}

	}
	void RestorePrefs()
	{
		if (File.Exists(prefs_path))
		{
			XmlDocument xml_doc = new XmlDocument();

			xml_doc.Load(prefs_path);
			XmlNode prefs = xml_doc.SelectSingleNode("/prefs");
			game_path_field.text = prefs["game_path"].InnerText;
			string campaign = prefs["campaign"].InnerText;
			SetDropdown(campaign_dropdown, campaign);
			string scenario = prefs["scenario"].InnerText;
			SetDropdown(scenario_dropdown, scenario);
		}
		else
		{
			Debug.Log("RestorePrefs no prefs file at " + prefs_path);
		}
	}
	void SavePrefs()
	{
		XDocument xml_doc = new XDocument( new XElement("prefs",
			new XElement("game_path", game_path_field.text),
			new XElement("campaign", campaign_dropdown.captionText.text),
			new XElement("scenario", scenario_dropdown.captionText.text)));
		xml_doc.Save(prefs_path);
		Debug.Log("SavePrefs to " + prefs_path);

	}
	void CampaignChanged()
	{
		scenario_dropdown.ClearOptions();
		List<Dropdown.OptionData> ddo = new List<Dropdown.OptionData>();
		scenario_dict = new Dictionary<string, XmlNode>();

		string new_campaign = campaign_dropdown.captionText.text;
		//Debug.Log("new campaign is <" + new_campaign+">");
		campaign_doc = new XmlDocument();
		string cat_xml_file = Path.Combine("game", new_campaign);
		//Debug.Log("cat_xml_file is <" + cat_xml_file + ">");
		cat_xml_file = Path.Combine(cat_xml_file, "campaign.xml");
		cat_xml_file = Path.Combine(game_path_field.text, cat_xml_file);
		campaign_doc.Load(cat_xml_file);
		XmlNode campaign_node = campaign_doc.SelectSingleNode("//campaignrelease/campaign");
		XmlNodeList scenario_nodes = campaign_node.SelectNodes("scenario");
		foreach (XmlNode scenario in scenario_nodes)
		{
			string scenario_name = scenario["name"].InnerText;
			//Debug.Log("scenario name is " + scenario_name);
			Dropdown.OptionData new_data = new Dropdown.OptionData(scenario_name);
			ddo.Add(new_data);
			scenario_dict[scenario_name] = scenario;
		}
		scenario_dropdown.AddOptions(ddo);
		ScenarioChanged();
		//Debug.Log("done campainchanged");
	}
	string GetScenario(string sdf_path)
	{
		StreamReader reader = new StreamReader(sdf_path, Encoding.Default);
		string sdf_id = ccUtils.SDTField(reader, "SDFid");
		string scene = sdf_id.Split()[0];
		//Debug.Log("scene is " + scene);
		scene = scene.Split('.')[0].Trim();
		reader.Close();
		return scene;
	}
	void ScenarioChanged()
	{
		saved_game_dropdown.ClearOptions();
		List<Dropdown.OptionData> ddo = new List<Dropdown.OptionData>();
		string new_scenario = scenario_dropdown.captionText.text;
		XmlNode scenario_node = scenario_dict[new_scenario];
		string sdf = scenario_node["sdf"].InnerText.Trim();


		string new_campaign = campaign_dropdown.captionText.text;
		string campaign_dir = Path.Combine(game_path_field.text, "game");
		campaign_dir = Path.Combine(campaign_dir, new_campaign);

		string sdf_path = Path.Combine(campaign_dir, sdf);
		string scenario_name = GetScenario(sdf_path);

		string user_name = System.Environment.UserName;
		string user_dir = Path.Combine(campaign_dir, user_name);
		ddo.Add(new Dropdown.OptionData(NEW_GAME));
		//foreach (string file in Directory.GetFiles(user_dir, "*.sdf"))
        foreach (string file in Directory.GetFiles(campaign_dir, "*.sdf"))
		{
		//	string full = Path.Combine(user_dir, file);
			string saved_scene = GetScenario(file);
			if (saved_scene == scenario_name)
			{
				string fname = Path.GetFileName(file);
				Dropdown.OptionData new_data = new Dropdown.OptionData(fname.Split('.')[0]);
				ddo.Add(new_data);
				Debug.Log("saved is " + fname + " scene " + saved_scene);
			}
		}
		saved_game_dropdown.AddOptions(ddo);
		if (!updating_prefs)
		{
			updating_prefs = true;
			SavePrefs();
			updating_prefs = false;
		}
	}
	public void QuitClicked()
	{
		Application.Quit();
	}
	public void BrowseClicked()
	{
		bs = true;
	}
	public void PlayClicked()
	{
		Debug.Log("Play clicked");
		string new_scenario = scenario_dropdown.captionText.text;
		string new_campaign = campaign_dropdown.captionText.text;
		string saved_game = saved_game_dropdown.captionText.text;
		System.Diagnostics.Process proc = new System.Diagnostics.Process();
		string args = "";
		XmlNode scenario_node = scenario_dict[new_scenario];
		string sdf = scenario_node["sdf"].InnerText.Trim();
		if (saved_game == NEW_GAME)
		{

			string cmd = Path.Combine(game_path_field.text, "ccse/SAT/bin/CyberCIEGE.bat");
			proc.StartInfo.FileName = cmd;
			args = "\"" + new_campaign + "\"" + " " + sdf + " " + sdf + " " + "yes";
		}
		else
		{
			string saved_sdf = saved_game + ".sdf";
			string campaign_dir = Path.Combine(game_path_field.text, "game");
			campaign_dir = Path.Combine(campaign_dir, new_campaign);
			string user_name = System.Environment.UserName;
			string user_dir = Path.Combine(campaign_dir, user_name);
			string cmd = Path.Combine(game_path_field.text, "ccse/SAT/bin/SavedCyberCIEGE.bat");
			proc.StartInfo.FileName = cmd;
			string sdf_path = Path.Combine(user_dir, saved_sdf);
			string scenario_name = GetScenario(sdf_path);
			string log_dir = Path.Combine(user_dir, "logs");
			string log_file = Path.Combine(log_dir, Path.GetFileNameWithoutExtension(sdf));
			args = "\"" + new_campaign + "\"" + " " + "\"" + log_file + "\"" + " " + "\"" + saved_game + "\"" + " " + "\"" + sdf_path + "\"" + " headless";
			//args = "\"" + new_campaign + "\"" + " " + "\"" + log_dir + "\"" + " " + "\"" + saved_game + "\"" + " " + "\"" + sdf_path + "\"";
		}
		Debug.Log("args is " + args);
		proc.StartInfo.Arguments = args;

		string working_dir = Path.Combine(game_path_field.text, "ccse");
		proc.StartInfo.WorkingDirectory = working_dir;
		proc.Start();
		SceneManager.LoadScene("cyber1");
	}
	public void OnGUI()
	{
		if (bs)
		{
			if (fb.draw())
			{ //true is returned when a file has been selected
			  //the output file is a member if the FileInfo class, if cancel was selected the value is null
				if (fb.outputDirectory != null)
				{
					string selected_dir = fb.outputDirectory.ToString();
					game_path_field.text = selected_dir;
					Debug.Log("selected is " + selected_dir);
					PopulateCampaigns();

				}
				bs = false;
			}
			else
			{
				//Debug.Log("fb returned false");
			}
		}
	}
	// Update is called once per frame
	void Update () {
		
	}
}
