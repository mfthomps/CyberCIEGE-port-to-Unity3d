using NaughtyAttributes;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Code.World_Objects.User.AI.States {
  // A Fsm State that randomly selects a GameObject in the scene that has 
  // the supplied Tag and sets the User's navigation target to it.
  public class WanderState : FsmState {
    [SerializeField] private UserBehavior _user;

    [Tooltip("The Tag of the GameObjects in the scene to randomly navigate to")]
    [Tag]
    public string objectOfInterestTag;

    private GameObject[] _objectsOfInterest;

    //--------------------------------------------------------------------------
    private void Awake() {
      _objectsOfInterest = GameObject.FindGameObjectsWithTag(objectOfInterestTag);
    }

    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      var index = Random.Range(0, _objectsOfInterest.Length);
      _user.CurrentNavTarget = _objectsOfInterest[index];
    }
  }
}