using UnityEngine;
using TMPro;
using Code.Software;

namespace Code.User_Interface.Software {
  //Represents one selectable Software item in the Software List UI screen
  public class SoftwareListItem : SelectableListItem<SoftwareBehavior> {
    [Tooltip("The label that should display the item's name.")]
    [SerializeField]
    private TMP_Text nameLabel;
    [Tooltip("The label that should display the item's cost.")]
    [SerializeField]
    private TMP_Text costLabel;
   

    //-------------------------------------------------------------------------
    public override void SetItem(SoftwareBehavior item) {
      this.name = item.Data.name;
      nameLabel.text = item.Data.name;
      
      if (costLabel != null) {
        if (item.Data.cost > 0) {
          costLabel.text = $"{item.Data.cost:C0}";
        }
        else {
          costLabel.text = "FREE";
        }
      }

    }
  }
}