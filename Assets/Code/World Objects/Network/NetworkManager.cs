using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.World_Objects.Network {
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
      }
    }

    // ------------------------------------------------------------------------
    private void ConnectToNetwork(ComponentBehavior component, NetworkBehavior network) {
      XElement xml = new XElement("componentEvent",
        new XElement("name", component.Data.component_name),
        new XElement("networkConnect", network.Data.name));
      IPCManagerScript.SendRequest(xml.ToString());
      component.ConnectToNetwork(network.Data.name);
    }

    // ------------------------------------------------------------------------
    private void DisconnectToNetwork(ComponentBehavior component, NetworkBehavior network) {
      XElement xml = new XElement("componentEvent",
        new XElement("name", component.Data.component_name),
        new XElement("networkDisconnect", network.Data.name));
      IPCManagerScript.SendRequest(xml.ToString());
      component.DisconnectFromNetwork(network.Data.name);
    }
  }
}
