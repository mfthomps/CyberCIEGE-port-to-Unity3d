using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using UnityEngine;

namespace Code.World_Objects.User.AI.States {
  // A Fsm state that gives the assigned User a navigation target of the first
  // computer that is assigned to this User.
  public class MoveToComputerState : FsmState {
    [SerializeField] private UserBehavior _user;
    [SerializeField] private ComputerListVariable _computerListVariable;
    
    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      var assignedComputer = _computerListVariable.Value.Find(x => (x.Data as ComputerDataObject).assignedUser == _user.Data.user_name);
      if (assignedComputer) {
        _user.CurrentNavTarget = assignedComputer.gameObject;
      }
    }
  }
}