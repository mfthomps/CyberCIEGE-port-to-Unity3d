using UnityEngine;

namespace Code.World_Objects.User.AI {
  
  //A Fsm condition to check if the supplied User is at their navigate target
  public class AtLocationCondition : FsmCondition {
    [SerializeField] private UserBehavior _user;
    
    [Tooltip("How much distance tolerance when comparing locations")]
    [SerializeField] private float tolerance = 1f;
    
    //-------------------------------------------------------------------------
    public override bool IsSatisfied(FsmState curr, FsmState next) {
      if (!_user.CurrentNavTarget) {
        return false;
      }
      
      if (Vector3.Distance(transform.position, _user.CurrentNavTarget.transform.position) < tolerance) {
        _user.CurrentNavTarget = null;
        return true;
      }
      else {
        return false;
      }
    }
  }
}