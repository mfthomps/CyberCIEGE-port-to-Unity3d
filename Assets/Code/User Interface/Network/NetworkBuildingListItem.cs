using UnityEngine;
using TMPro;
using Shared.SEUI;

namespace Code.User_Interface.Network {
  public class NetworkBuildingListItem : DynamicListItem<NetworkBuilding> {
    [Header("UI Elements")]
    [Tooltip("Label for the building this item represents")]
    public TMP_Text buildingLabel;
    [Tooltip("List of all network zones in the building this item represents")]
    public NetworkZoneList networkZoneList;

    // ------------------------------------------------------------------------
    public override void SetItem(NetworkBuilding item) {
      var showBuilding = item.name != "Hide";
      buildingLabel.text = showBuilding ? $"Building: {item.name}" : "";
      networkZoneList.SetItems(item.zones);
    }
  }
}
