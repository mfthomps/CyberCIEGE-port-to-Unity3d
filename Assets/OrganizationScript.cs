using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Text;
using System;

public class OrganizationScript : MonoBehaviour {
	static Dictionary<string, string> organization = new Dictionary<string, string>();
	public static string GetValue(string tag)
	{
		//Debug.Log("Organization GetValue for " + tag);
		return organization[tag];
	}
	public static void LoadOrganization()
	{
		//Debug.Log("LoadOrganization");
		string tag;
		string full_path = Path.Combine(GameLoadBehavior.user_app_path, "organization.sdf");
		try
		{
			StreamReader reader = new StreamReader(full_path, Encoding.Default);
			using (reader)
			{
				//Debug.Log("LoadOrganization read from "+full_path);
				ccUtils.PositionAfter(reader, "Organization");
				string value = null;
				do
				{
					value = ccUtils.SDTNext(reader, out tag);
					if (value == null)
						continue;
					//Debug.Log("LoadOrganization got " + value + " for tag " + tag);
					organization.Add(tag, value);
				}
				while (value != null);
				// Use this for initialization

			}
		}
		catch (Exception e)
		{
			Console.WriteLine(e.Message + "\n");
		}
	}

	// Use this for initialization
	void Start () {
		
	}

}
