﻿using System;
using System.Collections.Generic;
using Code.World_Objects.Character;
using UnityEngine;

namespace Code.World_Objects.Staff {
  //Data relating to one StaffBehavior instance
  [Serializable]
  public class StaffDataObject : CharacterDataObject {
    public delegate void ValueChangeHandler();
    public event ValueChangeHandler OnValueChanged;
    
    public int position = -1;
    public StaffType type;
    public int skill;
    public int hw_skill;
    public int hi_skill;
    public int sw_skill;
    public int cost;
    public int salary;
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