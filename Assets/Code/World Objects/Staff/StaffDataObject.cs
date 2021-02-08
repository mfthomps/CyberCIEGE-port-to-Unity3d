using System;
using System.Collections.Generic;
using UnityEngine;

namespace Code.World_Objects.Staff {
  //Data relating to one StaffBehavior instance
  [Serializable]
  public class StaffDataObject {
    public delegate void ValueChangeHandler();
    public event ValueChangeHandler OnValueChanged;

    public string user_name;
    public int position = -1;
    public StaffType type;
    public string current_thought = "";
    public int skill;
    public int hw_skill;
    public int hi_skill;
    public int sw_skill;
    public int cost;
    public int salary;
    public int productivity;
    public string description;
    public HashSet<string> groups = new HashSet<string>();
    
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

    //--------------------------------------------------------------------------
    public void SetHired(bool hired) {
      daysTillAvailable = hired ? -1 : 0;
      OnValueChanged?.Invoke();
    }
  }
}