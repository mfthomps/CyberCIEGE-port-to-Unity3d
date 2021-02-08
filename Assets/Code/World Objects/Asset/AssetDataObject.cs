using System;
using System.Collections.Generic;

namespace Code.World_Objects.Asset {
  //The data related to one Asset instance
  [Serializable]
  public class AssetDataObject {
    public string AssetName;
    public List<DACAccess> DACAccessors = new List<DACAccess>();
    public ComputerBehavior Computer;
    public string description;
    public string secrecy;
    public string integrity;
  }
}