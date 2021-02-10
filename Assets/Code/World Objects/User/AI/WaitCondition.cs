using UnityEngine;

namespace Code.World_Objects.User.AI {
  //A Fsm Condition that waits for the supplied amount of seconds
  public class WaitCondition : FsmCondition {
    [Tooltip("How  many seconds to wait before this condition becomes true")]
    [SerializeField] private float waitAmount = 1;
    
    private float accumTime;
    private bool startTheClock = false;
    
    //--------------------------------------------------------------------------
    public override bool IsSatisfied(FsmState curr, FsmState next) {
      if (!startTheClock) {startTheClock = true;}

      if (accumTime >= waitAmount) {
        accumTime = 0f;
        startTheClock = false;
        return true;
      }
      
      return false;
    }

    //--------------------------------------------------------------------------
    private void Update() {
      if (startTheClock) {
        accumTime += Time.deltaTime;
      }
    }
  }
}