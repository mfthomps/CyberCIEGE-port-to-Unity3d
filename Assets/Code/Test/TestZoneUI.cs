﻿using System;
using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.Policies;
using Code.Scriptable_Variables;
using Code.World_Objects.Zone;

namespace Code.Test {
  public class TestZoneUI : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of access control groups")]
    public AccessControlGroupListVariable accessControlGroups;
    [Tooltip("List of clearances")]
    public ClearanceListVariable clearances;
    [Tooltip("List of users")]
    public UserListVariable users;
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    [Header("Factories")]
    [Tooltip("The factory to use for creating AccessControlGroups")]
    [SerializeField] private AccessControlGroupFactory _accessControlGroupFactory;
    [Tooltip("The factory to use for creating Clearances")]
    [SerializeField] private ClearanceFactory _clearanceFactory;
    [Tooltip("The factory to use for creating Organizations")]
    [SerializeField] private OrganizationFactory _organizationFactory;
    [Tooltip("The factory to use for creating Users")]
    [SerializeField] private UserFactory _userFactory;
    [Tooltip("The factory to use for creating Workspaces")]
    [SerializeField] private WorkspaceFactory _workspaceFactory;
    [Tooltip("The factory to use for creating Zones")]
    [SerializeField] private ZoneFactory _zoneFactory;

    // ------------------------------------------------------------------------
    void Start() {
      var user_app_path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

      _accessControlGroupFactory.CreateAll(user_app_path);
      _clearanceFactory.CreateAll(user_app_path);
      _organizationFactory.CreateAll(user_app_path);
      _workspaceFactory.CreateAll(user_app_path);
      _userFactory.CreateAll(user_app_path);
      _zoneFactory.CreateAll(user_app_path);
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }

    // ------------------------------------------------------------------------
    public void ToggleUserAccess(string userName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          var toggledUser = users.Value.Find(user => user.Data.user_name == userName);
          zoneBehavior.ToggleUserAccess(toggledUser);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleGroupAccess(string groupName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          var toggledGroup = accessControlGroups.Value.Find(group => group.Data.name == groupName);
          zoneBehavior.ToggleGroupAccess(toggledGroup);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetMinimumClearance(string clearanceName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          var toggledClearance = clearances.Value.Find(clearance => clearance.Data.name == clearanceName);
          zoneBehavior.SetMinimumClearance(toggledClearance);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnUserAccessAdded(string userName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"User {userName} added to {zoneBehavior.Data.ZoneName}'s access list");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnUserAccessRemoved(string userName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"User {userName} removed from {zoneBehavior.Data.ZoneName}'s access list");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnGroupAccessAdded(string groupName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"Group {groupName} added to {zoneBehavior.Data.ZoneName}'s access list");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnGroupAccessRemoved(string groupName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"Group {groupName} removed from {zoneBehavior.Data.ZoneName}'s access list");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnClearanceAccessAdded(string clearanceName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"Clearance {clearanceName} added to {zoneBehavior.Data.ZoneName}'s access list");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnClearanceAccessRemoved(string clearanceName) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"Clearance {clearanceName} removed from {zoneBehavior.Data.ZoneName}'s access list");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void TogglePolicy(Policy policy) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          zoneBehavior.TogglePolicy(policy);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnZonePolicyEnabled(Policy policy) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"Policy {policy.GetName()} enabled for {zoneBehavior.Data.ZoneName}");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnZonePolicyDisabled(Policy policy) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          Debug.Log($"Policy {policy.GetName()} disabled for {zoneBehavior.Data.ZoneName}");
        }
      }
    }
  }
}
