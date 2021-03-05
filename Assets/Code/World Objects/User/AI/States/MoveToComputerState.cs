using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using UnityEngine;

namespace Code.World_Objects.User.AI.States {
  // A Fsm state that gives the assigned User a navigation target of the first
  // computer that is assigned to this User.
  public class MoveToComputerState : FsmState {
    [SerializeField] private UserBehavior _user;
    [SerializeField] private ComputerListVariable _computerListVariable;
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;
    
    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      ComputerBehavior assignedComputer = _computerListVariable.Value.Find(x => (x.Data as ComputerDataObject).assignedUser == _user.Data.user_name);
      if (assignedComputer) {
        //find which WorkSpace this computer is assigned to.
        var ws = _workSpaceListVariable.Value[assignedComputer.Data.position];

        //From the configuration, find an empty "sittable" object.
        var sitObject = ws.FurnitureConfiguration.GetFirstAvailableSittableObject();
        //Navigate there.
        if (sitObject) {
          _user.CurrentNavTarget = sitObject.gameObject;
        }
      }
    }
  }
}