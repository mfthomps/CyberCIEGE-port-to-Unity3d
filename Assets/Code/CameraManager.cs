using System;
using UnityEngine;
using UltimateCameraController.Cameras.Controllers;
using Code.Scriptable_Variables;
using Code.World_Objects;
using Code.World_Objects.User;

namespace Code.Camera {
  public class CameraManager : MonoBehaviour {
    [Tooltip("The Camera controller we are managing")]
    public CameraController cameraController;
    [Tooltip("The Camera zoom we are managing")]
    public CameraZoom cameraZoom;
    [Tooltip("List of users in the scenario")]
    [SerializeField] private UserListVariable _userList;

    private UserBehavior _currentUserFocus;

    // ------------------------------------------------------------------------
    public void PanCamera(Vector2 delta) {
      Debug.Log($"Pan camera - X: {delta.x} Y: {delta.y}");
    }

    // ------------------------------------------------------------------------
    public void RotateCamera(Vector2 delta) {
      cameraController.OrbitCamera(delta);
    }

    // ------------------------------------------------------------------------
    public void ZoomCamera(Vector2 delta) {
      cameraZoom.ChangeZoom(delta.y);
    }

    // ------------------------------------------------------------------------
    public void MoveCameraToObject(WorldObjectType type) {
      Transform newTargetObject = null;
      switch (type) {
        case WorldObjectType.Component:
          break;
        case WorldObjectType.Computer:
          //newTargetObject = ComputerBehavior.GetNextComponent().transform;
          //TODO
          break;
        case WorldObjectType.Device:
          //newTargetObject = DeviceBehavior.GetNextComponent().transform;
          //TODO
          break;
        case WorldObjectType.User:
          newTargetObject = GetNextUser().transform;
          break;
        case WorldObjectType.Asset:
          break;
        case WorldObjectType.Staff:
          break;
        case WorldObjectType.Workspace:
          break;
        case WorldObjectType.Zone:
          break;
        default:
          throw new ArgumentOutOfRangeException(nameof(type), type, null);
      }

      if (newTargetObject) {
        cameraController.targetObject = newTargetObject;
      }
    }

    // ------------------------------------------------------------------------
    public void OnScenarioStarted() {
      //TODO Where should the camera start from?
      //This will auto slave the camera target to the first user. If none, try the first component.
      UserBehavior ub = GetNextUser();
      if (ub != null) {
        cameraController.targetObject = ub.transform;  
      }
      else {
        //TODO
        // var component = ComponentBehavior.GetNextComponent();
        // if (component != null) {
        //   cameraController.targetObject = component.transform;
        // }
      }
    }

    // ------------------------------------------------------------------------
    private UserBehavior GetNextUser() {
      UserBehavior first_user = null;
      bool gotit = false;
      foreach (var user in _userList.Value) {
        if (!user.IsActiveUser())
          continue;
        if (gotit) {
          _currentUserFocus = user;
          return user;
        }

        if (first_user == null)
          first_user = user;
        if (_currentUserFocus == null) {
          _currentUserFocus = user;
          return user;
        }

        if (user == _currentUserFocus)
          gotit = true;
      }

      _currentUserFocus = first_user;
      return first_user;
    }
  }
}
