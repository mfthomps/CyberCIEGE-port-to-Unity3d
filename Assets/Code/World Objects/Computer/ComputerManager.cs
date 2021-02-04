using System.Xml.Linq;
using Code.Factories;
using UnityEngine;

namespace Code.World_Objects.Computer {
  //Handles some functionality for ComputerBehaviors
  public class ComputerManager : MonoBehaviour {
    [Tooltip("The ComputerFactory to use for adding/deleting computers.")]
    [SerializeField] private ComputerFactory _computerFactory;

    //--------------------------------------------------------------------------
    public void OnScrapComputer(ComputerBehavior computer) {
      //TODO Notify the game server this computer should be removed
      SendScrapEvent(computer);
      _computerFactory.Remove(computer);
    }

    //--------------------------------------------------------------------------
    private static void SendScrapEvent(ComponentBehavior computer) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement("sell"));

      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}