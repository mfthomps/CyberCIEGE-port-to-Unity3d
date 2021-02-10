using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using UnityEngine;
using UnityEngine.AI;
using Random = UnityEngine.Random;

namespace Code.World_Objects.User.AI {
  public class UserAI : MonoBehaviour {

    [SerializeField] private UserBehavior _user;
    [SerializeField] private ComputerListVariable _computerListVariable;
    [SerializeField] private NavMeshAgent _navMeshAgent;
    [SerializeField] private Animator _animator;
    
    private ComputerBehavior _assignedComputer;
    private GameObject[] _objectsOfInterest;
    private GameObject _currentWanderTarget = null;
    
    
    //-------------------------------------------------------------------------
    private void Start() {
      _computerListVariable.OnValueChanged += ComputerListVariableOnOnValueChanged;
      _objectsOfInterest = GameObject.FindGameObjectsWithTag("Object of Interest");
    }

    //-------------------------------------------------------------------------
    private void OnDestroy() {
      _computerListVariable.OnValueChanged -= ComputerListVariableOnOnValueChanged;
    }

    //-------------------------------------------------------------------------
    private void Update() {
      if (CanWork()) {
        if (AtLocation(_assignedComputer.transform.position)) {
          //work
          Work(true);
          Walk(false);
        }
        else {
          //nav to computer
          Walk(true);
          Work(false);
          NavigateTo(_assignedComputer.transform.position);
        }
      }
      else {
        Work(false);
        Wander();
      }
    }

    //-------------------------------------------------------------------------
    private void Wander() {
      if (!_currentWanderTarget && _objectsOfInterest.Length > 0) {
        int rnd = Random.Range(0, _objectsOfInterest.Length);
        _currentWanderTarget = _objectsOfInterest[rnd];
        // Debug.Log($"{_user.Data.user_name} target is {_currentWanderTarget.name}");
      }

      if (_currentWanderTarget) {
        Walk(true);
        NavigateTo(_currentWanderTarget.transform.position);
        
        if (AtLocation(_currentWanderTarget.transform.position)) {
          // Debug.Log($"{_user.Data.user_name} arrived.");
          _currentWanderTarget = null;
          Walk(false);
        }
      }
    }
    
    //-------------------------------------------------------------------------
    private void Work(bool enable) {
      if (!_animator.isInitialized) {return;}
      _animator.SetBool("Working", enable);
    }

    //-------------------------------------------------------------------------
    private void Walk(bool enable) {
      if (!_animator.isInitialized) {return;}
      _animator.SetBool("Walking", enable);
    }

    //-------------------------------------------------------------------------
    private void NavigateTo(Vector3 location) {
      if (!_navMeshAgent.enabled) {
        // Debug.Log("Activating NavMeshAgent");
        _navMeshAgent.enabled = true;
      }

      if (_navMeshAgent.isOnNavMesh) {
        if (_navMeshAgent.destination != location) {
          if (!_navMeshAgent.SetDestination(location)) {
            Debug.LogError($"Can't path {_user.Data.user_name} to {location}");
          }
        }
      }
    }

    //-------------------------------------------------------------------------
    private void ComputerListVariableOnOnValueChanged() {
      _assignedComputer =
        _computerListVariable.Value.Find(x => (x.Data as ComputerDataObject).assignedUser == _user.Data.user_name);
      
      // Debug.Log($"User {_user.Data.user_name} has computer '{_assignedComputer}'");
    }
    
    //-------------------------------------------------------------------------
    private bool CanWork() {
      return _assignedComputer != null;
    }

    //-------------------------------------------------------------------------
    private bool AtLocation(Vector3 location) {
      return Vector3.Distance(_user.transform.position, location) < 1f;
    }
  }
}