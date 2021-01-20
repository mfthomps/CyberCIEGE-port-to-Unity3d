using System;

namespace Code {
  //Data relating to one ITStaffBehavior instance
  [Serializable]
  public class ITStaffDataObject {
    public string user_name;
    public int position = -1;
    public string department;
    public string current_thought = "";
    public int skill;
    public int hw_skill;
    public int hi_skill;
    public int sw_skill;
    public int cost;
    public int salary;

  }
}