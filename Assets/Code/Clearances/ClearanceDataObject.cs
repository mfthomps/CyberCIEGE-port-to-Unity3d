using System;

namespace Code.Clearance {
  //Data relating to one ClearanceBehavior instance
  [Serializable]
  public class ClearanceDataObject {
    public enum ClearanceType {
      Invalid = -1,

      Secrecy = 0,
      Integrity
    }

    public string name;
    public ClearanceType type;
  }
}
