using Code.AccessControlGroup;
using Code.World_Objects.Computer;

// ----------------------------------------------------------------------------
namespace Code.User_Interface.Components {
  // Data structure for sending events to change access to a network connected to a computer
  public class ComputerNetworkAccessChange {
    public ComputerBehavior computer;
    public string network;
    public DACAccess accessToChange;

    // ------------------------------------------------------------------------
    public ComputerNetworkAccessChange(ComputerBehavior computer, string network, DACAccess accessToChange) {
      this.computer = computer;
      this.network = network;
      this.accessToChange = accessToChange;
    }
  }
}
