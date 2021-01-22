using System;
using System.Collections.Generic;

namespace Code {
  //Data related to a single Component instance
  [Serializable]
  public class ComponentDataObject {
    public string component_name;
    public string description;
    public string hw;
    public int cost;
    public int position = -1;
    public List<string> network_list = new List<string>();
  }
}