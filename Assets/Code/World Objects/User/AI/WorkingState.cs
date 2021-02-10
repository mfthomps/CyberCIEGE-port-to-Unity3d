using UnityEngine;

namespace Code.World_Objects.User.AI {
  
  // A Fsm State that animates the character as working
  public class WorkingState : FsmState {
    [SerializeField] private Animator _animator;
    [SerializeField] private string _workAnimationParam = "Working";

    //-------------------------------------------------------------------------
    public override void OnStateEnter() {
      _animator.SetBool(_workAnimationParam, true);
    }

    //-------------------------------------------------------------------------
    public override void OnStateLeave() {
      _animator.SetBool(_workAnimationParam, false);
    }
  }
}