using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
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
    [Tooltip("A local account was added")]
    public StringGameEvent localAccountAdded;
    [Tooltip("A local account was removed")]
    public StringGameEvent localAccountRemoved;
    [Tooltip("An authentication server was added")]
    public StringGameEvent authenticationServerAdded;
    [Tooltip("A authentication server was removed")]
    public StringGameEvent authenticationServerRemoved;
    [Tooltip("A profile was added")]
    public StringGameEvent profileAdded;
    [Tooltip("A profile was removed")]
    public StringGameEvent profileRemoved;

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

    //----------------------------------------------------------------------------
    [SerializeField] private ComputerDataObject _data;

    //----------------------------------------------------------------------------
    public bool IsServer() {
      return _data.isServer;
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
    public bool IsValidLocalAccount(string accountName) {
      return _data.IsValidLocalAccount(accountName);
    }

    // ------------------------------------------------------------------------
    public void AddLocalAccount(string accountName) {
      _data.AddLocalAccount(accountName);
      localAccountAdded?.Raise(accountName);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void RemoveLocalAccount(string accountName) {
      _data.RemoveLocalAccount(accountName);
      localAccountRemoved?.Raise(accountName);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void ToggleLocalAccount(string accountName) {
      if (IsValidLocalAccount(accountName)) {
        RemoveLocalAccount(accountName);
      }
      else {
        AddLocalAccount(accountName);
      }
    }

    // ------------------------------------------------------------------------
    public string GetAuthenticatingServer() {
      return _data.authenticatingServer;
    }

    // ------------------------------------------------------------------------
    public void SetAuthenticatedServer(string serverName) {
      // If there was an authenticated server before, then send notification that it was removed
      if (!string.IsNullOrEmpty(GetAuthenticatingServer())) {
        authenticationServerRemoved?.Raise(GetAuthenticatingServer());
      }

      _data.SetAuthenticatedServer(serverName);

      // Clear out local accounts if this computer has an authenticated server
      if (!string.IsNullOrEmpty(serverName)) {
        foreach (var account in _data.localAccounts) {
          localAccountRemoved?.Raise(account);
        }
        _data.ClearLocalAccounts();
        authenticationServerAdded?.Raise(serverName);
      }

      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void ToggleAuthenticatingServer(string serverName) {
      // If this was already the authenticating server, then clear it out
      if (GetAuthenticatingServer() == serverName) {
        SetAuthenticatedServer(null);
      }
      // Otherwise, set this as the authenticating server
      else {
        SetAuthenticatedServer(serverName);
      }
    }

    // ------------------------------------------------------------------------
    public bool IsValidProfile(string profile) {
      return _data.IsValidProfile(profile);
    }

    // ------------------------------------------------------------------------
    public void AddProfile(string profile) {
      _data.AddProfile(profile);
      profileAdded?.Raise(profile);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void RemoveProfile(string profile) {
      _data.RemoveProfile(profile);
      profileRemoved?.Raise(profile);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void ToggleProfile(string profile) {
      if (IsValidProfile(profile)) {
        RemoveProfile(profile);
      }
      else {
        AddProfile(profile);
      }
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