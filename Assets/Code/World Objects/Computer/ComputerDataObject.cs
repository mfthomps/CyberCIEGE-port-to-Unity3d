using System;
using System.Collections.Generic;

namespace Code {
  //Data related to a single instance of a Computer
  [Serializable]
  public class ComputerDataObject : ComponentDataObject {
    public HashSet<string> enabledPolicies = new HashSet<string>();
    public readonly HashSet<string> asset_list = new HashSet<string>();
    public readonly HashSet<string> user_list = new HashSet<string>(); // currently users & groups, TBD separate
    public string hw_name;
    public bool isServer;
    public string assignedUser;
    public string os;
    public int availability;
    public string domain;
    public HashSet<string> software = new HashSet<string>();

    // ------------------------------------------------------------------------
    public void AddAsset(string asset) {
      asset_list.Add(asset);
    }

    // ------------------------------------------------------------------------
    public void RemoveAsset(string asset) {
      asset_list.Remove(asset);
    }

    // ------------------------------------------------------------------------
    public void AddUser(string user) {
      user_list.Add(user);
    }

    // ------------------------------------------------------------------------
    public void RemoveUser(string user) {
      user_list.Remove(user);
    }
  }
}