using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Shared.SEUI;
using Code.Factories;
using Code.Scriptable_Variables;
using Code.World_Objects.Network;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Network {
  public class NetworkBuildingListItem : DynamicListItem<NetworkBuilding> {
    [Header("Input Variables")]
    [Tooltip("The list of properties for the scenario's organization.")]
    [SerializeField] private StringStringVariable _organizationDict;
    [Tooltip("List of computers in the scenario")]
    public ComputerListVariable computers;
    [Tooltip("List of devices in the scenario")]
    public DeviceListVariable devices;
    [Tooltip("List of networks in the scenario")]
    public NetworkListVariable networks;
    [Header("UI Elements")]
    [Tooltip("Label for the building this item represents")]
    public TMP_Text buildingLabel;
    [Tooltip("List of all network zones in the building this item represents")]
    public NetworkZoneList networkZoneList;
    [Tooltip("Prefab for connection lines")]
    public NetworkConnectionLine networkConnectionPrefab;
    [Tooltip("UI area to put our network lines")]
    public RectTransform networkLineArea;
    [Tooltip("UI area that represents the Internet network")]
    public RectTransform internetVisual;
    [Tooltip("Layout element for UI area that represents the Internet network")]
    public LayoutElement internetVisualLayout;
    [Header("Customization")]
    [Tooltip("Size of network component UI")]
    public float networkableUISize = 140.0f;
    [Tooltip("Size of spacing between network component UI")]
    public float networkableUISpacing = 40.0f;
    [Tooltip("Diagram line width")]
    public float diagramLineWidth = 2.0f;

    private List<NetworkConnectionLine> _networkLines = new List<NetworkConnectionLine>();

    // ------------------------------------------------------------------------
    public override void SetItem(NetworkBuilding item) {
      // Clear out any old lines we have
      foreach (var line in _networkLines) {
        Destroy(line.gameObject);
      }
      _networkLines.Clear();

      var showBuilding = item.name != "Hide";
      buildingLabel.text = showBuilding ? $"Building: {item.name}" : "";
      this.name = buildingLabel.text;
      networkZoneList.SetItems(item.zones);
      internetVisualLayout.preferredWidth = networkableUISize + networkableUISpacing;
      internetVisualLayout.preferredHeight = networkableUISize;
    }

    // ------------------------------------------------------------------------
    public void UpdateSelectedComponent(ComponentBehavior selectedComponent) {
      networkZoneList.UpdateSelectedComponent(selectedComponent);
    }

    // ------------------------------------------------------------------------
    public void UpdateNetworkConnections() {
      // Clear out any previous network lines
      foreach (var line in _networkLines) {
        Destroy(line.gameObject);
      }
      _networkLines.Clear();

      // Get all the networkable components in each zone
      var zones = new List<ZoneBehavior>(networkZoneList.listItems.Keys);
      var networkablesPerZone = new Dictionary<ZoneBehavior, List<ComponentBehavior>>();
      var networkables = new List<ComponentBehavior>(computers.Value);
      networkables.AddRange(devices.Value);
      foreach (var zone in zones) {
        if (!networkablesPerZone.ContainsKey(zone)) {
          networkablesPerZone.Add(zone, new List<ComponentBehavior>());
        }
        foreach (var networkable in networkables) {
          if (networkable.Data.zone == zone.Data.ZoneName) {
            networkablesPerZone[zone].Add(networkable);
          }
        }
      }

      // For each zone, set its list of components
      var networkablesInBuilding = new List<ComponentBehavior>();
      foreach (var zoneListItem in networkZoneList.listItems) {
        var networkablesInZone = networkablesPerZone[zoneListItem.Key];
        zoneListItem.Value.SetNetworkables(networkablesInZone, networkableUISize, GetMaxNetworkDiagramWidth() + networkableUISpacing);
        networkablesInBuilding.AddRange(networkablesInZone);
      }

      // Now go through and figure out which networkables are connected in this building
      var internetNetworkName = _organizationDict[NetworkFactory.ORGANIZATION_INTERNET_NETWORK_NAME];
      var internetNetwork = networks.Value.Find(network => network.Data.name == internetNetworkName);
      for (var index = 0; index < networkablesInBuilding.Count; ++index) {
        var component1 = networkablesInBuilding[index];
        foreach (var network in component1.Data.network_list) {
          if (network == internetNetworkName) {
            AddNetworkConnection(GetComponentUI(component1, zones), internetVisual, internetNetwork);
          }
          else {
            var hasConnection = false;
            for (var otherIndex = index + 1; otherIndex < networkablesInBuilding.Count; ++otherIndex) {
              var component2 = networkablesInBuilding[otherIndex];
              if (component2.Data.network_list.Contains(network)) {
                hasConnection = true;
                AddNetworkConnection(zones, component1, component2, network);
              }
            }
            // If this is the only component connected to this network, we still want a visual of this connection
            if (!hasConnection) {
              AddNetworkConnection(zones, component1, null, network);
            }
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    private RectTransform GetComponentUI(ComponentBehavior component, List<ZoneBehavior> zones) {
      if (component != null) {
        var componentZone = zones.Find(zone => zone.Data.ZoneName == component.Data.zone);
        var componentUI = networkZoneList.listItems[componentZone].GetComponentUI(component);
        return componentUI.transform as RectTransform;
      }
      return null;
    }

    // ------------------------------------------------------------------------
    private void AddNetworkConnection(List<ZoneBehavior> zones, ComponentBehavior component1, ComponentBehavior component2, string networkName) {
      var network = networks.Value.Find(existingNetwork => existingNetwork.Data.name == networkName);
      AddNetworkConnection(GetComponentUI(component1, zones), GetComponentUI(component2, zones), network);
    }

    // ------------------------------------------------------------------------
    private void AddNetworkConnection(RectTransform start, RectTransform end, NetworkBehavior network) {
      // Move the connection based on which network number this is so network diagrams don't overlap
      var line = Instantiate(networkConnectionPrefab, networkLineArea);
      line.lineWidth = diagramLineWidth / 2.0f;
      var networkIndex = networks.Value.FindIndex(existingNetwork => existingNetwork == network);
      line.DrawConnection(start, end, network, networkableUISize, networkableUISpacing, GetMaxNetworkDiagramWidth(), GetNetworkOffset(networkIndex));
      _networkLines.Add(line);
    }

    // ------------------------------------------------------------------------
    private float GetMaxNetworkDiagramWidth() {
      return (networks.Value.Count - 1) * diagramLineWidth;
    }

    // ------------------------------------------------------------------------
    private float GetNetworkOffset(int networkIndex) {
      return networkIndex * diagramLineWidth;
    }
  }
}
