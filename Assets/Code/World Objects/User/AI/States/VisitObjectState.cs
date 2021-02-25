using Code.Scriptable_Variables;
using Code.World_Objects.Character;
using UnityEngine;

namespace Code.World_Objects.User.AI.States {
  public class VisitObjectState : FsmState {
    [SerializeField] private BaseCharacter _character;
    [SerializeField] private UserListVariable _users;
    [SerializeField] private ComputerListVariable _computers;

    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      var targetStr = _character.GetData().Visiting;
      if (string.IsNullOrEmpty(targetStr)) return;

      //Get which GameObject this is
      _character.CurrentNavTarget = GetTarget(targetStr);
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