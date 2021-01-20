using System;
using System.Collections.Generic;

namespace Code {
 
  [Serializable]
  //Data related to a single User instance
  public class UserDataObject {
    public string user_name;
    public string this_user_gender;
    public string this_user_dept;
    public int position = -1;
    public string department;
    public string current_thought = "";
    public int training;
    public List<string> failed_goals = new List<string>();
  }
}