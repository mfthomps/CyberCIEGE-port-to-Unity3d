using UnityEngine;
using TMPro;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Main {
  public class ZoneObjectPropertyPanel : GenericObjectPropertyPanel<ZoneBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for selected object's name")]
    public TMP_Text nameLabel;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(ZoneBehavior component) {
      nameLabel.text = component.Data.ZoneName;
    }
  }
}
