using UnityEngine;
using UnityEngine.AI;

namespace Code.World_Objects.User.AI.States {
  //A FSM state that gives a NavMeshAgent a path to the User's current nav target
  public class NavigateState : FsmState {
    [SerializeField] private NavMeshAgent _agent;
    [SerializeField] private Animator _animator;
    [SerializeField] private Navigator _user;
    [SerializeField] private string _walkingAnimParam = "Walking";

    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      if (!_agent.enabled) {
        _agent.enabled = true;
      }
      
      if (_user.CurrentNavTarget && _agent.isOnNavMesh) {
        if (_agent.SetDestination(_user.CurrentNavTarget.transform.position)) {
          _animator.SetBool(_walkingAnimParam, true);
        }
        else {
          Debug.LogError($"Can't path to {_user.CurrentNavTarget.transform.position}");
        }        
      }
      else {
        Debug.LogError($"Can't set destination for {_user.name}");

      }
    }
    
    //--------------------------------------------------------------------------
    public override void OnStateLeave() {
      _animator.SetBool(_walkingAnimParam, false);
    }
  }
}