using Code.Hardware;
using UnityEngine;

namespace Code.Scriptable_Variables {
  //Represents a list of all the known Hardware types available in the CyberCIEGE game
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Hardware Type List")]
  public class HardwareTypeVariable : ListVariable<HardwareTypeProperties> {
    
  }
}