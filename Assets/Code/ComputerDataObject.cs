using System;
using System.Collections.Generic;

namespace Code {
  //Data related to a single instance of a Computer
  [Serializable]
  public class ComputerDataObject : ComponentDataObject {
    public ConfigurationSettings config_settings;
    public readonly List<string> asset_list = new List<string>();
    public readonly List<string> user_list = new List<string>(); // currently users & groups, TBD separate
    public string hw_name;
  }
}