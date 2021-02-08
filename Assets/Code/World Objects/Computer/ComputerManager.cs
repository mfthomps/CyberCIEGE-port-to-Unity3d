using System.Xml.Linq;
using UnityEngine;

namespace Code.World_Objects.Computer {
  //Handles some functionality for ComputerBehaviors
  public class ComputerManager : MonoBehaviour {

    //--------------------------------------------------------------------------
    public void OnScrapComputer(ComputerBehavior computer) {
      //Notify the game server this computer should be removed
      SendScrapEvent(computer);
      
    }

    //--------------------------------------------------------------------------
    private static void SendScrapEvent(ComponentBehavior computer) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement("sell", ""));

      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}