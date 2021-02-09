using System;
using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using UnityEngine;
using UnityEngine.AI;

namespace Code.World_Objects.User.AI {
  public class UserAI : MonoBehaviour {

    [SerializeField] private UserBehavior _user;
    [SerializeField] private ComputerListVariable _computerListVariable;
    [SerializeField] private NavMeshAgent _navMeshAgent;
    [SerializeField] private Animator _animator;
    
    private ComputerBehavior _assignedComputer;
    
    //-------------------------------------------------------------------------
    private void Start() {
      _computerListVariable.OnValueChanged += ComputerListVariableOnOnValueChanged;
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
        //wander
      }
    }
    
    //-------------------------------------------------------------------------
    private void Work(bool enable) {
      _animator.SetBool("Working", enable);
    }

    //-------------------------------------------------------------------------
    private void Walk(bool enable) {
      _animator.SetBool("Walking", enable);
    }

    //-------------------------------------------------------------------------
    private void NavigateTo(Vector3 location) {
      if (!_navMeshAgent.enabled) {
        Debug.Log("Activating NavMeshAgent");
        _navMeshAgent.enabled = true;
      }

      _navMeshAgent.destination = location;
    }

    //-------------------------------------------------------------------------
    private void ComputerListVariableOnOnValueChanged() {
      _assignedComputer =
        _computerListVariable.Value.Find(x => (x.Data as ComputerDataObject).assignedUser == _user.Data.user_name);
      
      Debug.Log($"User {_user.Data.user_name} has computer '{_assignedComputer}'");
    }
    
    //-------------------------------------------------------------------------
    private bool CanWork() {
      return _assignedComputer != null;
    }

    //-------------------------------------------------------------------------
    private bool AtLocation(Vector3 location) {
      return Vector3.Distance(_user.transform.position, location) < 0.5f;
    }
  }
}