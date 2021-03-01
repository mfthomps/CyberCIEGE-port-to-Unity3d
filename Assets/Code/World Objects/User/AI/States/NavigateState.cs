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
          Debug.Log($"Pathing [{_agent.name}] -> [{_user.CurrentNavTarget}]");
        }
        else {
          Debug.LogError($"Can't path [{_user.name}] to [{_user.CurrentNavTarget.transform.position}]");
        }
      }
    }
    
    //--------------------------------------------------------------------------
    public override void OnStateLeave() {
      _animator.SetBool(_walkingAnimParam, false);
    }

    //--------------------------------------------------------------------------
    private void Update() {
      //while running, check if the current navigation target has changed, based on the 
      //last set NavMeshAgent's destination. If so, give the NavMeshAgent the new position.
      const float fudge = 1.5f;
      
      if (_user.CurrentNavTarget && _agent.isOnNavMesh ) {
        var dist = Vector3.Distance(_user.CurrentNavTarget.transform.position, _agent.destination);
        if (dist > fudge) {
          if (_agent.SetDestination(_user.CurrentNavTarget.transform.position)) {
            _animator.SetBool(_walkingAnimParam, true);
            Debug.Log($"Pathing [{_agent.name}] -> [{_user.CurrentNavTarget}]");
          }
          else {
            Debug.LogError($"Can't path [{_user.name}] to [{_user.CurrentNavTarget.transform.position}]");
          }
        }
      }
    }
  }
}