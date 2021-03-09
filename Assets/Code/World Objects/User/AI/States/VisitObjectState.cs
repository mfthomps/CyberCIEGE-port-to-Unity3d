using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.World_Objects.Character;
using UnityEngine;

namespace Code.World_Objects.User.AI.States {
  //A state the just sets the Character's navigate target equal to the
  //GameObject corresponding to it's "visiting" field.
  public class VisitObjectState : NavigateState {
    [SerializeField] private BaseCharacter _character;
    [SerializeField] private UserListVariable _users;
    [SerializeField] private ComputerListVariable _computers;
    
    [Tooltip("The CharacterGameEvent to fire when the character has started 'visiting'")] 
    [SerializeField]
    private CharacterGameEvent _startedVisitingEvent;

    private bool _isVisiting = false;
    
    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      base.OnStateEnter();
      _isVisiting = false;
      
      var targetStr = _character.GetCharacterData().Visiting;
      if (string.IsNullOrEmpty(targetStr)) return;

      //Get which GameObject this is
      _character.CurrentNavTarget = GetTarget(targetStr);
    }

    //--------------------------------------------------------------------------
    protected override void Update() {
      base.Update();
      
      if (IsAtDestination()) {
        if (!_isVisiting) {
          _isVisiting = true;
          StopWalking();
          _startedVisitingEvent?.Raise(_character);
        }  
      }
    }

    //--------------------------------------------------------------------------
    private GameObject GetTarget(string targetStr) {
      var user = _users.Value.Find(x => x.Data.user_name == targetStr);
      if (user) {
        return user.gameObject;
      }

      var computer = _computers.Value.Find(x => x.Data.component_name == targetStr);
      if (computer) {
        return computer.gameObject;
      }

      return null;
    }
  }
}