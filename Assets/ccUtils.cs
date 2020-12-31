using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using System.IO;
using System.Text;
using System;

public class ccUtils : MonoBehaviour {
	//static float GRID_SIZE = 3.0f;
	static float GRID_SIZE = 1.0f;

    public static void LoadHWInfoFromFile(string fname, List<string> hw_list, Dictionary<string, Mesh> mesh_dict, Dictionary<string, Material> mat_dict){
        
        string device_name;
        string asset_name;
        Mesh this_mesh;
        Material this_mat;
        List<string> this_list = new List<string>();
        LoadListFromFile(fname, this_list);

        foreach(string s in this_list){
            //Debug.Log("Now processing " + s);
            if (s.Contains(",")) {
                string[] s_array = s.Split(',');
                device_name = s_array[0];
                asset_name = s_array[1];
                hw_list.Add(device_name);
                if (!mesh_dict.ContainsKey(device_name))
                {
                    this_mesh = CatalogBehavior.objBundle.LoadAsset<Mesh>(asset_name);
                    mesh_dict.Add(device_name, this_mesh);
                }
                if (!mat_dict.ContainsKey(device_name))
                {
                    this_mat = CatalogBehavior.objBundle.LoadAsset<Material>(asset_name);
                    mat_dict.Add(device_name, this_mat);
                }
                 //Debug.Log("Loaded " + s_array);
                //foreach(string st in mesh_dict.Keys)
                //{
                 //   Debug.Log(st);
                //}
                //foreach(string st in mat_dict.Keys)
                //{
                //    Debug.Log(st);
                //}

            } else {
                hw_list.Add(s);
            }

        }
    }

	public static void LoadListFromFile(string fname, List<string> hw_list)
	{
		Debug.Log("LoadListFromFile " + fname);
		string line;
		try
		{
			StreamReader reader = new StreamReader(fname, Encoding.Default);
			using (reader)
			{
				do
				{
					line = reader.ReadLine();
                    //Debug.Log(line);
					if(line != null)
						hw_list.Add(line.Trim());
					//Debug.Log("added " + line.Trim());
				}
				while (line != null);
				// Use this for initialization

			}
		}
		catch (Exception e)
		{
			Console.WriteLine(e.Message + "\n");
		}
	}
	
	public static string SDTField(string line, string token)
	{
		line = line.Trim();
		if (!line.StartsWith(token + ":"))
		{
			Debug.Log("SDTField, did not find " + token);
			return null;
		}
		if (!line.EndsWith(":end"))
		{
			Debug.Log("SDTField, did not find end in "+line);
			return null;
		}
		int len = line.Length - token.Length - 6;
		string retval = line.Substring(token.Length + 2, len);
		return retval.Trim();
	}
	public static string SDTField(StreamReader reader, string token)
	{

		string line = "";
		string retval = null;
		string full_line = "";
		while (retval == null && line != null)
		{
			line = reader.ReadLine();
			if (line == null)
				break;
			line = line.Trim();
			//Debug.Log("SDTField line is " + line);
			if (line.StartsWith(token + ":"))
			{
				full_line = line;
			}else if (full_line.Length > 0)
            {
				full_line = full_line + line;
            }
			if(full_line.Trim().EndsWith(":end")){
				retval = SDTField(full_line, token);
			}

		}
		return retval;
	}
	public static string SDTField(Stream stream, string token, bool origin=true)
	{
		if(origin)
			stream.Seek(0, SeekOrigin.Begin);
		StreamReader reader = new StreamReader(stream);
		return SDTField(reader, token);
	}
	/*
	public static string SDTField(string sdf_text, string token)
	{
		MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(sdf_text ?? ""));
		return SDTField(stream, token);
	}
	*/
	public static bool SDTFieldDefault(Stream stream, string token, bool default_value)
	{
		string value = SDTField(stream, token);
		if (value == null)
		{
			return default_value;
		}
		else
		{
			bool retval = false;
			if (!bool.TryParse(value, out retval))
			{
				Debug.Log("Error SDTFieldDefault parse " + value);
			}
			return retval;
		}
	}
	public static void PositionAfter(StreamReader reader, string tag)
	{
		//Debug.Log("PositionAfter " + tag);
		string line = "";
		while (line != tag + ":" && line != null)
		{
			line = reader.ReadLine();
			//Debug.Log("PositionAfter got " + line);
		}
	}
	public static int SubstringCount(string source, string substring)
	{
		int count = 0, n = 0;

		if (substring != "")
		{
			while ((n = source.IndexOf(substring, n, StringComparison.InvariantCulture)) != -1)
			{
				n += substring.Length;
				++count;
			}
		}
		return count;
	}
	static string ReaderCutComment(StreamReader reader)
	{
		string line = "";
		do
		{
			line = reader.ReadLine();
			if (line == null)
				continue;
			line = line.Trim();
			//Debug.Log("line in cutComment <" + line + ">");
			if (line.Length > 0)
			{
				int index = line.IndexOf("//");
				if (index >= 0)
				{
					line = line.Substring(0, index).Trim();
				}
			}
		} while (line != null && line.Length == 0);
		return line;
	}
	public static string SDTNext(StreamReader reader, out string tag)
	{
		/* read a complete block from the reader.  the block may contan many subblocks */
		string line = null;
		string retval = null;
		tag = null;
		//Debug.Log("SDTNext");
		do
		{
			line = ReaderCutComment(reader);
			if (line == null)
			{
				//Debug.Log("line is null");
				return null;
			}
			else if (retval == null && line == ":end")
			{
				return "end";
			}
			//Debug.Log("SDTNext first line is <" + line + ">");

			int coffset = line.IndexOf(':');
			retval = line.Substring(coffset + 1).Trim('\n','\r',' ');
			//Debug.Log("retval is <" + retval + ">");
			if (retval == ":end")
			{
				return "";
			}
			tag = line.Substring(0, coffset).Trim();
			//Debug.Log("SDTNext retval <" + retval + "> tag " + tag);
			if (retval.EndsWith(":end"))
			{
				if (retval.Length > 0)
				{
					//Debug.Log("wtf");
					int len = retval.Length - 4;
					retval = retval.Substring(0, len);
					//Debug.Log("SDTNext retval " + retval);
				}
			}
			else if (tag == "DACGroups")
			{
				/* special case for broken SDF syntax */
				while (line != ":end")
				{
					line = ReaderCutComment(reader);
					if (line == null)
					{
						Debug.Log("ERROR: unexpected end of stream in STDNext");
						return retval;
					}
					int len = line.Length - 4;
					retval += line.Substring(0, len) + "\n";
				}
			}
			else
			{
				int colon_count = 99;
				//Debug.Log("this <" + retval + "> does not end with end:");
				int level = 0;
				//while ((level != 0 || !(colon_count == 0 && line.EndsWith(":end"))) && line != null)
				while (line != null && (level > 0 || !(colon_count == 0 && line.EndsWith(":end"))))
				{
					line = ReaderCutComment(reader);
					if (line == null)
					{
						continue;
					}
					if (line.EndsWith(":"))
					{
						/* assume new subblock */
						level++;
						//Debug.Log("New level now " + level + " for " + line);
						retval = retval + "\t" + line + "\n";
					}
					else
					{
						colon_count = SubstringCount(line, ": ");
						//Debug.Log("inner colon_count is " + colon_count + " cutline was <" + line + ">");
						if (level == 0 && colon_count == 0 && line.EndsWith(":end"))
						{
							retval = retval + "\n" + line.Substring(0, line.Length - 4);
						}
						else
						{
							if (line.StartsWith(":end") && level > 0)
							{
								level--;
								//Debug.Log("dec level to " + level + " for line " + line);
								/* eat the end */
								line = "";
							}else if(colon_count == 0)
                            {
								retval = retval + " " + line;
                            }
                            else 
                            {
								if (!line.Trim().EndsWith(":end"))
                                {
									level++;

								}
								retval = retval + "\n" + line;
							}
						}
					}
					//Debug.Log("end loop level is " + level + " line " + line);
				}


			}



		} while (retval == null && line != null && line != ":end");
		return retval.Trim();
	}
	public static void GridTo3dPos(int xcoord, int ycoord, out float xout, out float yout)
	{
		//	*xout = (0.5f+ (float)xcoord) * GRID_SIZE; 
		//	*yout = (0.5f+ (float)ycoord) * GRID_SIZE;
		xout = (0.48f + (float)xcoord) * GRID_SIZE;
		yout = (0.48f + (float)ycoord) * GRID_SIZE;

	}
	public static void PosToGrid(out int xcoord, out int ycoord, float xin, float yin)
	{
		xcoord = (int)(xin / GRID_SIZE + 0.5);
		ycoord = (int)(yin / GRID_SIZE + 0.5);

	}
	public static Vector2 GetMouseGrid()
	{
		//Debug.Log("mouse down on floor");
		Plane plane = new Plane(Vector3.up, Vector3.zero);
		Vector2 retval = new Vector2(0.0f, 0.0f) ;
		Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
		float distance;
		if (plane.Raycast(ray, out distance))
		{
			Vector3 point = ray.GetPoint(distance);
			//Debug.Log("grid: x " + point.x + " y " + point.y + " z " + point.z);
			retval.x = point.x;
			retval.y = point.z;
		}
		return retval;
	}
	public static string GetCommand(string s, out string command)
	{
		int first_colon = s.IndexOf(':');
		command = s.Substring(0, first_colon);
		string retval = s.Substring(first_colon + 1);
		return retval;
	}

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
