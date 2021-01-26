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

    // ------------------------------------------------------------------------
    public bool IsConnectedToNetwork(string network) {
      return network_list.Contains(network);
    }

    // ------------------------------------------------------------------------
    public void ConnectToNetwork(string network) {
      network_list.Add(network);
    }

    // ------------------------------------------------------------------------
    public void DisconnectFromNetwork(string network) {
      network_list.Remove(network);
    }
  }
}