using UnityEngine;
using UltimateCameraController.Cameras.Controllers;
using Code.World_Objects;

namespace Code.Camera {
  public class CameraManager : MonoBehaviour {
    [Tooltip("The Camera controller we are managing")]
    public CameraController cameraController;
    [Tooltip("The Camera zoom we are managing")]
    public CameraZoom cameraZoom;

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
          newTargetObject = ComponentBehavior.GetNextComponent().transform;
          break;
        case WorldObjectType.Computer:
          newTargetObject = ComputerBehavior.GetNextComponent().transform;
          break;
        case WorldObjectType.Device:
          newTargetObject = DeviceBehavior.GetNextComponent().transform;
          break;
        case WorldObjectType.User:
          newTargetObject = UserBehavior.GetNextUser().transform;
          break;
      }

      cameraController.targetObject = newTargetObject;
    }
  }
}
