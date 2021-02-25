using Code.World_Objects.Character;
using UnityEngine;

namespace Code.World_Objects.User.AI.Conditions {
  public class ShouldVisitObject : FsmCondition {
    [SerializeField] private BaseCharacter _character;
    
    public override bool IsSatisfied(FsmState curr, FsmState next) {
      return !string.IsNullOrEmpty(_character.GetData().Visiting);
    }
  }
}