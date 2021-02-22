using UnityEngine;
using UnityEngine.UI;
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

    [Tooltip("The button that allows selecting this policy item.")]
    public Button selectionButton;

    

    //-------------------------------------------------------------------------
    public override void SetItem(SoftwareBehavior item) {
      this.name = item.Data.name;
      nameLabel.text = item.Data.name;
      
      if (costLabel != null) {
        costLabel.text = $"{item.Data.cost:C0}";
      }
      SetInteractable(true);
    }

    //-------------------------------------------------------------------------
    public override void SetSelected(bool isSelected) {
      base.SetSelected(isSelected);
      // UpdateCostLabel();

      // get the animator from the interactable toggle
      // and set the animation state
      Animator animator = selectionButton.GetComponent<Animator>();
      if (animator) {
        // Debug.Log("Animator: " + animator.gameObject.name);
        animator.SetBool("Selected", isSelected);
        animator.SetBool("Normal", !isSelected);
      }

      // get the SwapAnimators component from the interactable toggle
      // and swap the animators based on whether the item is selected or not
      SwapAnimators swapAnimators = selectionButton.GetComponent<SwapAnimators>();
      if (swapAnimators) {
        swapAnimators.IsUsingAlternateAnimator = isSelected;
      }
    }

    //-------------------------------------------------------------------------
    public void SetInteractable(bool interactable) {
      selectionButton.interactable = interactable;
      selectionToggle.interactable = interactable;
    }

  }
}