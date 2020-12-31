using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System;
using System.Text;
using System.Linq;
using System.Xml.Linq;
using System.Xml;
public class ObjectivesBehavior : MonoBehaviour {
	public static Dictionary<string, Objective> objective_dict = new Dictionary<string, Objective>();
	public static Dictionary<string, Phase> phase_dict = new Dictionary<string, Phase>();
	public static int current_phase = 0;
	private static Rect WindowRect = new Rect(10, 10, 550, 300);
	public static Texture2D background, LOGO;
	public class Phase
	{
		public string phase_name;
		public string display_name;
		public string completed_text;
		public string uncompleted_text;
		public bool phase_complete;
		public int index;
		public Phase(string block, int index)
		{
			MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(block ?? ""));
			phase_name = ccUtils.SDTField(stream, "TagName");
			display_name = ccUtils.SDTField(stream, "DisplayName");
			completed_text = ccUtils.SDTField(stream, "CompletedText");
			uncompleted_text = ccUtils.SDTField(stream, "UncompletedText");
			if (!bool.TryParse(ccUtils.SDTField(stream, "PhaseCompleted"), out phase_complete))
			{
				Debug.Log("Error Phase parsing " + block);
			}
			this.index = index;
		}
	}
	public class Objective
	{
		public string objective_name;
		public string display_name;
		public string completed_text;
		public string uncompleted_text;
		public int phase;
		public int last_phase;
		public bool objective_complete;
		public Objective(string block)
		{
			//Debug.Log("Objective for block " + block);
			MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(block ?? ""));
			objective_name = ccUtils.SDTField(stream, "TagName");
			display_name = ccUtils.SDTField(stream, "DisplayName");
			completed_text = ccUtils.SDTField(stream, "CompletedText");
			uncompleted_text = ccUtils.SDTField(stream, "UncompletedText");
			if (!int.TryParse(ccUtils.SDTField(stream, "Phase"), out phase))
			{
				Debug.Log("ERROR parsing phase from " + block);
			}
			if (!int.TryParse(ccUtils.SDTField(stream, "LastPhase"), out last_phase))
			{
				Debug.Log("ERROR parsing LastPhase from " + block);
			}
			if (!bool.TryParse(ccUtils.SDTField(stream, "ObjectiveCompleted"), out objective_complete))
			{
				Debug.Log("ERROR parsing ObjectiveCompleted from " + block);
			}

		}
	}
	public static void ObjectiveStatus(string message)
	{
		StringReader reader = new StringReader(message);
		//reader.Read(); // skip BOM ???

		XmlDocument xml_doc = new XmlDocument();
		xml_doc.Load(reader);
		XmlNode objective_node = xml_doc.SelectSingleNode("//objective");
		string name = objective_node["name"].InnerText;
		string status = objective_node["completed"].InnerText;
		Debug.Log("status is " + status);
		bool completed = false;
		if (!bool.TryParse(status, out completed))
		{
			Debug.Log("Error: ObjectiveStatus parse " + status);
		}
		objective_dict[name].objective_complete = completed;
	}
	public static void ShowObjectives(int id)
	{
		string objective = "";
		//Debug.Log("current phase is " + current_phase);
		foreach (KeyValuePair<string, Objective> entry in objective_dict)
		{
			//Debug.Log("tagname is " + entry.Key +" phase "+entry.Value.phase+" last phase "+entry.Value.last_phase +" completed "+entry.Value.objective_complete);
			if (entry.Value.phase >= current_phase && entry.Value.last_phase <= current_phase &&
				!entry.Value.objective_complete)
			{
				objective += entry.Value.display_name + ":"+entry.Value.uncompleted_text+"\n";
			}
		}
		//Debug.Log("ShowObjectives got " + objective);

		GUILayout.TextArea(objective);
		if (GUILayout.Button("Close menu"))
		{
			menus.clicked = "";
		}
	}
	public static void doItems()
	{

		WindowRect = GUI.Window(1, WindowRect, ShowObjectives, "Objectives");
	}
	public static void PhaseDone(string phase)
	{
		phase_dict[phase].phase_complete = true;
		SetCurrentPhase();
	}
	public static void SetCurrentPhase()
	{
		/* find the completed phase with the highest index */
		foreach (KeyValuePair<string, Phase> entry in phase_dict)
		{
			Debug.Log("phase " + entry.Value.display_name + " " + entry.Value.phase_complete);
			if (entry.Value.phase_complete && (entry.Value.index > current_phase))
			{
				current_phase = entry.Value.index;
			}
		}
		// current is next after most advanced
		current_phase++;
		Debug.Log("SetCurrentPhase set to " + current_phase);
	}
	public static string GetCurrentPhase()
	{
		/* get the name of the current phase */
		foreach (KeyValuePair<string, Phase> entry in phase_dict)
		{
			if (entry.Value.index == current_phase)
				return entry.Key;
		}
		return null;
	}
	public static void LoadObjectives()
	{
		string obj_file = Path.Combine(GameLoadBehavior.user_app_path, "objectives.sdf");
		//Debug.Log("LoadObjectives " + obj_file);
		string line;
		string in_line;
		string value = null;
		string tag;
		int phase_index = 0;

		StreamReader reader = new StreamReader(obj_file, Encoding.Default);

		using (reader)
		{
			ccUtils.PositionAfter(reader, "Phases");
			do
			{
				value = ccUtils.SDTNext(reader, out tag);
				if (value == null || value == "end")
					continue;
				Phase phase = new Phase(value, phase_index);
				phase_dict[phase.phase_name] = phase;
				Debug.Log("block for " + tag + " index "+phase_index+ " is " + value);
				phase_index++;
			} while (value != null && value != "end");
			ccUtils.PositionAfter(reader, "Objectives");
			do
			{
				value = ccUtils.SDTNext(reader, out tag);
				if (value == null || value == "end")
					continue;
				Objective obj = new Objective(value);
				if(obj == null)
                {
					Debug.Log("Error: LoadObjectives null object for value " + value);
					continue;
                }
				objective_dict[obj.objective_name] = obj;
				//Debug.Log("block for " + tag + " is " + value);
			} while (value != null && value != "end");

		}


		Debug.Log("LoadObjectives set current phase");
		SetCurrentPhase();
	}
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
