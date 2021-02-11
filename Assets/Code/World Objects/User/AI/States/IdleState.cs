using UnityEngine;

namespace Code.World_Objects.User.AI.States {
  
  //A Fsm state to animate the character as Idle
  public class IdleState : FsmState{
    [SerializeField] private Animator _animator;
    [SerializeField] private string _idleAnimParam = "Idle";
  
    //-------------------------------------------------------------------------
    public override void OnStateEnter() {
      if (!string.IsNullOrEmpty(_idleAnimParam)) {
        _animator.SetBool(_idleAnimParam, true);
      }
    }
    
    //-------------------------------------------------------------------------
    public override void OnStateLeave() {
      if (!string.IsNullOrEmpty(_idleAnimParam)) {
        _animator.SetBool(_idleAnimParam, false);
      }
    }
  }
}