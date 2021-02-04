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
    private bool useDefaultAnimator;
    private bool useAlternateAnimator;
    
    // Use this property to tell the Animator to use the default animator
    public bool UseDefaultAnimator {
      set {
        useDefaultAnimator = value;
        useAlternateAnimator = !useDefaultAnimator;
        animator.runtimeAnimatorController = useDefaultAnimator ? defaultAnimatorController : alternateAnimatorController;
      }
    }
    // Use this property to tell the Animator to use the default animator
    public bool UseAlternateAnimator {
      set {
        useAlternateAnimator = value;
        useDefaultAnimator = !useAlternateAnimator;
        animator.runtimeAnimatorController = useAlternateAnimator ? alternateAnimatorController : defaultAnimatorController;
      }
    }
    public void SetDefaultAnimator () {
        useDefaultAnimator = true;
        useAlternateAnimator = false;

        animator.runtimeAnimatorController = useDefaultAnimator ? defaultAnimatorController : alternateAnimatorController;
    }
    // Use this property to tell the Animator to use the default animator
    public void SetAlternateAnimator () {
        useAlternateAnimator = true;
        useDefaultAnimator = false;

        animator.runtimeAnimatorController = useAlternateAnimator ? alternateAnimatorController : defaultAnimatorController;
    }

    public void ToggleAnimators () { 
      if (useDefaultAnimator) {
        SetDefaultAnimator();
      }
      else {
        SetAlternateAnimator();
      }
    }
}
