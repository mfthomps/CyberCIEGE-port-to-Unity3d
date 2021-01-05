using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

public class ProceduralScript {
  public Dictionary<string, string> proc_dict = new Dictionary<string, string>();

  // Use this for initialization
  public ProceduralScript(string fname) {
    string path = Path.Combine(GameLoadBehavior.user_app_path, "ConfigMaps");
    path = Path.Combine(path, fname);
    //Debug.Log("ProceduralScript, start, path is " + path);
    try {
      StreamReader reader = new StreamReader(path, Encoding.Default);
      string in_line = null;
      using (reader) {
        do {
          in_line = reader.ReadLine();
          if (in_line == null)
            continue;
          //Debug.Log("ProceduralScript read " + in_line);
          string[] parts = in_line.Split(':');
          proc_dict[parts[0]] = parts[1].Trim();
        } while (in_line != null);
      }
    }
    catch (Exception e) {
      Console.WriteLine(e.Message + "\n");
    }
  }
}