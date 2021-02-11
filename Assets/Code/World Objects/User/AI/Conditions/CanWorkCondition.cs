using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using UnityEngine;

namespace Code.World_Objects.User.AI.Conditions {
  //a Fsm Condition to check if the supplied User has the ability to work or not
  public class CanWorkCondition : FsmCondition {
    [SerializeField] private ComputerListVariable _computerListVariable;
    [SerializeField] private UserBehavior _user;
    
    private ComputerBehavior _assignedComputer;

    //-------------------------------------------------------------------------
    private void Start() {
      _computerListVariable.OnValueChanged += ComputerListVariableOnOnValueChanged;
      ComputerListVariableOnOnValueChanged();
    }
    
    //-------------------------------------------------------------------------
    private void OnDestroy() {
      _computerListVariable.OnValueChanged -= ComputerListVariableOnOnValueChanged;
    }
    
    //-------------------------------------------------------------------------
    public override bool IsSatisfied(FsmState curr, FsmState next) {
      return CanWork();
    }

    //-------------------------------------------------------------------------
    private void ComputerListVariableOnOnValueChanged() {
      _assignedComputer =
        _computerListVariable.Value.Find(x => (x.Data as ComputerDataObject).assignedUser == _user.Data.user_name);
    }
    
    //-------------------------------------------------------------------------
    private bool CanWork() {
      bool canWork = _assignedComputer != null;
      return canWork;
    }
  }
}