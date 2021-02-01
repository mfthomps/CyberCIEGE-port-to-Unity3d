using System;
using System.Collections.Generic;

namespace Code.World_Objects.Zone {  
  [Serializable]
  //All the data related to a single Zone
  public class ZoneDataObject {
    public int lrc_x;
    public int lrc_y;
    public int ulc_x;
    public int ulc_y;
    
    public string ZoneName;
    public string RootZoneName;

    public HashSet<string> enabledPolicies = new HashSet<string>();
    public HashSet<string> permittedUsers = new HashSet<string>();
    public string secrecy;
    public string integrity;
  }
}