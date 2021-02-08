using System;
using System.Collections.Generic;

namespace Code.World_Objects.User {
  [Serializable]
  //Data related to a single User instance
  public class UserDataObject {
    public string user_name = "";
    public string gender = "";
    public int position = -1;
    public string department = "";
    public string current_thought = "";
    public int training;
    public int happiness;
    public int productivity;
    public HashSet<string> failed_goals = new HashSet<string>();
    public string description;
    public string secrecyClearance;
    public string integrityClearance;
    public HashSet<string> groups = new HashSet<string>();
    public HashSet<string> assetGoals = new HashSet<string>();
    public BackgroundCheck.Level highestBackgroundCheck;
  }
}