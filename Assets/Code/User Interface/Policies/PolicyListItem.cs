using UnityEngine;
using TMPro;
using Code.Policies;

namespace Code.User_Interface.Policies {
  //Represents a single Policy UI element.
  public class PolicyListItem : SelectableListItem<Policy> {
    [Tooltip("The element that should display the Policy's name.")]
    [SerializeField] private TMP_Text nameLabel;
    [Tooltip("The element that should display the Policy's cost.")]
    [SerializeField] private TMP_Text costLabel;

    //-------------------------------------------------------------------------
    public override void SetItem(Policy policy) {
      nameLabel.text = policy.displayName;
      if (policy.cost > 0) {
        costLabel.text = string.Format("{0:C}", policy.cost);
      }
      else {
        costLabel.text = "";
      }
    }
  }
}