using UnityEngine;
using TMPro;

//used to manage the attack button
namespace Code.AttackLog {
  public class AttackLogButton : MonoBehaviour {
    [SerializeField] private SwapAnimators swapAnimators;
  
    public void SetHasNewLogs(bool newLogs) {
      swapAnimators.UseAlternateAnimator = newLogs;
    }

  }
}
