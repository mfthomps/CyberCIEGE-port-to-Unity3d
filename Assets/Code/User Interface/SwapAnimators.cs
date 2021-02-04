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

    private bool useDefaultAnimator;
    
    // Use this property to tell the Animator to use the alternate animator
    public bool UseDefaultAnimator {
      set {
        useDefaultAnimator = value;
        animator.runtimeAnimatorController = useDefaultAnimator ? alternateAnimatorController : defaultAnimatorController;
      }
    }
}
