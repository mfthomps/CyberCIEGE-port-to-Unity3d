using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor.Animations;

public class SwapAnimators : MonoBehaviour
{
    // This component can swap between two animators at runtime
    // This is designed for the auto-generated animators for ui elements
    // so all states will be identical. For exmaple, there will be
    // Normal, Highlighted, Pressed, Disabled and Selected states.
    
    // Assign the Animator to manipulate
    [SerializeField] private Animator animator;

    // the default animator
    [SerializeField] private AnimatorController defaultAnimatorController;

    // the alternate animator
    [SerializeField] private AnimatorController alternateAnimatorController;

    // private variables for public property
    private bool isUsingDefaultAnimator;
    private bool isUsingAlternateAnimator;
    
    // Use this property to tell the Animator to use the default animator
    public bool IsUsingDefaultAnimator {
      set {
        isUsingDefaultAnimator = value;
        isUsingAlternateAnimator = !isUsingDefaultAnimator;
        animator.runtimeAnimatorController = isUsingDefaultAnimator ? defaultAnimatorController : alternateAnimatorController;
      }
    }
    // Use this property to tell the Animator to use the default animator
    public bool IsUsingAlternateAnimator {
      set {
        isUsingAlternateAnimator = value;
        isUsingDefaultAnimator = !isUsingAlternateAnimator;
        animator.runtimeAnimatorController = isUsingAlternateAnimator ? alternateAnimatorController : defaultAnimatorController;
      }
    }
    public void UseDefaultAnimator () {
        isUsingDefaultAnimator = true;
        isUsingAlternateAnimator = false;

        animator.runtimeAnimatorController = isUsingDefaultAnimator ? defaultAnimatorController : alternateAnimatorController;
    }
    // Use this property to tell the Animator to use the default animator
    public void UseAlternateAnimator () {
        isUsingAlternateAnimator = true;
        isUsingDefaultAnimator = false;

        animator.runtimeAnimatorController = isUsingAlternateAnimator ? alternateAnimatorController : defaultAnimatorController;
    }

    public void ToggleAnimators () { 
      if (isUsingDefaultAnimator) {
        UseDefaultAnimator();
      }
      else {
        UseAlternateAnimator();
      }
    }

    public void SetAlternateAnimator (bool isOn) { 
      Debug.Log("Value: " + isOn.ToString());
      IsUsingAlternateAnimator = isOn;
    }
}
