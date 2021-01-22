using System;
using UnityEngine;

namespace Code {
  //Data relating to one StaffBehavior instance
  [Serializable]
  public class StaffDataObject {
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
    
    [Tooltip("The number of days until this staff is available to hire." +
             "-1 = already hired, 0 = available now, 2 = wait for two days.")]
    public int daysTillAvailable = -1;

    //--------------------------------------------------------------------------
    public bool IsCurrentlyHired() {
      return daysTillAvailable < 0;
    }

    //--------------------------------------------------------------------------
    public bool CanBeHiredNow() {
      return daysTillAvailable == 0;
    }
  }
}