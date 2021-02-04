using System;
using System.Collections.Generic;
using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.World_Objects.User {
  public class UserBehavior : BaseWorldObject {
    public delegate void ValueChangeHandler();
    public event ValueChangeHandler OnValueChanged;

    [Tooltip("The list of all the currently loaded access control groups")]
    [SerializeField] private AccessControlGroupListVariable _accessControlGroups;
    [Tooltip("The list of all the currently loaded clearances")]
    [SerializeField] private ClearanceListVariable _clearances;

    [SerializeField] private GameObject _maleChildGameObject;
    [SerializeField] private GameObject _femaleChildGameObject;
    [SerializeField] private GameObject _techChildGameObject;

    private static UserBehavior current_user;
    
    [SerializeField] private UserDataObject _data;

    //---------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.User;
    }
    //---------------------------------------------------------------------------
    public UserDataObject Data {
      get => _data;
      set {
        _data = value;
        if (_data.department == "Tech")
          _techChildGameObject.SetActive(true);
        else if (_data.gender == "female")
          _femaleChildGameObject.SetActive(true);
        else
          _maleChildGameObject.SetActive(true);
      }
    }
    
    //---------------------------------------------------------------------------
    private void Awake() {
      if (_maleChildGameObject) {_maleChildGameObject.SetActive(false);} 
      if (_femaleChildGameObject) {_femaleChildGameObject.SetActive(false);} 
      if (_techChildGameObject) {_techChildGameObject.SetActive(false);} 
    }

    //---------------------------------------------------------------------------
    public bool IsActiveUser() {
      if (Data.department != "Security" && Data.department != "Tech")
        return true;
      return false;
    }
    
    //---------------------------------------------------------------------------
    // Returns true if the training value actually changed
    public bool AddTraining(int add_amount) {
      // adjust training based on given amount, using old game engine algorithm
      // and advise engine of new training value.
      if (Data.training <= 95) {
        Data.training = Math.Max(add_amount * 4, 5) + Data.training;
        if (Data.training > 95) {
          Data.training = 95;
          ValueChanged();
        }
        return true;
      }
      return false;
    }

    //---------------------------------------------------------------------------
    public void UpdateFailedGoals(HashSet<string> failedGoals) {
      Data.failed_goals = failedGoals;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateCurrentThought(string thought) {
      Data.current_thought = thought;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateTraining(int training) {
      Data.training = training;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateHighestBackgroundCheck() {
      // Default to the lowest level background check
      Data.highestBackgroundCheck = BackgroundCheck.Level.None;

      // See what background check our clearances warrant
      foreach (var clearance in _clearances.Value) {
        if (Data.secrecyClearance == clearance.Data.name ||
            Data.integrityClearance == clearance.Data.name) {
          Data.highestBackgroundCheck = BackgroundCheck.GetHighestLevel(Data.highestBackgroundCheck, clearance.Data.backgroundCheckLevel);
        }
      }

      // See what background check our access control groups warrant
      foreach (var accessControlGroup in _accessControlGroups.Value) {
        if (Data.groups.Contains(accessControlGroup.Data.name)) {
          Data.highestBackgroundCheck = BackgroundCheck.GetHighestLevel(Data.highestBackgroundCheck, accessControlGroup.Data.backgroundCheckLevel);
        }
      }

      ValueChanged();
    }

    // ------------------------------------------------------------------------
    protected void ValueChanged() {
      OnValueChanged?.Invoke();
    }
  }
}
