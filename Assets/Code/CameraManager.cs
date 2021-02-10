using UnityEngine;
using Code.Scriptable_Variables;
using Code.World_Objects;

namespace Code.Camera {
  public class CameraManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of users in the scenario")]
    [SerializeField] private UserListVariable _userList;
    [Tooltip("List of computers in the scenario")]
    [SerializeField] private ComputerListVariable _computerList;
    [Tooltip("List of devices in the scenario")]
    [SerializeField] private DeviceListVariable _deviceList;

    [Header("Cameras")]
    [Tooltip("Transform the camera is targeting")]
    public Transform cameraTarget;
    [Tooltip("Cinemachine virtual camera we are controlling")]
    public CinemachineCameraOffset cameraOffset;

    [Header("Customization")]
    [Tooltip("Scalar to apply to camera panning offset amounts")]
    public float panScalar = 0.1f;
    [Tooltip("Scalar to apply to camera rotate offset amounts")]
    public float rotateScalar = 0.1f;
    [Tooltip("Scalar to apply to camera zoom offset amounts")]
    public float zoomScalar = 1.0f;
    [Tooltip("Zoom speed multiplier")]
    public float zoomSpeed = 2.0f;
    [Tooltip("Exponential growth rate of zoom (higher it is, the faster zoom movement will happen the more zoomed out the user is")]
    public float zoomExponentialGrowthRate = 1.1f;
    [Tooltip("Closest the user can zoom in")]
    public float minZoomDistance = 1.0f;
    [Tooltip("Farthest the user can zoom out")]
    public float maxZoomDistance = 50.0f;
    [Tooltip("Starting zoom distance")]
    public float startingZoomDistance = 20.0f;

    //contains circular lists of different types of WorldObjects
    private readonly WorldObjectCircularLists _objectCircularLists = new WorldObjectCircularLists();

    private float _minZoomInterval;
    private float _maxZoomInterval;
    private float _currentZoomLevel;
    private float _desiredZoomLevel;

    // ------------------------------------------------------------------------
    void Awake() {
      _objectCircularLists.SetList(_userList.Value, WorldObjectType.User);
      _objectCircularLists.SetList(_computerList.Value, WorldObjectType.Computer);
      _objectCircularLists.SetList(_deviceList.Value, WorldObjectType.Device);

      _minZoomInterval = Mathf.Log10(minZoomDistance) / Mathf.Log10(zoomExponentialGrowthRate);
      _maxZoomInterval = Mathf.Log10(maxZoomDistance) / Mathf.Log10(zoomExponentialGrowthRate);
      _desiredZoomLevel = -startingZoomDistance;
      _currentZoomLevel = Mathf.Log10(startingZoomDistance) / Mathf.Log10(zoomExponentialGrowthRate);
      cameraOffset.m_Offset.z = _desiredZoomLevel;
    }

    // ------------------------------------------------------------------------
    void Update() {
      if (cameraOffset.m_Offset.z != _desiredZoomLevel) {
        cameraOffset.m_Offset.z = Mathf.Lerp(cameraOffset.m_Offset.z, _desiredZoomLevel, Time.deltaTime * zoomSpeed);
      }
    }

    // ------------------------------------------------------------------------
    public void PanCamera(Vector2 delta) {
      cameraTarget.Translate(new Vector3(-delta.x * panScalar, 0.0f, -delta.y * panScalar));
    }

    // ------------------------------------------------------------------------
    public void RotateCamera(Vector2 delta) {
      cameraTarget.Rotate(0.0f, delta.x * rotateScalar, 0.0f);
    }

    // ------------------------------------------------------------------------
    public void ZoomCamera(Vector2 delta) {
      ZoomCamera(-delta.y * zoomScalar);
    }

    // ------------------------------------------------------------------------
    public void MoveCameraToPreviousObject(WorldObjectType type) {
      var target =_objectCircularLists.GetPrev(type);
      if (target) {
        MoveCameraToObject(target.transform);
      }
    }
    
    //--------------------------------------------------------------------------
    public void MoveCameraToNextObject(WorldObjectType type) {
      var target =_objectCircularLists.GetNext(type);
      if (target) {
        MoveCameraToObject(target.transform);
      }
    }
    
    // ------------------------------------------------------------------------
    public void OnScenarioStarted() {
      //TODO Where should the camera start from?
      //This will auto slave the camera target to the first user. If none, try the first computer.
      var ub = _objectCircularLists.GetNext(WorldObjectType.User);
      if (ub != null) {
        MoveCameraToObject(ub.transform);
      }
      else {
        var computer = _objectCircularLists.GetNext(WorldObjectType.Computer);
        if (computer) {
          MoveCameraToObject(computer.transform);
        }
      }
    }

    // ------------------------------------------------------------------------
    private void MoveCameraToObject(Transform objectTransform) {
      cameraTarget.position = objectTransform.position;
    }

    // ------------------------------------------------------------------------
    public void ZoomCamera(float offset) {
      _currentZoomLevel = Mathf.Clamp(_currentZoomLevel + offset, _minZoomInterval, _maxZoomInterval);
      _desiredZoomLevel = -Mathf.Clamp(Mathf.Pow(zoomExponentialGrowthRate, _currentZoomLevel), minZoomDistance, maxZoomDistance);
    }
  }
}
