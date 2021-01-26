using System;
using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.World_Objects.Staff;

namespace Code.Test {
  public class TestStaffUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    [Header("Factories")]
    [Tooltip("The factory to use for creating Organizations")]
    [SerializeField] private OrganizationFactory _organizationFactory;
    [Tooltip("The factory to use for creating Staff")]
    [SerializeField] private StaffFactory _staffFactory;
    [Tooltip("The factory to use for creating Workspaces")]
    [SerializeField] private WorkspaceFactory _workspaceFactory;

    // ------------------------------------------------------------------------
    void Start() {
      var user_app_path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CyberCIEGE");

      _organizationFactory.CreateAll(user_app_path);
      _workspaceFactory.CreateAll(user_app_path);
      _staffFactory.CreateAll(user_app_path);
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }

    // ------------------------------------------------------------------------
    public void ToggleStaffHired() {
      if (selectedObject.Value != null) {
        var staff = selectedObject.Value.GetComponent<StaffBehavior>();
        if (staff != null) {
          staff.SetHired(!staff.Data.IsCurrentlyHired());
        }
      }
    }
  }
}
