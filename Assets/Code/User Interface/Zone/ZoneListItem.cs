using UnityEngine;
using TMPro;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Zone {
  //Represents one selectable Zone item in the Zone List UI screen
  public class ZoneListItem : SelectableListItem<ZoneBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(ZoneBehavior item) {
      this.name = item.Data.ZoneName;
      labelUI.text = item.Data.ZoneName;
    }
  }
}