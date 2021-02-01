using System;
using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.Policies;
using Code.World_Objects.Zone;

namespace Code.Test {
  public class TestZoneUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    [Header("Factories")]
    [Tooltip("The factory to use for creating AccessControlGroups")]
    [SerializeField] private AccessControlGroupFactory _accessControlGroupFactory;
    [Tooltip("The factory to use for creating Zones")]
    [SerializeField] private ZoneFactory _zoneFactory;

    // ------------------------------------------------------------------------
    void Start() {
      var user_app_path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

      _accessControlGroupFactory.CreateAll(user_app_path);
      _zoneFactory.CreateAll(user_app_path);
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
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
