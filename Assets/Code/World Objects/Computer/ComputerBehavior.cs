using System.Collections.Generic;
using UnityEngine;
using Code.AccessControlGroup;
using Code.Game_Events;
using Code.Policies;
using Code.Scriptable_Variables;
using Code.Software;
using Code.World_Objects.Asset;

/*
 * Represents computer attributes, inheriting from ComponentBehavior.
 */
namespace Code.World_Objects.Computer {
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
      ValueChanged();
    }

    //----------------------------------------------------------------------------
    private void DisablePolicy(Policy policy) {
      _data.enabledPolicies.Remove(policy.GetName());
      policyDisabled?.Raise(policy);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void AddAsset(AssetBehavior asset) {
      _data.AddAsset(asset.Data.AssetName);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void RemoveAsset(AssetBehavior asset) {
      _data.RemoveAsset(asset.Data.AssetName);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void AddUser(string user) {
      _data.AddUser(user);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void RemoveUser(string user) {
      _data.RemoveUser(user);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void AddSoftware(SoftwareBehavior software) {
      _data.AddSoftware(software.Data.name);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(SoftwareBehavior software) {
      _data.RemoveSoftware(software.Data.name);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void ClearAccess(string network, string accessor) {
      if (_data.networkDACAccessors.ContainsKey(network)) {
        _data.networkDACAccessors[network].RemoveAll(access => access.accessor == accessor);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleReadAccess(string network, string accessor) {
      ToggleAccess(network, accessor, DACAccess.PermissionType.Read);
    }

    // ------------------------------------------------------------------------
    public void ToggleWriteAccess(string network, string accessor) {
      ToggleAccess(network, accessor, DACAccess.PermissionType.Write);
    }

    // ------------------------------------------------------------------------
    public void ToggleControlAccess(string network, string accessor) {
      ToggleAccess(network, accessor, DACAccess.PermissionType.Control);
    }

    // ------------------------------------------------------------------------
    public void ToggleExecuteAccess(string network, string accessor) {
      ToggleAccess(network, accessor, DACAccess.PermissionType.Execute);
    }

    // ------------------------------------------------------------------------
    private void ToggleAccess(string network, string accessor, DACAccess.PermissionType permissionType) {
      if (_data.networkDACAccessors.ContainsKey(network)) {
        var existingAccess = _data.networkDACAccessors[network].Find(access => access.accessor == accessor);
        // If this accessor already has permissions, then just toggle the read state
        if (existingAccess != null) {
          existingAccess.permissions[permissionType] = !existingAccess.permissions[permissionType];
        }
        // Otherwise, add this user with default permissions + read access
        else {
          _data.networkDACAccessors[network].Add(new DACAccess(accessor, permissionType));
        }
      }
    }
  }
}