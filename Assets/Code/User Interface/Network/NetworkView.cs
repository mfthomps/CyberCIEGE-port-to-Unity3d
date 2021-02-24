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
      UpdateNetworkList();
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
      UpdateSelection();
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
      UpdateNetworkConnections();
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkList() {
      networkList.SetItems(networkListVariable.Value);
      UpdateNetworkConnections();
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkConnections() {
      foreach (var network in networkListVariable.Value) {
        if (network != null) {
          bool networkSelected = false, networkChangeable = false;
          if (selectedObject.Value != null) {
            var selectedComponent = selectedObject.Value?.GetComponent<ComponentBehavior>();
            networkSelected = selectedComponent != null && selectedComponent.Data.IsConnectedToNetwork(network.Data.name);
            if (selectedComponent != null) {
              // Internet networks can only be connected to by devices, not computers
              if (network.Data.isInternet) {
                networkChangeable = selectedComponent is DeviceBehavior;
              }
              // Otherwise, any ComponentBehavior can connect to it
              else {
                networkChangeable = true;
              }
            }
          }
          networkList.SetSelected(network, networkSelected);
          networkList.SetInteractable(network, networkChangeable);
        }
      }
    }
  }
}
