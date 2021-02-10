using UnityEngine;

namespace Code.World_Objects.User.AI {
  //A Fsm condition to check if the User has a valid navigation target
  public class HasDestinationCondition : FsmCondition {
    [SerializeField] private UserBehavior _user;
    
    //-------------------------------------------------------------------------
    public override bool IsSatisfied(FsmState curr, FsmState next) {
      return _user.CurrentNavTarget;
    }
  }
}