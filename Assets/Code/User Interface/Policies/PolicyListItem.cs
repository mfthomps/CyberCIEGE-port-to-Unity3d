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

      // get the animator from the interactable toggle
      // and set the animation state
      Animator animator = selectionButton.GetComponent<Animator>();
      if (animator) {
        Debug.Log("Animator: " + animator.gameObject.name);
        animator.SetBool("Selected", isSelected);
        animator.SetBool("Normal", !isSelected);
      }

      // get the SwapAnimators component from the interactable toggle
      // and swap the animators based on whether the item is selected or not
      SwapAnimators swapAnimators = selectionButton.GetComponent<SwapAnimators>();
      if (swapAnimators) {
        swapAnimators.UseDefaultAnimator = isSelected;
      }
    }

    //-------------------------------------------------------------------------
    public void SetInteractable(bool interactable) {
      selectionButton.interactable = interactable;
      selectionToggle.interactable = interactable;
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