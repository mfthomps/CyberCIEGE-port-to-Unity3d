﻿using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.AccessControlGroup;
using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.Software;
using Code.User_Interface.AccessControlGroup;
using Code.User_Interface.Asset;
using Code.User_Interface.Software;
using Code.World_Objects.Asset;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Components {
  public class ComponentView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of access control groups in the given scenario")]
    public AccessControlGroupListVariable accessControlGroups;
    [Tooltip("List of assets in the given scenario")]
    public AssetListVariable assets;
    [Tooltip("List of clearances in the given scenario")]
    public ClearanceListVariable clearances;
    [Tooltip("List of computers in the given scenario")]
    public ComputerListVariable computerListVariable;
    [Tooltip("List of software in the given scenario")]
    public SoftwareListVariable softwareListVariable;
    [Tooltip("List of users in the given scenario")]
    public UserListVariable users;

    [Header("Output Events/Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;
    [Tooltip("The GameEvent to fire when a Computer should be scrapped")]
    [SerializeField] private ComputerGameEvent _scrapComputerGameEvent;
    [Tooltip("The GameEvent to fire when a Computer should be scanned")]
    [SerializeField] private ComputerGameEvent _scanComputerGameEvent;
    [Tooltip("The GameEvent to fire when a Computer should be diagnosed")]
    [SerializeField] private ComputerGameEvent _diagnoseComputerGameEvent;
    [Tooltip("The GameEvent to fire when a Computer should be reimaged")]
    [SerializeField] private ComputerGameEvent _reimageComputerGameEvent;
    [Tooltip("The GameEvent to fire when a Computer should have drive replaced")]
    [SerializeField] private ComputerGameEvent _replaceComputerDriveGameEvent;
    [Tooltip("The GameEvent to fire when an asset should be assigned to the selected computer")]
    [SerializeField] private AssetGameEvent _assignAsset;
    [Tooltip("The GameEvent to fire when an asset should be unassigned from the selected computer")]
    [SerializeField] private AssetGameEvent _unassignAsset;
    [Tooltip("The GameEvent to fire when software should be added to the selected computer")]
    [SerializeField] private SoftwareGameEvent _addSoftware;
    [Tooltip("The GameEvent to fire when software should be removed from the selected computer")]
    [SerializeField] private SoftwareGameEvent _removeSoftware;
    [Tooltip("The GameEvent to fire when a local account should be toggled for the selected computer")]
    [SerializeField] private StringGameEvent _toggleLocalAccount;
    [Tooltip("The GameEvent to fire when an authenticated server should be toggled for the selected computer")]
    [SerializeField] private StringGameEvent _toggleAuthenticatedServer;
    [Tooltip("The GameEvent to fire when a profile should be toggled for the selected computer")]
    [SerializeField] private StringGameEvent _toggleProfile;
    [Tooltip("The GameEvent to fire when a networks' access should be cleared from the selected computer")]
    [SerializeField] private ComputerNetworkAccessChangeGameEvent _accessChangeClear;
    [Tooltip("The GameEvent to fire when a networks' read access should be changed from the selected computer")]
    [SerializeField] private ComputerNetworkAccessChangeGameEvent _accessChangeRead;
    [Tooltip("The GameEvent to fire when a networks' write access should be changed from the selected computer")]
    [SerializeField] private ComputerNetworkAccessChangeGameEvent _accessChangeWrite;
    [Tooltip("The GameEvent to fire when a networks' control access should be changed from the selected computer")]
    [SerializeField] private ComputerNetworkAccessChangeGameEvent _accessChangeControl;
    [Tooltip("The GameEvent to fire when a networks' execute access should be changed from the selected computer")]
    [SerializeField] private ComputerNetworkAccessChangeGameEvent _accessChangeExecute;
    
    [Header("UI Elements")]
    [Tooltip("List of computers to display")]
    public ComputerList computerList;
    [Tooltip("List of software assigned to the selected computer")]
    public SoftwareList addedSoftwareList;
    [Tooltip("List of software not assigned to the selected computer")]
    public SoftwareList availableSoftwareList;
    [Tooltip("List of assets assigned to the selected computer")]
    public AssetList assignedAssetsList;
    [Tooltip("List of assets not assigned to the selected computer")]
    public AssetList unassignedAssetsList;
    [Tooltip("List of accounts for the selected computer")]
    public SelectableStringList accountsList;
    [Tooltip("List of authenticated servers for the selected computer")]
    public SelectableStringList authenticatedServerList;
    [Tooltip("List of authorized profiles for the selected computer")]
    public SelectableStringList authorizedProfileList;
    [Tooltip("List of networks the selected computer is connected to")]
    public SelectableStringList connectedNetworkList;
    [Tooltip("List of DACAccesses for the selected network of the selected computer")]
    public DACAccessList dacAccessList;

    private string _selectedNetwork;

    // ------------------------------------------------------------------------
    void OnEnable() {
      computerListVariable.OnValueChanged += UpdateComputerList;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateComputerList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      computerListVariable.OnValueChanged -= UpdateComputerList;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectComputer(ComputerBehavior computerBehavior) {
      selectedObject.Value = computerBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    public void ScrapSelectedComputer() {
      var computer = GetSelectedComputer();
      if (computer) {
        //Fire Event
        _scrapComputerGameEvent?.Raise(computer);
      }
    }

    // ------------------------------------------------------------------------
    public void ScanSelectedComputer() {
      var computer = GetSelectedComputer();
      if (computer != null) {
        _scanComputerGameEvent?.Raise(computer);
      }
    }

    // ------------------------------------------------------------------------
    public void DiagnoseSelectedComputer() {
      var computer = GetSelectedComputer();
      if (computer != null) {
        _diagnoseComputerGameEvent?.Raise(computer);
      }
    }

    // ------------------------------------------------------------------------
    public void ReimageSelectedComputer() {
      var computer = GetSelectedComputer();
      if (computer != null) {
        _reimageComputerGameEvent?.Raise(computer);
      }
    }

    // ------------------------------------------------------------------------
    public void ReplaceDriveSelectedComputer() {
      var computer = GetSelectedComputer();
      if (computer != null) {
        _replaceComputerDriveGameEvent?.Raise(computer);
      }
    }

    // ------------------------------------------------------------------------
    public void AssignAsset(AssetBehavior asset) {
      _assignAsset?.Raise(asset);
      UpdateAssetsSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void UnassignAsset(AssetBehavior asset) {
      _unassignAsset?.Raise(asset);
      UpdateAssetsSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void AddSoftware(SoftwareBehavior software) {
      _addSoftware?.Raise(software);
      UpdateSoftwareSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(SoftwareBehavior software) {
      _removeSoftware?.Raise(software);
      UpdateSoftwareSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void ToggleLocalAccount(string accountName) {
      _toggleLocalAccount?.Raise(accountName);
      UpdateUserSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void ToggleAuthenticatedServer(string authenticatedServer) {
      _toggleAuthenticatedServer?.Raise(authenticatedServer);
      UpdateUserSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void ToggleProfile(string profile) {
      _toggleProfile?.Raise(profile);
      UpdateUserSettings(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    public void SelectConnectedNetwork(string networkName) {
      var selectedComputer = GetSelectedComputer();

      _selectedNetwork = networkName;
      foreach (var network in selectedComputer.Data.network_list) {
        connectedNetworkList.SetSelected(network, network == _selectedNetwork);
      }

      if (selectedComputer != null && selectedComputer.Data.networkDACAccessors.ContainsKey(_selectedNetwork)) {
        var networkAccessors = selectedComputer.Data.networkDACAccessors[_selectedNetwork];
        var accessors = new List<DACAccess>();

        // Add a DACAccess for each user (filled in if we already have one for this network)
        foreach (var user in users.Value) {
          var existingAccessor = networkAccessors.Find(accessor => accessor.accessor == user.Data.user_name);
          accessors.Add(existingAccessor != null ? existingAccessor : new DACAccess(user.Data.user_name));
        }

        // Add a DACAccess for each group (filled in if we already have one for this network)
        foreach (var group in accessControlGroups.Value) {
          var existingAccessor = networkAccessors.Find(accessor => accessor.accessor == group.Data.name);
          accessors.Add(existingAccessor != null ? existingAccessor : new DACAccess(group.Data.name));
        }

        dacAccessList.SetItems(accessors);
      }
      else {
        dacAccessList.ClearItems();
      }
    }

    // ------------------------------------------------------------------------
    public void ChangeNetworkClearAccess(DACAccess access) {
      _accessChangeClear?.Raise(new ComputerNetworkAccessChange(GetSelectedComputer(), _selectedNetwork, access));
      SelectConnectedNetwork(_selectedNetwork);
    }

    // ------------------------------------------------------------------------
    public void ChangeNetworkReadAccess(DACAccess access) {
      _accessChangeRead?.Raise(new ComputerNetworkAccessChange(GetSelectedComputer(), _selectedNetwork, access));
      SelectConnectedNetwork(_selectedNetwork);
    }

    // ------------------------------------------------------------------------
    public void ChangeNetworkWriteAccess(DACAccess access) {
      _accessChangeWrite?.Raise(new ComputerNetworkAccessChange(GetSelectedComputer(), _selectedNetwork, access));
      SelectConnectedNetwork(_selectedNetwork);
    }

    // ------------------------------------------------------------------------
    public void ChangeNetworkControlAccess(DACAccess access) {
      _accessChangeControl?.Raise(new ComputerNetworkAccessChange(GetSelectedComputer(), _selectedNetwork, access));
      SelectConnectedNetwork(_selectedNetwork);
    }

    // ------------------------------------------------------------------------
    public void ChangeNetworkExecuteAccess(DACAccess access) {
      _accessChangeExecute?.Raise(new ComputerNetworkAccessChange(GetSelectedComputer(), _selectedNetwork, access));
      SelectConnectedNetwork(_selectedNetwork);
    }

    // ------------------------------------------------------------------------
    private void UpdateComputerList() {
      computerList.SetItems(computerListVariable.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var computer in computerListVariable.Value) {
        if (computer != null) {
          computerList.SetSelected(computer, computer.gameObject == selectedObject.Value);
        }
      }

      DisplayComputerInformation(GetSelectedComputer());
    }

    // ------------------------------------------------------------------------
    private void DisplayComputerInformation(ComputerBehavior computer) {
      UpdateSoftwareSettings(computer);
      UpdateAssetsSettings(computer);
      UpdateUserSettings(computer);

      if (computer != null) {
        connectedNetworkList.SetItems(new List<string>(computer.Data.network_list));
      }
      else {
        connectedNetworkList.ClearItems();
      }
      dacAccessList.ClearItems();
    }

    // ------------------------------------------------------------------------
    private void UpdateSoftwareSettings(ComputerBehavior computer) {
      if (computer != null) {
        var computerDataObject = computer.Data as ComputerDataObject;
        var assignedSoftware = new List<SoftwareBehavior>();
        var unassignedSoftware = new List<SoftwareBehavior>();
        foreach (var software in softwareListVariable.Value) {
          if (software.Data.validOSes.Contains(computerDataObject.os)) {
            if (computerDataObject.software_list.Contains(software.Data.name)) {
              assignedSoftware.Add(software);
            }
            else {
              unassignedSoftware.Add(software);
            }
          }
        }
        addedSoftwareList.SetItems(assignedSoftware);
        availableSoftwareList.SetItems(unassignedSoftware);
      }
      else {
        addedSoftwareList.ClearItems();
        availableSoftwareList.ClearItems();
      }
    }

    // ------------------------------------------------------------------------
    private void UpdateAssetsSettings(ComputerBehavior computer) {
      if (computer != null) {
        var computerDataObject = computer.Data as ComputerDataObject;
        var assignedAssets = new List<AssetBehavior>();
        var unassignedAssets = new List<AssetBehavior>();
        foreach (var asset in assets.Value) {
          if (computerDataObject.asset_list.Contains(asset.Data.AssetName)) {
            assignedAssets.Add(asset);
          }
          else {
            unassignedAssets.Add(asset);
          }
        }
        assignedAssetsList.SetItems(assignedAssets);
        unassignedAssetsList.SetItems(unassignedAssets);
      }
      else {
        assignedAssetsList.ClearItems();
        unassignedAssetsList.ClearItems();
      }
    }

    // ------------------------------------------------------------------------
    private void UpdateUserSettings(ComputerBehavior selectedComputer) {
      accountsList.ClearItems();
      authenticatedServerList.ClearItems();
      authorizedProfileList.ClearItems();

      if (selectedComputer != null) {
        // Add users to account lists
        foreach (var user in users.Value) {
          var userName = user.Data.user_name;
          accountsList.AddItem(userName);
          accountsList.SetSelected(userName, selectedComputer.IsValidLocalAccount(userName));
        }
        // Add groups to account and authorized profile lists
        foreach (var group in accessControlGroups.Value) {
          var groupName = group.Data.name;
          accountsList.AddItem(groupName);
          accountsList.SetSelected(groupName, selectedComputer.IsValidLocalAccount(groupName));
          authorizedProfileList.AddItem(groupName);
          authorizedProfileList.SetSelected(groupName, selectedComputer.IsValidProfile(groupName));
        }
        // Add clearances to authorized profile lists
        foreach (var clearance in clearances.Value) {
          var clearanceName = clearance.Data.name;
          authorizedProfileList.AddItem(clearanceName);
          authorizedProfileList.SetSelected(clearanceName, selectedComputer.IsValidProfile(clearanceName));
        }

        // Setup the authenticated server list, selecting the current authenticated server (if there is one)
        foreach (var computer in computerListVariable.Value) {
          if (computer.IsServer()) {
            var computerName = computer.Data.component_name;
            authenticatedServerList.AddItem(computerName);
            authenticatedServerList.SetSelected(computerName, selectedComputer.GetAuthenticatingServer() == computerName);
          }
        }
      }

      // Clients can only see the accounts list if they don't have an authenticating server
      accountsList.gameObject.SetActive(selectedComputer == null || selectedComputer.IsServer() || string.IsNullOrEmpty(selectedComputer.GetAuthenticatingServer()));

      // Only clients can see the list of possible authenticating servers
      authenticatedServerList.gameObject.SetActive(selectedComputer != null && !selectedComputer.IsServer());
    }

    // ------------------------------------------------------------------------
    private ComputerBehavior GetSelectedComputer() {
      if (selectedObject.Value != null) {
        return selectedObject.Value.GetComponent<ComputerBehavior>();
      }
      return null;
    }
  }
}
