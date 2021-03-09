using UnityEngine;
using UnityEngine.AI;

namespace Code.World_Objects.User.AI.States {
  //A FSM state that gives a NavMeshAgent a path to the User's current nav target
  public class NavigateState : FsmState {
    [Tooltip("Some fudge to compare current navigation target to the current destination." +
             "Used to decide if a new destination should be set.")]
    [SerializeField] private float _distanceTolerance = 1.25f;

    [SerializeField] protected NavMeshAgent _agent;
    [SerializeField] protected Animator _animator;
    [SerializeField] protected Navigator _navigator;
    [SerializeField] private string _walkingAnimParam = "Walking";
    
    [Tooltip("How much distance tolerance when comparing locations")]
    [SerializeField] private float tolerance = 1f;
    
    //used to manipulate the NavMeshAgent obstacle priority to prevent multiple
    //agents having the same priority and colliding while navigating.
    private int _initialPriority = -1;
    private static int _priorityInc = 0;
    
    //-------------------------------------------------------------------------
    private void Awake() {
      if (!_agent) {
        _agent = GetComponentInParent<NavMeshAgent>();
      }
    }
    
    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      if (!_agent.enabled) {
        _agent.enabled = true;
      }

      if (_initialPriority < 0) {
        _initialPriority = _agent.avoidancePriority;
        _priorityInc++;
        if (_priorityInc > 99) {
          _priorityInc = 0;
        }
        _agent.avoidancePriority = _initialPriority + _priorityInc;
      }

      MaybeUpdateAgentDestination();
    }

    //--------------------------------------------------------------------------
    public override void OnStateLeave() {
      StopWalking();
    }

    //--------------------------------------------------------------------------
    protected virtual void Update() {
      //while running, check if the current navigation target has changed, based on the 
      //last set NavMeshAgent's destination. If so, give the NavMeshAgent the new position.

      if (_navigator.CurrentNavTarget && _agent.isOnNavMesh) {
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
      if (!_navigator.CurrentNavTarget) {
        return;
      }

      var dist = Vector3.Distance(_navigator.CurrentNavTarget.transform.position, _agent.destination);
      if (dist > _distanceTolerance) {
        if (_agent.SetDestination(_navigator.CurrentNavTarget.transform.position)) {
          StartWalking();
          Debug.Log($"Pathing [{_agent.name}] -> [{_navigator.CurrentNavTarget.name}]");
        }
        else {
          Debug.LogError($"Can't path [{_navigator.name}] to [{_navigator.CurrentNavTarget.transform.position}]");
        }
      }
    }
    
    //-------------------------------------------------------------------------
    protected void StartWalking() {
      _animator.SetBool(_walkingAnimParam, true);
    }
    
    //--------------------------------------------------------------------------
    protected void StopWalking() {
      _animator.SetBool(_walkingAnimParam, false);
    }

    //-------------------------------------------------------------------------
    protected bool IsAtDestination() {
      if (Vector3.Distance(transform.position, _navigator.CurrentNavTarget.transform.position) < tolerance) {
        return true;
      }
      else {
        return false;
      }  
    }
  }
}