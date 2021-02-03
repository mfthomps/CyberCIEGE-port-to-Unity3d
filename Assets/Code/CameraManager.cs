using System;
using System.Collections.Generic;
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

    [Tooltip("List of computers in the scenario")]
    [SerializeField] private ComputerListVariable _computerList;
    
    [Tooltip("List of devices in the scenario")]
    [SerializeField] private DeviceListVariable _deviceList;

    private readonly CircularList<UserBehavior> _userCircList = new CircularList<UserBehavior>();
    private readonly CircularList<ComputerBehavior> _computerCircList = new CircularList<ComputerBehavior>();
    private readonly CircularList<DeviceBehavior> _deviceCircList = new CircularList<DeviceBehavior>();

    // ------------------------------------------------------------------------
    private void Awake() {
      _userCircList.SetList(_userList.Value);
      _computerCircList.SetList(_computerList.Value);
      _deviceCircList.SetList(_deviceList.Value);
    }

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
      MonoBehaviour newTargetObject = null;
      switch (type) {
        case WorldObjectType.Component:
          break;
        case WorldObjectType.Computer:
          newTargetObject = _computerCircList.GetNext();
          break;
        case WorldObjectType.Device:
          newTargetObject = _deviceCircList.GetNext();
          break;
        case WorldObjectType.User:
          newTargetObject = _userCircList.GetNext();
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

      if (newTargetObject != null) {
        cameraController.targetObject = newTargetObject.transform;
      }
    }

    // ------------------------------------------------------------------------
    public void OnScenarioStarted() {
      //TODO Where should the camera start from?
      //This will auto slave the camera target to the first user. If none, try the first computer.
      UserBehavior ub = _userCircList.GetNext();
      if (ub != null) {
        cameraController.targetObject = ub.transform;  
      }
      else {
        var computer = _computerCircList.GetNext();
        if (computer) {
          cameraController.targetObject = computer.transform;
        }
      }
    }
  }
}
