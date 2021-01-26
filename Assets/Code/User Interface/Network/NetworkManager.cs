using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.World_Objects.Network;

namespace Code.User_Interface.Network {
  public class NetworkManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    public void ToggleNetworkConnection(NetworkBehavior network) {
      var selectedComponent = selectedObject.Value.GetComponent<ComponentBehavior>();
      if (selectedComponent != null) {
        if (!selectedComponent.Data.IsConnectedToNetwork(network.Data.name)) {
          ConnectToNetwork(selectedComponent, network);
        }
        else {
          DisconnectToNetwork(selectedComponent, network);
        }

        // Reselect our component to force the UI to update
        selectedObject.Value = null;
        selectedObject.Value = selectedComponent.gameObject;
      }
    }

    // ------------------------------------------------------------------------
    private void ConnectToNetwork(ComponentBehavior component, NetworkBehavior network) {
      XElement xml = new XElement("componentEvent",
        new XElement("name", component.Data.component_name),
        new XElement("networkConnect", network.Data.name));

      component.Data.ConnectToNetwork(network.Data.name);
      IPCManagerScript.SendRequest(xml.ToString());
    }

    // ------------------------------------------------------------------------
    private void DisconnectToNetwork(ComponentBehavior component, NetworkBehavior network) {
      XElement xml = new XElement("componentEvent",
        new XElement("name", component.Data.component_name),
        new XElement("networkDisconnect", network.Data.name));

      component.Data.DisconnectFromNetwork(network.Data.name);
      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}
