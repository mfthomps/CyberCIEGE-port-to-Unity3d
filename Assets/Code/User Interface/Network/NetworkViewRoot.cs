using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Network {
  public class NetworkViewRoot : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Header("Input Variables")]
    [Tooltip("List of computers to select")]
    public ComputerListVariable computerListVariable;
    [Tooltip("List of devices to select")]
    public DeviceListVariable deviceListVariable;
    [Tooltip("List of networks to connect to")]
    public NetworkListVariable networkListVariable;
    [Header("UI Elements")]
    [Tooltip("Temporary list of all networkable devices (REMOVE ONCE NETWORK GRAPH IS IMPLEMENTED)")]
    public ComponentList networkableList;
    [Tooltip("List of all networks to connect to")]
    public NetworkList networkList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      selectedObject.OnValueChanged += UpdateSelection;
      computerListVariable.OnValueChanged += UpdateNetworkableList;
      deviceListVariable.OnValueChanged += UpdateNetworkableList;
      networkListVariable.OnValueChanged += UpdateNetworkList;
      UpdateNetworkableList();
      UpdateNetworkList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      selectedObject.OnValueChanged -= UpdateSelection;
      computerListVariable.OnValueChanged -= UpdateNetworkableList;
      deviceListVariable.OnValueChanged -= UpdateNetworkableList;
      networkListVariable.OnValueChanged -= UpdateNetworkList;
    }

    // ------------------------------------------------------------------------
    public void NetworkableItemClicked(ComponentListItem componentListItem) {
      selectedObject.Value = componentListItem.GetItem().gameObject;
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkableList() {
      var networkables = GetNetworkables();
      networkableList.SetItems(networkables);
      UpdateListSelection(networkables);
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      UpdateListSelection(GetNetworkables());
      UpdateNetworkConnections();
    }

    // ------------------------------------------------------------------------
    private void UpdateNetworkList() {
      networkList.SetItems(networkListVariable.Value);
      UpdateNetworkConnections();
    }

    // ------------------------------------------------------------------------
    private List<ComponentBehavior> GetNetworkables() {
      var networkables = new List<ComponentBehavior>();
      foreach (var computer in computerListVariable.Value) {
        networkables.Add(computer);
      }
      foreach (var device in deviceListVariable.Value) {
        networkables.Add(device);
      }
      return networkables;
    }

    // ------------------------------------------------------------------------
    private void UpdateListSelection(List<ComponentBehavior> networkables) {
      // Set the selected state for each of the items
      foreach (var networkable in networkables) {
        if (networkable != null) {
          networkableList.SetSelected(networkable, networkable.gameObject == selectedObject.Value);
        }
      }
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
