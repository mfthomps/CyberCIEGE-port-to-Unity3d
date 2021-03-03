using System.Collections.Generic;
using Code.Game_Events;
using Code.World_Objects.Character;
using UnityEngine;
using UnityEngine.AI;

namespace Code.World_Objects.User.AI.States {
  
  // A Fsm State that animates the character as working
  public class WorkingState : FsmState {
    [SerializeField] private Animator _animator;
    [SerializeField] private string _workAnimationParam = "Working";
    [SerializeField] private string _angryAnimationParam = "Angry";
    [SerializeField] private BaseCharacter _user;
    [SerializeField] private NavMeshAgent _agent;
    [Tooltip("The number of seconds to wait before randomly choosing a different animation")]
    [SerializeField] private float _calcAnimationDelaySeconds = 5;
    [Tooltip("The CharacterGameEvent to fire when the character has started 'working'")]
    [SerializeField] private CharacterGameEvent _startedWorkingEvent; 
    
    private double _lastAnimCheck = 0;

    //-------------------------------------------------------------------------
    public override void OnStateEnter() {
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
    }

    //-------------------------------------------------------------------------
    public override void OnStateLeave() {
      if (!string.IsNullOrEmpty(_workAnimationParam)) {
        _animator.SetBool(_workAnimationParam, false);
      }
      if (!string.IsNullOrEmpty(_angryAnimationParam)) {
        _animator.SetBool(_angryAnimationParam, false);
      }
      _lastAnimCheck = 0;
      
      //Re-enabe the ability for the NavMeshAgent to control the agent
      _agent.updateRotation = true;
      _agent.updatePosition = true;
    }
    
    //-------------------------------------------------------------------------
    private void Update() {
      //Rotate the character to align with their current nav target. Used to smoothly
      //align the character with their chair.
      Transform userTransform = _user.transform;
      Transform targetTransform = _user.CurrentNavTarget.transform;
      userTransform.rotation = Quaternion.RotateTowards(userTransform.rotation, targetTransform.rotation, Time.deltaTime * 90);
      userTransform.position = Vector3.MoveTowards(userTransform.position, targetTransform.position, Time.deltaTime);
      
      _lastAnimCheck += Time.deltaTime;
      if (_lastAnimCheck >= _calcAnimationDelaySeconds) {
        SetAnimation();
        _lastAnimCheck = 0;
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
  }
  
}