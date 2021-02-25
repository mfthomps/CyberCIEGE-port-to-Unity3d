using Code.World_Objects.Character;
using UnityEngine;

namespace Code.World_Objects.User.AI.Conditions {
  //Used as as FSM Condition to decide if a Character should be visiting another world object
  public class ShouldVisitObject : FsmCondition {
    [SerializeField] private BaseCharacter _character;
    
    public override bool IsSatisfied(FsmState curr, FsmState next) {
      return !string.IsNullOrEmpty(_character.GetCharacterData().Visiting);
    }
  }
}