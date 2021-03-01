using System.Collections.Generic;
using Shared.SEUI;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Network {
  public class NetworkBuilding {
    public string name;
    public List<ZoneBehavior> zones;

    // ------------------------------------------------------------------------
    public NetworkBuilding(string name, List<ZoneBehavior> zones) {
      this.name = name;
      this.zones = zones;
    }
  }

  public class NetworkBuildingList : DynamicList<NetworkBuildingListItem, NetworkBuilding> {
  }
}
