using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectionToggle : MonoBehaviour
{
    // Start is called before the first frame update

    [SerializeField] private SwapAnimators animatorSwap;
    public void SetSelected(bool isOn) {      
      if (animatorSwap) {
        animatorSwap.IsUsingAlternateAnimator = isOn;
      }
    }
}
