using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.World_Objects.Device;
using Code.World_Objects.Network;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Network {
  public class NetworkView : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Tooltip("Toggles the network connection for the currently selected component")]
    public NetworkBehaviorGameEvent toggleNetworkConnection;
    [Header("Input Variables")]
    [Tooltip("List of zones in scenario")]
    public ZoneListVariable zones;
    [Tooltip("List of networks to connect to")]
    public NetworkListVariable networkListVariable;
    [Header("UI Elements")]
    [Tooltip("List of all buildings that can have components in them")]
    public NetworkBuildingList networkBuildingList;
    [Tooltip("List of all networks to connect to")]
    public NetworkList networkList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      selectedObject.OnValueChanged += UpdateSelection;
      zones.OnValueChanged += UpdateNetworkBuildings;
      networkListVariable.OnValueChanged += UpdateNetworkList;
      UpdateNetworkBuildings();
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      selectedObject.OnValueChanged -= UpdateSelection;
      zones.OnValueChanged -= UpdateNetworkBuildings;
      networkListVariable.OnValueChanged -= UpdateNetworkList;
    }

    // ------------------------------------------------------------------------
    public void NetworkableItemClicked(ComponentBehavior selectedComponent) {
      selectedObject.Value = selectedComponent.gameObject;
    }

    // ------------------------------------------------------------------------
    public void NetworkItemClicked(NetworkBehavior network) {
      toggleNetworkConnection?.Raise(network);
      UpdateNetworkConnections();
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkBuildings() {
      // Group the zones together by their site
      var zoneSiteMap = new Dictionary<string, List<ZoneBehavior>>();
      foreach (var zone in zones.Value) {
        if (!zoneSiteMap.ContainsKey(zone.Data.domain)) {
          zoneSiteMap.Add(zone.Data.domain, new List<ZoneBehavior>());
        }
        zoneSiteMap[zone.Data.domain].Add(zone);
      }

      networkBuildingList.ClearItems();
      foreach (var site in zoneSiteMap) {
        networkBuildingList.AddItem(new NetworkBuilding(site.Key, site.Value));
      }
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      UpdateNetworkList();
      networkBuildingList.UpdateSelectedComponent(GetSelectedComponent());
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkList() {
      networkList.SetItems(GetAvailableNetworks());
      UpdateNetworkConnections();
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkConnections() {
      foreach (var building in networkBuildingList.listItems.Values) {
        building.UpdateNetworkConnections();
      }

      foreach (var network in networkListVariable.Value) {
        if (network != null && networkList.listItems.ContainsKey(network)) {
          bool networkSelected = false, networkChangeable = false;
          var selectedComponent = GetSelectedComponent();
          if (selectedComponent != null) {
            networkSelected = selectedComponent.Data.IsConnectedToNetwork(network.Data.name);
            // Internet networks can only be connected to by devices, not computers
            if (network.Data.isInternet) {
              networkChangeable = selectedComponent is DeviceBehavior;
            }
            // Otherwise, any ComponentBehavior can connect to it
            else {
              networkChangeable = true;
            }
            networkList.SetSelected(network, networkSelected);
            networkList.SetInteractable(network, !selectedComponent.Data.isStatic && networkChangeable);
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    private List<NetworkBehavior> GetAvailableNetworks() {
      var availableNetworks = new List<NetworkBehavior>();

      var currentZone = GetSelectedZone();
      if (currentZone != null) {
        foreach (var network in networkListVariable.Value) {
          // The zone of the currently selected component specifically excludes certain networks
          if (!currentZone.Data.excludedNetworks.Contains(network.Data.name)) {
            availableNetworks.Add(network);
          }
        }
      }

      return availableNetworks;
    }

    // ------------------------------------------------------------------------
    private ZoneBehavior GetSelectedZone() {
      var selectedComponent = GetSelectedComponent();
      if (selectedComponent != null) {
        return zones.Value.Find(zone => selectedComponent.Data.zone == zone.Data.ZoneName);
      }
      return null;
    }

    // ------------------------------------------------------------------------
    private ComponentBehavior GetSelectedComponent() {
      if (selectedObject.Value != null) {
        return selectedObject.Value.GetComponent<ComponentBehavior>();
      }
      return null;
    }
  }
}
