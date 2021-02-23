using System.Collections.Generic;
using UnityEngine;
using Code.Game_Events;
using Code.AccessControlGroup;
using Code.Clearance;
using Code.Policies;
using Code.Scriptable_Variables;
using Code.World_Objects.User;

namespace Code.World_Objects.Zone {
  public class ZoneBehavior : BaseWorldObject {
    [Tooltip("List of policy groups for organizing mutually exclusive policies")]
    public PolicyGroupListVariable mutuallyExclusivePolicyGroups;
    [Header("Output Events")]
    [Tooltip("A user was added to the access list")]
    public ZoneAccessChangeGameEvent accessAddedUser;
    [Tooltip("A user was removed from the access list")]
    public ZoneAccessChangeGameEvent accessRemovedUser;
    [Tooltip("A group was added to the access list")]
    public ZoneAccessChangeGameEvent accessAddedGroup;
    [Tooltip("A group was removed from the access list")]
    public ZoneAccessChangeGameEvent accessRemovedGroup;
    [Tooltip("A clearance was added to the access list")]
    public ZoneAccessChangeGameEvent accessAddedClearance;
    [Tooltip("A clearance was removed from the access list")]
    public ZoneAccessChangeGameEvent accessRemovedClearance;
    [Tooltip("A policy was toggled on")]
    public PolicyGameEvent policyEnabled;
    [Tooltip("A policy was toggled off")]
    public PolicyGameEvent policyDisabled;

    [Tooltip("The data related to this Zone.")]
    [SerializeField] private ZoneDataObject _data;

    //----------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Zone;
    }
    
    //----------------------------------------------------------------------------
    public ZoneDataObject Data {
      get => _data;
      set => _data = value;
    }
    
    //----------------------------------------------------------------------------
    public HashSet<string> GetEnabledPolicies() {
      return _data.enabledPolicies;
    }

    //----------------------------------------------------------------------------
    public bool IsPolicyEnabled(Policy policy) {
      return _data.enabledPolicies.Contains(policy.GetName());
    }

    //----------------------------------------------------------------------------
    public void TogglePolicy(Policy policy) {
      // If this policy wasn't enabled before, then enable it now
      if (!IsPolicyEnabled(policy)) {
        // If this policy is part of a group, disable all the group policies
        var policyGroup = mutuallyExclusivePolicyGroups.GetContainingPolicyGroup(policy);
        if (policyGroup != null) {
          foreach (var groupPolicy in policyGroup.policies) {
            DisablePolicy(groupPolicy);
          }
        }
        EnablePolicy(policy);
      }
      // Otherwise, disable it if we're allowed to
      else if (policy.canToggleOff) {
        DisablePolicy(policy);
      }
    }

    //----------------------------------------------------------------------------
    public void ToggleUserAccess(UserBehavior user) {
      if (!Data.permittedUsers.Contains(user.Data.user_name)) {
        Data.permittedUsers.Add(user.Data.user_name);
        accessAddedUser?.Raise(new ZoneAccessChange(this, user.Data.user_name));
      }
      else {
        Data.permittedUsers.Remove(user.Data.user_name);
        accessRemovedUser?.Raise(new ZoneAccessChange(this, user.Data.user_name));
      }
      ValueChanged();
    }

    //----------------------------------------------------------------------------
    public void ToggleGroupAccess(AccessControlGroupBehavior group) {
      var groupName = $"*.{group.Data.name}";
      if (!Data.permittedUsers.Contains(groupName)) {
        Data.permittedUsers.Add(groupName);
        accessAddedGroup?.Raise(new ZoneAccessChange(this, group.Data.name));
      }
      else {
        Data.permittedUsers.Remove(groupName);
        accessRemovedGroup?.Raise(new ZoneAccessChange(this, group.Data.name));
      }
      ValueChanged();
    }

    //----------------------------------------------------------------------------
    public void SetMinimumClearance(ClearanceBehavior clearance) {
      switch (clearance.Data.type) {
        case ClearanceDataObject.ClearanceType.Secrecy:
          // Make sure we tell the server to remove the previous minimum secrecy if we had one
          if (!string.IsNullOrEmpty(Data.secrecy)) {
            accessRemovedClearance?.Raise(new ZoneAccessChange(this, Data.secrecy));
          }
          Data.secrecy = clearance.Data.name;
          break;
        case ClearanceDataObject.ClearanceType.Integrity:
          // Make sure we tell the server to remove the previous minimum integrity if we had one
          if (!string.IsNullOrEmpty(Data.integrity)) {
            accessRemovedClearance?.Raise(new ZoneAccessChange(this, Data.integrity));
          }
          Data.integrity = clearance.Data.name;
          break;
      }
      accessAddedClearance?.Raise(new ZoneAccessChange(this, clearance.Data.name));
      ValueChanged();
    }

    //----------------------------------------------------------------------------
    public void SetSecurity(int security) {
      Data.security = security;
      ValueChanged();
    }

    //----------------------------------------------------------------------------
    private void EnablePolicy(Policy policy) {
      _data.enabledPolicies.Add(policy.GetName());
      policyEnabled?.Raise(policy);
      ValueChanged();
    }

    //----------------------------------------------------------------------------
    private void DisablePolicy(Policy policy) {
      _data.enabledPolicies.Remove(policy.GetName());
      policyDisabled?.Raise(policy);
      ValueChanged();
    }
  }
}