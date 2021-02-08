using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Code.Scriptable_Variables;
using Code.Clearance;
using Code.World_Objects.Staff;
using Code.World_Objects.User;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Main {
  public class ZoneObjectPropertyPanel : GenericObjectPropertyPanel<ZoneBehavior> {
    [Header("Input Variables")]
    [Tooltip("List of clearances in scenario")]
    public ClearanceListVariable clearances;
    [Tooltip("List of computers in scenario")]
    public ComputerListVariable computers;
    [Tooltip("List of staff in scenario")]
    public StaffListVariable staff;
    [Tooltip("List of users in scenario")]
    public UserListVariable users;
    [Tooltip("List of zones in scenario")]
    public ZoneListVariable zones;
    [Header("UI Elements")]
    [Tooltip("Label for selected zone's name")]
    public TMP_Text nameLabel;
    [Tooltip("Label for selected zone's security rating")]
    public TMP_Text secruityRatingLabel;
    [Tooltip("Label for selected zone's domain")]
    public TMP_Text domainLabel;
    [Tooltip("Label for selected zone's description")]
    public TMP_Text descriptionLabel;
    [Tooltip("List for selected zone's computers in zone")]
    public StringList computersInZoneList;
    [Tooltip("List for selected zone's assets in zone")]
    public StringList assetsInZoneList;
    [Tooltip("List for selected zone's users allowed in zone")]
    public StringList usersAllowedInZoneList;

    private ZoneBehavior _displayedUser;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(ZoneBehavior component) {
      if (_displayedUser != null) {
        _displayedUser.OnValueChanged -= UpdateUI;
      }

      _displayedUser = component;
      _displayedUser.OnValueChanged += UpdateUI;
      UpdateUI();
    }

    // ------------------------------------------------------------------------
    private void UpdateUI() {
      var displayedDataObject = _displayedUser.Data;
      var computersInZone = GetComputersInZone(displayedDataObject);

      SetStringProperty(nameLabel, displayedDataObject.ZoneName);
      SetStringProperty(secruityRatingLabel, GetSecurityRating(displayedDataObject).ToString());
      SetStringProperty(domainLabel, displayedDataObject.domain);
      SetStringProperty(descriptionLabel, displayedDataObject.description, "No Description Given");
      SetStringList(computersInZoneList, GetComputerNames(computersInZone));
      SetStringList(assetsInZoneList, GetAssetsInZone(computersInZone));
      SetStringList(usersAllowedInZoneList, GetUsersAllowedInZone(displayedDataObject));
    }

    // ------------------------------------------------------------------------
    private int GetSecurityRating(ZoneDataObject data) {
      // TODO: Figure out how to calculate security (check zone.cpp line 1486 to try to understand it)
      return 0;
    }

    // ------------------------------------------------------------------------
    private HashSet<ComputerBehavior> GetComputersInZone(ZoneDataObject data) {
      var computersInZone = new HashSet<ComputerBehavior>();

      // First get all computers in the zone
      var zoneRect = data.GetRect();
      foreach (var computer in computers.Value) {
        if (zoneRect.Contains(new Vector2(computer.transform.position.x, computer.transform.position.z))) {
          computersInZone.Add(computer);
        }
      }

      // Then remove any computers that are in other zones that this zone encapsulates
      foreach (var zone in zones.Value) {
        if (zone.Data != data) {
          // See if this zone fully encapsulates the other zone
          var otherRect = zone.Data.GetRect();
          if (zoneRect.Contains(otherRect.min) && zoneRect.Contains(otherRect.max)) {
            // Check for each computer in the other zone and remove it from our list
            foreach (var computer in computers.Value) {
              if (otherRect.Contains(new Vector2(computer.transform.position.x, computer.transform.position.z))) {
                computersInZone.Remove(computer);
              }
            }
          }
        }
      }

      return computersInZone;
    }

    // ------------------------------------------------------------------------
    private HashSet<string> GetComputerNames(HashSet<ComputerBehavior> computers) {
      var computerNames = new HashSet<string>();

      foreach (var computer in computers) {
        computerNames.Add(computer.Data.component_name);
      }

      return computerNames;
    }

    // ------------------------------------------------------------------------
    private HashSet<string> GetAssetsInZone(HashSet<ComputerBehavior> computersInZone) {
      var assetsInZone = new HashSet<string>();

      foreach (var computer in computersInZone) {
        foreach (var assetName in (computer.Data as ComputerDataObject).asset_list) {
          assetsInZone.Add(assetName);
        }
      }

      return assetsInZone;
    }

    // ------------------------------------------------------------------------
    private HashSet<string> GetUsersAllowedInZone(ZoneDataObject data) {
      var usersAllowedInZone = new HashSet<string>();

      foreach (var user in users.Value) {
        if (IsAllowedInZone(user.Data, data.permittedUsers, clearances.FindByName(data.secrecy), clearances.FindByName(data.integrity))) {
          usersAllowedInZone.Add(user.Data.user_name);
        }
      }

      foreach (var staffMember in staff.Value) {
        if (IsAllowedInZone(staffMember.Data, data.permittedUsers, clearances.FindByName(data.secrecy), clearances.FindByName(data.integrity))) {
          usersAllowedInZone.Add(staffMember.Data.user_name);
        }
      }

      return usersAllowedInZone;
    }

    // ------------------------------------------------------------------------
    private bool IsAllowedInZone(UserDataObject userData, HashSet<string> permittedUsers, ClearanceBehavior zoneSecrecy, ClearanceBehavior zoneIntegrity) {
      // Check if the user is in the permitted user list
      if (permittedUsers.Contains(userData.user_name)) {
        return true;
      }

      // Check if any group the user belongs to is in the permitted user list
      foreach (var group in userData.groups) {
        if (permittedUsers.Contains($"*.{group}")) {
          return true;
        }
      }

      // If the users secrecy or integrity clearance are high enough, then they are allowed in the zone
      if (zoneSecrecy != null) {
        var userSecrecy = clearances.FindByName(userData.secrecyClearance);
        if (userSecrecy != null && userSecrecy.Data.level >= zoneSecrecy.Data.level) {
          return true;
        }
      }
      if (zoneIntegrity != null) {
        var userIntegrity = clearances.FindByName(userData.integrityClearance);
        if (userIntegrity != null && userIntegrity.Data.level >= zoneIntegrity.Data.level) {
          return true;
        }
      }

      return false;
    }

    // ------------------------------------------------------------------------
    private bool IsAllowedInZone(StaffDataObject staffData, HashSet<string> permittedUsers, ClearanceBehavior zoneSecrecy, ClearanceBehavior zoneIntegrity) {
      if (staffData.IsCurrentlyHired()) {
        // Check if the staff is in the permitted user list
        if (permittedUsers.Contains(staffData.user_name)) {
          return true;
        }

        // Check if any group the staff belongs to is in the permitted user list
        foreach (var group in staffData.groups) {
          if (permittedUsers.Contains($"*.{group}")) {
            return true;
          }
        }
      }

      return false;
    }
  }
}
