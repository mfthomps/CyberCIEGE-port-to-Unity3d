using UnityEngine;

namespace Code {
  public class DoorController : MonoBehaviour {
    [SerializeField] private Animator animator;
    [Tooltip("The boolean animation parameter name to use when opening/closing doors.")]
    [SerializeField] private string _enterAnimationParam = "Open";
    
    private void OnTriggerEnter(Collider other) {
      animator.SetBool(_enterAnimationParam, true);
    }

    private void OnTriggerExit(Collider other) {
      animator.SetBool(_enterAnimationParam, false);
    }
  }
}