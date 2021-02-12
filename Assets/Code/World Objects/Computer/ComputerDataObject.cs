using System;
using System.Collections.Generic;

namespace Code.World_Objects.Computer {
  //Data related to a single instance of a Computer
  [Serializable]
  public class ComputerDataObject : ComponentDataObject {
    public HashSet<string> enabledPolicies = new HashSet<string>();
    public readonly HashSet<string> asset_list = new HashSet<string>();
    public readonly HashSet<string> localAccounts = new HashSet<string>(); // currently users & groups, TBD separate
    public string authenticatingServer;
    public string hw_name;
    public bool isServer;
    public string assignedUser;
    public string os;
    public int availability;
    public string domain;
    public HashSet<string> software_list = new HashSet<string>();
    public HashSet<string> profileList = new HashSet<string>();

    // ------------------------------------------------------------------------
    public void AddAsset(string asset) {
      asset_list.Add(asset);
    }

    // ------------------------------------------------------------------------
    public void RemoveAsset(string asset) {
      asset_list.Remove(asset);
    }

    // ------------------------------------------------------------------------
    public bool IsValidLocalAccount(string accountName) {
      return localAccounts.Contains(accountName);
    }

    // ------------------------------------------------------------------------
    public void AddLocalAccount(string accountName) {
      localAccounts.Add(accountName);
    }

    // ------------------------------------------------------------------------
    public void RemoveLocalAccount(string accountName) {
      localAccounts.Remove(accountName);
    }

    // ------------------------------------------------------------------------
    public void ClearLocalAccounts() {
      localAccounts.Clear();
    }

    // ------------------------------------------------------------------------
    public void SetAuthenticatedServer(string serverName) {
      authenticatingServer = serverName;
    }

    // ------------------------------------------------------------------------
    public bool IsValidProfile(string profile) {
      return profileList.Contains(profile);
    }

    // ------------------------------------------------------------------------
    public void AddProfile(string profile) {
      profileList.Add(profile);
    }

    // ------------------------------------------------------------------------
    public void RemoveProfile(string profile) {
      profileList.Remove(profile);
    }

    // ------------------------------------------------------------------------
    public void AddSoftware(string software) {
      software_list.Add(software);
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(string software) {
      software_list.Remove(software);
    }
  }
}