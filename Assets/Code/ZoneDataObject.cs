using System;

namespace Code {
  
  [Serializable]
  //All the data related to a single Zone
  public class ZoneDataObject {
    
    public int lrc_x;
    public int lrc_y;
    public int ulc_x;
    public int ulc_y;
    
    public string ZoneName;
    public string RootZoneName;
    public ConfigurationSettings ConfigSettings;
    public PhysicalSettings PhysSettings;
  }
}