using System;
using System.Collections.Generic;
using Code.AccessControlGroup;

namespace Code {
  //Data related to a single Component instance
  [Serializable]
  public class ComponentDataObject {
    public string component_name;
    public string description;
    public string hw;
    public int cost;
    public int position = -1;
    public HashSet<string> network_list = new HashSet<string>();
    public Dictionary<string, List<DACAccess>> networkDACAccessors = new Dictionary<string, List<DACAccess>>();

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