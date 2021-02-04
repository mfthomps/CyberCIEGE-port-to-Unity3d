using System.Collections.Generic;
using UnityEngine;
using Code.Game_Events;
using Code.Policies;
using Code.Scriptable_Variables;
using Code.World_Objects;

/*
 * Represents computer attributes, inheriting from ComponentBehavior.
 */
namespace Code {
  public class ComputerBehavior : ComponentBehavior {
    [Tooltip("The variable containing the list of all the Computers currently in the scenario.")]
    [SerializeField] private ComputerListVariable computerListVariable;
    [Tooltip("List of policy groups for organizing mutually exclusive policies")]
    public PolicyGroupListVariable mutuallyExclusivePolicyGroups;
    [Header("Output Events")]
    [Tooltip("A policy was toggled on")]
    public PolicyGameEvent policyEnabled;
    [Tooltip("A policy was toggled off")]
    public PolicyGameEvent policyDisabled;

    //----------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Computer;
    }
    
    //----------------------------------------------------------------------------
    public override ComponentDataObject Data {
      get { return _data; }
      set {
        //TODO I'm not excited about overriding this and casting to our derived type
        base.Data = value;
        _data = value as ComputerDataObject;
      }
    }

    [SerializeField] private ComputerDataObject _data;

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
    private void EnablePolicy(Policy policy) {
      _data.enabledPolicies.Add(policy.GetName());
      policyEnabled?.Raise(policy);
    }

    //----------------------------------------------------------------------------
    private void DisablePolicy(Policy policy) {
      _data.enabledPolicies.Remove(policy.GetName());
      policyDisabled?.Raise(policy);
    }

    
  }
}