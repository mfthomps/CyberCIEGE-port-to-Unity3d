using UnityEngine;
using UnityEngine.AI;

namespace Code.World_Objects.User.AI.States {
  //A FSM state that gives a NavMeshAgent a path to the User's current nav target
  public class NavigateState : FsmState {
    [SerializeField] private NavMeshAgent _agent;
    [SerializeField] private Animator _animator;
    [SerializeField] private UserBehavior _user;
    [SerializeField] private string _walkingAnimParam = "Walking";

    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      if (!_agent.enabled) {
        _agent.enabled = true;
      }
      
      if (_user.CurrentNavTarget && _agent.isOnNavMesh) {
        if (_agent.SetDestination(_user.CurrentNavTarget.transform.position)) {
          _animator.SetBool(_walkingAnimParam, true);
          Debug.Log($"{_user.Data.user_name} navigating to {_user.CurrentNavTarget.name}");
        }
        else {
          Debug.LogError($"Can't path to {_user.CurrentNavTarget.transform.position}");
        }        
      }
    }
    
    //--------------------------------------------------------------------------
    public override void OnStateLeave() {
      _animator.SetBool(_walkingAnimParam, false);
    }
  }
}