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
      _computerFactory.Remove(computer);
    }
  }
}