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
    public List<string> failed_goals = new List<string>();
  }
}