using UnityEngine;
using Shared.ScriptableVariables;
using Code.World_Objects.Network;

namespace Code.Test {
  public class TestNetworkUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }

    // ------------------------------------------------------------------------
    public void ToggleNetworkConnection(NetworkBehavior network) {
      var component = selectedObject.Value.GetComponent<ComponentBehavior>();
      if (component != null) {
        Debug.Log($"Toggle network: {network.Data.name} for {component.Data.component_name}");
        if (!component.Data.IsConnectedToNetwork(network.Data.name)) {
          component.Data.ConnectToNetwork(network.Data.name);
        }
        else {
          component.Data.DisconnectFromNetwork(network.Data.name);
        }
      }
      else {
        Debug.LogError("Network toggled on non-component selection!");
      }
    }
  }
}
