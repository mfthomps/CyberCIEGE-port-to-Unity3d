using System;

namespace Code.AccessControlGroup {
  //Data relating to one AccessControlGroupBehavior instance
  [Serializable]
  public class AccessControlGroupDataObject {
    public string name;
    public string domain;
    public BackgroundCheck.Level backgroundCheckLevel;
  }
}
