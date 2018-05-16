using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Text;
using System;
public class NetworkBehavior : MonoBehaviour {
	public static List<string> network_list = new List<string>();
	public string network_name = null;
	public bool is_static = false;
	public bool is_leased = false;

	public void LoadOneNetwork(string sdf)
	{
		//Debug.Log("LoadOneNetwork");
		MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(sdf ?? ""));
		this.network_name = ccUtils.SDTField(stream, "Name");
		network_list.Add(this.network_name);
		//Debug.Log("got name " + this.network_name);
		this.is_static = ccUtils.SDTFieldDefault(stream, "Static", false);
		this.is_leased = ccUtils.SDTFieldDefault(stream, "Leased", false);

	}
	public static void LoadNetworks(string user_app_path)
	{
		string filePath = System.IO.Path.Combine(user_app_path, "networks.sdf");
		GameObject network = GameObject.Find("Network");
		string line = "";
		try
		{
			StreamReader reader = new StreamReader(filePath, Encoding.ASCII);

			using (reader)
			{
				string tag;
				//Debug.Log("LoadNetworks read from " + filePath);
				string value = null;
				do
				{
					value = ccUtils.SDTNext(reader, out tag);
					if (value == null)
						continue;
					//Debug.Log("LoadNetwork got " + value + " for tag " + tag);
					if (tag != "Network")
					{
						Debug.Log("LoadNetwork found unexpected tag " + tag);
						Debug.Break();
						return;
					}
					GameObject new_network = Instantiate(network, new Vector3(1.0F, 0, 0), Quaternion.identity);
					//new_network.SetActive(false);
					NetworkBehavior script = (NetworkBehavior)new_network.GetComponent(typeof(NetworkBehavior));
					script.LoadOneNetwork(value);
				}
				while (value != null);
				//Debug.Break();

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
