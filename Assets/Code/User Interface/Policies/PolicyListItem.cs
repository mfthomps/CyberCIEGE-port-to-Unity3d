using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.Policies;

namespace Code.User_Interface.Policies {
  //Represents a single Policy UI element.
  public class PolicyListItem : SelectableListItem<Policy> {
    [Tooltip("The element that should display the Policy's name.")]
    [SerializeField] private TMP_Text nameLabel;
    [Tooltip("The element that should display the Policy's cost.")]
    [SerializeField] private TMP_Text costLabel;
    [Tooltip("The button that allows selecting this policy item.")]
    [SerializeField] private Button selectionButton;

    //-------------------------------------------------------------------------
    public override void SetItem(Policy policy) {
      name = policy.displayName;
      nameLabel.text = policy.displayName;
      if (policy.cost > 0) {
        costLabel.text = string.Format("{0:C}", policy.cost);
      }
      else {
        costLabel.text = "";
      }
    }

    //-------------------------------------------------------------------------
    public void SetInteractable(bool interactable) {
      selectionButton.interactable = interactable;
    }
  }
}