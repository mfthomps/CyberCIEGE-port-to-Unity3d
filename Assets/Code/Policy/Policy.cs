using System;

namespace Code.Policy {
  //Represents a describable policy that can be applied to a Computer, Zone, etc.
  [Serializable]
  public struct Policy {
    public string Name;
    public string Description;
    public PolicyType PolicyType;
  }
}