using UnityEngine;
using UnityEngine.AI;

namespace Code.World_Objects.User.AI.States {
  //A FSM state that gives a NavMeshAgent a path to the User's current nav target
  public class NavigateState : FsmState {
    [Tooltip("Some fudge to compare current navigation target to the current destination." +
             "Used to decide if a new destination should be set.")]
    [SerializeField] private float _distanceTolerance = 1.25f;

    [SerializeField] private NavMeshAgent _agent;
    [SerializeField] private Animator _animator;
    [SerializeField] private Navigator _user;
    [SerializeField] private string _walkingAnimParam = "Walking";

    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      if (!_agent.enabled) {
        _agent.enabled = true;
      }

      MaybeUpdateAgentDestination();
    }

    //--------------------------------------------------------------------------
    public override void OnStateLeave() {
      _animator.SetBool(_walkingAnimParam, false);
    }

    //--------------------------------------------------------------------------
    private void Update() {
      //while running, check if the current navigation target has changed, based on the 
      //last set NavMeshAgent's destination. If so, give the NavMeshAgent the new position.

      if (_user.CurrentNavTarget && _agent.isOnNavMesh) {
        if (_agent.pathPending) {
          return;
        }

        if (_agent.pathStatus == NavMeshPathStatus.PathInvalid || _agent.pathStatus == NavMeshPathStatus.PathPartial) {
          Debug.Log("Invalid path");
        }

        MaybeUpdateAgentDestination();
      }
    }

    //--------------------------------------------------------------------------
    private void MaybeUpdateAgentDestination() {
      //Check if the agent's current destination is "different" than the navigation target.
      //This could happen if the navigation target changes.
      if (!_user.CurrentNavTarget) {
        return;
      }

      var dist = Vector3.Distance(_user.CurrentNavTarget.transform.position, _agent.destination);
      if (dist > _distanceTolerance) {
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