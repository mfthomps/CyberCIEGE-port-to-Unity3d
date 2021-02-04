using UnityEngine;
using UltimateCameraController.Cameras.Controllers;
using Code.Scriptable_Variables;
using Code.World_Objects;

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

    //contains circular lists of different types of WorldObjects
    private readonly WorldObjectCircularLists _objectCircularLists = new WorldObjectCircularLists();

    // ------------------------------------------------------------------------
    private void Awake() {
      _objectCircularLists.SetList(_userList.Value, WorldObjectType.User);
      _objectCircularLists.SetList(_computerList.Value, WorldObjectType.Computer);
      _objectCircularLists.SetList(_deviceList.Value, WorldObjectType.Device);
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
    public void MoveCameraToPreviousObject(WorldObjectType type) {
      var target =_objectCircularLists.GetPrev(type);
      if (target) {
        cameraController.targetObject = target.transform;
      }
    }
    
    //--------------------------------------------------------------------------
    public void MoveCameraToNextObject(WorldObjectType type) {
      var target =_objectCircularLists.GetNext(type);
      if (target) {
        cameraController.targetObject = target.transform;
      }
    }
    
    // ------------------------------------------------------------------------
    public void OnScenarioStarted() {
      //TODO Where should the camera start from?
      //This will auto slave the camera target to the first user. If none, try the first computer.
      var ub = _objectCircularLists.GetNext(WorldObjectType.User);
      if (ub != null) {
        cameraController.targetObject = ub.transform;  
      }
      else {
        var computer = _objectCircularLists.GetNext(WorldObjectType.Computer);
        if (computer) {
          cameraController.targetObject = computer.transform;
        }
      }
    }
  }
}
