using System;
using System.Collections.Generic;

namespace Code.Software {
  //Data relating to one SoftwareBehavior instance
  [Serializable]
  public class SoftwareDataObject {
    public string name;
    public int cost;
    public HashSet<string> validOSes = new HashSet<string>();
  }
}
