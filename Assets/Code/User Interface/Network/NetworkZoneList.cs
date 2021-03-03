using Shared.SEUI;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Network {
  public class NetworkZoneList : DynamicList<NetworkZoneListItem, ZoneBehavior> {
    // ------------------------------------------------------------------------
    public void UpdateSelectedComponent(ComponentBehavior selectedComponent) {
      foreach (var listItem in listItems) {
        listItem.Value.UpdateSelectedComponent(selectedComponent);
      }
    }
  }
}
