using System;
using System.Collections.Generic;
using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.World_Objects.User {
  public class UserBehavior : Navigator {
    [Header("Input Variables")]
    [Tooltip("The list of all the currently loaded access control groups")]
    [SerializeField] private AccessControlGroupListVariable _accessControlGroups;
    [Tooltip("The list of all the currently loaded clearances")]
    [SerializeField] private ClearanceListVariable _clearances;
    
    [Header("UI Elements")]
    [SerializeField] private SpeechBubble _speechBubble;

    [Header("Data")]
    [SerializeField] private UserDataObject _data;

    //---------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.User;
    }
    //---------------------------------------------------------------------------
    public UserDataObject Data {
      get => _data;
      set => _data = value;
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
    public void UpdateSpeechText(string speechText) {
      _speechBubble.SetSpeechText(speechText);
    }

    //---------------------------------------------------------------------------
    public void UpdateTraining(int training) {
      Data.training = training;
      ValueChanged();
    }
    
    //---------------------------------------------------------------------------
    public void UpdateHappiness(int value) {
      Data.happiness = value;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateProductivity(int value) {
      Data.productivity = value;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateAssetUsage(int value) {
      Data.assetUsage = value;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateAssignedZone(string zone) {
      Data.assignedZone = zone;
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
  }
}
