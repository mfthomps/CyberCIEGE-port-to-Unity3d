using System.Collections.Generic;
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
    [Tooltip("The GameEvent to fire when an asset should be assigned to the selected computer")]
    [SerializeField] private AssetGameEvent _assignAsset;
    [Tooltip("The GameEvent to fire when an asset should be unassigned from the selected computer")]
    [SerializeField] private AssetGameEvent _unassignAsset;
    [Tooltip("The GameEvent to fire when software should be added to the selected computer")]
    [SerializeField] private SoftwareGameEvent _addSoftware;
    [Tooltip("The GameEvent to fire when software should be removed from the selected computer")]
    [SerializeField] private SoftwareGameEvent _removeSoftware;
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
    [Tooltip("List of assets assigned to the selected computer")]
    public AssetList assignedAssetsList;
    [Tooltip("List of assets not assigned to the selected computer")]
    public AssetList unassignedAssetsList;
    [Tooltip("List of software assigned to the selected computer")]
    public SoftwareList addedSoftwareList;
    [Tooltip("List of software not assigned to the selected computer")]
    public SoftwareList availableSoftwareList;
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
      UpdateAssetsSettings(computer);
      UpdateSoftwareSettings(computer);

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
    private ComputerBehavior GetSelectedComputer() {
      if (selectedObject.Value != null) {
        return selectedObject.Value.GetComponent<ComputerBehavior>();
      }
      return null;
    }
  }
}
