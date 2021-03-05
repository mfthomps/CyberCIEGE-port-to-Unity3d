using System.Collections.Generic;
using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using UnityEngine;

namespace Code.World_Objects.User.AI.States {
  
  // A Fsm State that animates the character as working
  public class WorkingState : NavigateState {
    [SerializeField] private string _workAnimationParam = "Working";
    [SerializeField] private string _angryAnimationParam = "Angry";
    [SerializeField] private UserBehavior _user;
    [SerializeField] private ComputerListVariable _computerListVariable;
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;
    
    [Tooltip("The number of seconds to wait before randomly choosing a different animation")] 
    [SerializeField]
    private float _calcAnimationDelaySeconds = 5;

    [Tooltip("The CharacterGameEvent to fire when the character has started 'working'")] 
    [SerializeField]
    private CharacterGameEvent _startedWorkingEvent;

    private double _lastAnimCheck = 0;
    private bool _startedWorking = false;

    //-------------------------------------------------------------------------
    public override void OnStateEnter() {
      base.OnStateEnter();

      MaybeSetWorkDestination();

      if (IsAtDestination() && !_startedWorking) {
        BeginWorking();
      }
    }
    
    //-------------------------------------------------------------------------
    public override void OnStateLeave() {
      base.OnStateLeave();
      
      if (!string.IsNullOrEmpty(_workAnimationParam)) {
        _animator.SetBool(_workAnimationParam, false);
      }

      if (!string.IsNullOrEmpty(_angryAnimationParam)) {
        _animator.SetBool(_angryAnimationParam, false);
      }

      _lastAnimCheck = 0;
      _startedWorking = false;
      
      //Re-enable the ability for the NavMeshAgent to control the agent
      _agent.updateRotation = true;
      _agent.updatePosition = true;
    }

    //-------------------------------------------------------------------------
    protected override void Update() {
      base.Update();
      
      if (IsAtDestination()) {
        if (!_startedWorking) {
          BeginWorking();
        }
        
        //Rotate the character to align with their current nav target. Used to smoothly
        //align the character with their chair.
        Transform userTransform = _navigator.transform;
        Transform targetTransform = _navigator.CurrentNavTarget.transform;
        userTransform.rotation =
          Quaternion.RotateTowards(userTransform.rotation, targetTransform.rotation, Time.deltaTime * 90);
        userTransform.position = Vector3.MoveTowards(userTransform.position, targetTransform.position, Time.deltaTime);

        _lastAnimCheck += Time.deltaTime;
        if (_lastAnimCheck >= _calcAnimationDelaySeconds) {
          SetAnimation();
          _lastAnimCheck = 0;
        }  
      }
    }

    //-------------------------------------------------------------------------
    private void SetAnimation() {
      var animParams = GetAnimationParameter();
      foreach ((string key, bool value) in animParams) {
        _animator.SetBool(key, value);
      }
    }

    //-------------------------------------------------------------------------
    private IEnumerable<(string, bool)> GetAnimationParameter() {
      List<(string, bool)> anims = new List<(string, bool)>(2);
      //Logic taken from original code (iconicAI.cpp lnn 986
      int val = Random.Range(0, 60) - _user.GetCharacterData().happiness;
      val += Random.Range(0, 10) - 5;
      if (!string.IsNullOrEmpty(_angryAnimationParam)) {
        anims.Add((_angryAnimationParam, val > 0)); //sometimes angry
      }

      if (!string.IsNullOrEmpty(_workAnimationParam)) {
        anims.Add((_workAnimationParam, true)); //always working
      }

      return anims;
    }

    //--------------------------------------------------------------------------
    private void MaybeSetWorkDestination() {
      ComputerBehavior assignedComputer =
        _computerListVariable.Value.Find(x => (x.Data as ComputerDataObject).assignedUser == _user.Data.user_name);

      if (!assignedComputer) return;
      
      //find which WorkSpace this computer is assigned to.
      var ws = _workSpaceListVariable.Value[assignedComputer.Data.position];

      //From the configuration, find an empty "sittable" object.
      var sitObject = ws.FurnitureConfiguration.GetFirstAvailableSittableObject();
      //Navigate there.
      if (sitObject) {
        _user.CurrentNavTarget = sitObject.gameObject;
      }
    }
    
    //-------------------------------------------------------------------------
    private void BeginWorking() {
      if (!string.IsNullOrEmpty(_workAnimationParam)) {
        _animator.SetBool(_workAnimationParam, true);
      }

      _lastAnimCheck = 0;

      if (_startedWorkingEvent) {
        _startedWorkingEvent.Raise(_user);
      }

      //disable the NavMeshAgent's ability to position itself so we can manually control
      //it. Used to rotate the agent to line up with their current target.
      _agent.updateRotation = false;
      _agent.updatePosition = false;

      _startedWorking = true;
    }
  }
}