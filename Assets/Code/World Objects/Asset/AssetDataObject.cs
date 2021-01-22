using System;

namespace Code {
  //The data related to one Asset instance
  [Serializable]
  public class AssetDataObject {
    public string AssetName;
    public DACAccess DACAccess;
    public ComputerBehavior Computer;
  }
}