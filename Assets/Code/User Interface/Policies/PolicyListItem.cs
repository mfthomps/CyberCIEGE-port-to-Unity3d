using System.Globalization;
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

    private Policy _policy;

    //-------------------------------------------------------------------------
    public override void SetItem(Policy policy) {
      name = policy.displayName;
      nameLabel.text = policy.displayName;
      _policy = policy;
      UpdateCostLabel();
    }

    //-------------------------------------------------------------------------
    public override void SetSelected(bool isSelected) {

      base.SetSelected(isSelected);
      UpdateCostLabel();
    }

    //-------------------------------------------------------------------------
    public void SetInteractable(bool interactable) {
      selectionButton.interactable = interactable;
    }

    //-------------------------------------------------------------------------
    private void UpdateCostLabel() {
      if (_policy.cost > 0) {
        // Our cost is halved if the policy is enabled
        CultureInfo culture = CultureInfo.CreateSpecificCulture("en-US");
        culture.NumberFormat.CurrencyNegativePattern = 1;
        costLabel.text = string.Format(culture, "{0:C}", _policy.CostToToggle(!IsSelected()));
      }
      else {
        costLabel.text = "";
      }
    }
  }
}