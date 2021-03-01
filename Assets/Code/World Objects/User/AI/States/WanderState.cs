using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.AI;
using Random = UnityEngine.Random;

namespace Code.World_Objects.User.AI.States {
  // A Fsm State that randomly selects a GameObject in the scene that has 
  // the supplied Tag and sets the User's navigation target to it.
  public class WanderState : FsmState {
    [SerializeField] private Navigator _user;

    [Tooltip("The Tag of the GameObjects in the scene to randomly navigate to")]
    [Tag]
    public string objectOfInterestTag;

    [Header("Debug")]
    [SerializeField] private List<GameObject> _objectsOfInterest;

    //--------------------------------------------------------------------------
    private void Awake() {
      _objectsOfInterest = new List<GameObject>(GameObject.FindGameObjectsWithTag(objectOfInterestTag));
    }
    
    //--------------------------------------------------------------------------
    public override void OnStateEnter() {
      ValidatePaths();
      
      GameObject destinationObject = GetRandomDestination();
      _user.CurrentNavTarget = destinationObject;
    }

    //--------------------------------------------------------------------------
    private GameObject GetRandomDestination() {
      var destinationObject = _objectsOfInterest[Random.Range(0, _objectsOfInterest.Count)];
      return destinationObject;
    }
    
    //--------------------------------------------------------------------------
    //For all the objects of interest, remove the ones we can't path to.
    private void ValidatePaths() {
      for (int i = _objectsOfInterest.Count - 1; i >= 0; i--) {
        if (!CheckPath(_user.transform.position, _objectsOfInterest[i].transform.position)) {
          _objectsOfInterest.RemoveAt(i);
        }
      }
    }
    
    //--------------------------------------------------------------------------
    //Check if a complete path is possible between the source and the target.
    private static bool CheckPath(Vector3 sourcePosition, Vector3 targetPosition) {
      NavMeshPath path = new NavMeshPath();
      
      if (NavMesh.CalculatePath(sourcePosition,targetPosition, NavMesh.AllAreas, path)) {
        if (path.status == NavMeshPathStatus.PathComplete) {
          return true;
        }
      }

      return false;
    }
  }
}