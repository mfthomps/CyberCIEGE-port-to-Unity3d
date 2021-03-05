using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;
using Code.User_Interface.View;
using Code.World_Objects;
using Code.World_Objects.Character;

namespace Code.Camera {
  //This uses two Transforms to position and orient the game camera.
  public class CameraManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of computers in the scenario")]
    [SerializeField] private ComputerListVariable _computerList;
    [Tooltip("List of devices in the scenario")]
    [SerializeField] private DeviceListVariable _deviceList;
    [Tooltip("List of staff in the scenario")]
    [SerializeField] private StaffListVariable _staffList;
    [Tooltip("List of users in the scenario")]
    [SerializeField] private UserListVariable _userList;
    [Tooltip("List of ViewPoints in the scenario")]
    [SerializeField] private ViewPointListVariable _viewPointList;
    [Tooltip("List of ViewPoints that represent the different buildings available.")]
    [SerializeField] private ViewPointListVariable _buildingList;
    [Tooltip("The variable that contains the ViewPoint options, defined in the viewpoints.sdf file")]
    [SerializeField] private ViewPointOptions _viewPointOptions;
    [Tooltip("Whether the game is currently paused or not")]
    [SerializeField] private BooleanVariable _gamePaused;

    [Header("Output Events/Variables")]
    [Tooltip("Whether we want to pause the game or not")]
    [SerializeField] private BooleanGameEvent _pauseGame;
    [Tooltip("Name of the current building the camera is located in.")]
    [SerializeField] private StringVariable _currentBuilding;
    [Tooltip("The current view type we have selected")]
    public ViewTypeVariable currentViewType;
    [Tooltip("Currently selected object in game to show properties for")]
    [SerializeField] private GameObjectVariable _selectedObject;

    [Header("Cameras")]
    [Tooltip("Transform the camera is targeting")]
    public Transform cameraTarget;
    [Tooltip("Transform the camera is following (attached to)")]
    public Transform cameraFollow;
    [Tooltip("The Transform of the actual Camera (for calculating the screen dragging translations)")]
    public Transform _cameraTransform;

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
    [SerializeField] private float _currentZoomLevel;
    [SerializeField] private float _desiredZoomLevel;
    private Transform _cameraFollowTarget;
    private bool _waitingForServerPause;

    // ------------------------------------------------------------------------
    void Awake() {
      _objectCircularLists.SetList(_userList.Value, WorldObjectType.User);
      _objectCircularLists.SetList(_computerList.Value, WorldObjectType.Computer);
      _objectCircularLists.SetList(_deviceList.Value, WorldObjectType.Device);
      _objectCircularLists.SetList(_viewPointList.Value, WorldObjectType.ViewPoint);
      _objectCircularLists.SetList(_buildingList.Value, WorldObjectType.Building);

      _minZoomInterval = Mathf.Log10(minZoomDistance) / Mathf.Log10(zoomExponentialGrowthRate);
      _maxZoomInterval = Mathf.Log10(maxZoomDistance) / Mathf.Log10(zoomExponentialGrowthRate);
      _desiredZoomLevel = -startingZoomDistance;
      _currentZoomLevel = Mathf.Log10(startingZoomDistance) / Mathf.Log10(zoomExponentialGrowthRate);
    }

    // ------------------------------------------------------------------------
    void Update() {
      //The desired position the follow camera should be at. Based on the distance
      //behind the target camera.
      var desiredFollowPos = cameraTarget.position + (cameraTarget.forward * _desiredZoomLevel);

      if (cameraFollow.position != desiredFollowPos) {
        //smooth the camera zooming
        cameraFollow.position = Vector3.Lerp(cameraFollow.position, desiredFollowPos, Time.deltaTime * zoomSpeed);
      }

      // If the game is running and we have a camera follow target, then follow that target
      if (_cameraFollowTarget != null && !_waitingForServerPause && !_gamePaused.Value) {
        MoveCameraTarget(_cameraFollowTarget);
      }

      // Since it takes a bit to get the server response that the game is paused,
      // if we paused the game we want to stop following our target in that interim
      if (_waitingForServerPause && _gamePaused.Value) {
        _waitingForServerPause = false;
      }
    }

    // ------------------------------------------------------------------------
    public void PanCamera(Vector2 delta) {
      PauseIfFollowing();

      //tweak the pan amount based on the current zoom level. Closer = slower pan, further = faster
      float percZoom = (_currentZoomLevel - _minZoomInterval) / (_maxZoomInterval - _minZoomInterval);
      float zoomAdj = Math.Max(percZoom, 0.1f);

      //move both the target camera and the follow camera by the same amount, based
      //on the camera's perspective.
      var right = _cameraTransform.right * -delta.x * panScalar * zoomAdj;
      var fwd = _cameraTransform.forward * -delta.y * panScalar * zoomAdj;
      var translation = right + fwd;
      translation.y = 0; //panning shouldn't affect the camera's up/down
      cameraTarget.Translate(translation, Space.World);
      cameraFollow.Translate(translation, Space.World);
    }

    // ------------------------------------------------------------------------
    public void RotateCamera(Vector2 delta) {
      PauseIfFollowing();

      cameraTarget.Rotate(0.0f, delta.x * rotateScalar, 0.0f, Space.World);
      cameraFollow.transform.RotateAround(cameraTarget.transform.position, Vector3.up, delta.x * rotateScalar);
    }

    // ------------------------------------------------------------------------
    public void ZoomCamera(Vector2 delta) {
      ZoomCamera(-delta.y * zoomScalar);
    }
    
    // ------------------------------------------------------------------------
    public void ZoomCamera(float offset) {
      PauseIfFollowing();

      _currentZoomLevel = Mathf.Clamp(_currentZoomLevel + offset, _minZoomInterval, _maxZoomInterval);
      _desiredZoomLevel = -Mathf.Clamp(Mathf.Pow(zoomExponentialGrowthRate, _currentZoomLevel), minZoomDistance, maxZoomDistance);
    }

    // ------------------------------------------------------------------------
    public void MoveCameraToPreviousObject(WorldObjectType type) {
      PauseIfFollowing();

      var newTarget = _objectCircularLists.GetPrev(type);
      MoveCamera(type, newTarget);
      _selectedObject.Value = newTarget.gameObject;
    }
    
    //--------------------------------------------------------------------------
    public void MoveCameraToNextObject(WorldObjectType type) {
      PauseIfFollowing();

      var newTarget = _objectCircularLists.GetNext(type);
      MoveCamera(type, newTarget);
      _selectedObject.Value = newTarget.gameObject;
    }

    // ------------------------------------------------------------------------
    public void OnScenarioStarted() {
      //Move to the first ViewPoint, if there is one
      var viewPoint = _objectCircularLists.GetNext(WorldObjectType.ViewPoint);
      if (viewPoint) {
        MoveCameraToViewPoint(viewPoint as ViewPoint.ViewPoint);
      }
      // If we don't have a starting viewpoint, then try moving to a user
      else {
        var ub = _objectCircularLists.GetNext(WorldObjectType.User);
        if (ub != null) {
          MoveCameraTarget(ub.transform);
        }
        // If we don't have a user to move to, then try to find a computer
        else {
          var computer = _objectCircularLists.GetNext(WorldObjectType.Computer);
          if (computer) {
            MoveCameraTarget(computer.transform);
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    public void MoveCameraToUser(string serverMessage) {
      StringReader xmlreader = new StringReader(serverMessage);
      XmlDocument xml_doc = new XmlDocument();
      try {
        xml_doc.Load(xmlreader);
      }
      catch (XmlException  e) {
        Debug.LogError($"cameraToUser xml contains an error: {serverMessage}. {e}");
      }
      
      XmlNode mainNode = xml_doc.SelectSingleNode("//cameraToUser");
      var username = mainNode["name"].InnerText;
      var characters = new List<BaseCharacter>(_userList.Value);
      characters.AddRange(_staffList.Value);
      foreach (var character in characters) {
        if (character.GetCharacterData().user_name == username) {
          MoveCameraTarget(character.transform);
          if (_viewPointOptions.ForceCamera) {
            _cameraFollowTarget = character.transform;
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    public void MoveCameraToSelected() {
      if (_selectedObject.Value != null && _selectedObject.Value.activeSelf) {
        // Make sure the office view is visible
        currentViewType.SetView(ViewType.Office);
        MoveCameraTarget(_selectedObject.Value.transform);
      }
    }

    //--------------------------------------------------------------------------
    private void MoveCamera(WorldObjectType type, BaseWorldObject target) {
      if (!target) return;

      switch (type) {
        case WorldObjectType.Asset:
        case WorldObjectType.Computer:
        case WorldObjectType.Device:
        case WorldObjectType.Staff:
        case WorldObjectType.User:
          MoveCameraTarget(target.transform);
          break;
        case WorldObjectType.ViewPoint: {
          ViewPoint.ViewPoint vp = (ViewPoint.ViewPoint) target;
          if (!vp.Data.SkipTab) {
            MoveCameraToViewPoint(vp);
          }
        }
          break;
        case WorldObjectType.Building: {
          ViewPoint.ViewPoint vp = (ViewPoint.ViewPoint) target;
          MoveCameraToViewPoint(vp);
        }
          break;
        case WorldObjectType.Workspace:
        case WorldObjectType.Component:
        case WorldObjectType.Zone:
        default:
          throw new ArgumentOutOfRangeException(nameof(type), type, null);
      }
    }

    //--------------------------------------------------------------------------
    //Move and align the camera to the supplied ViewPoint. Calculate the zoom settings
    //for the next Player camera control.
    private void MoveCameraToViewPoint(ViewPoint.ViewPoint viewPoint) {
      cameraTarget.transform.SetPositionAndRotation(viewPoint.To.position, viewPoint.To.rotation);
      cameraFollow.transform.SetPositionAndRotation(viewPoint.From.position, viewPoint.From.rotation);
      _desiredZoomLevel = -Vector3.Distance(viewPoint.From.position, viewPoint.To.position);
      _currentZoomLevel = Mathf.Log10(-_desiredZoomLevel) / Mathf.Log10(zoomExponentialGrowthRate);
      _currentBuilding.Value = viewPoint.Data.Site;
    }
    
    // ------------------------------------------------------------------------
    private void MoveCameraTarget(Transform objectTransform) {
      cameraTarget.position = objectTransform.position;
    }

    // ------------------------------------------------------------------------
    private void PauseIfFollowing() {
      // If we're following a target and the game isn't paused, pause it
      if (_cameraFollowTarget != null && !_gamePaused.Value) {
        _pauseGame?.Raise(true);
        _waitingForServerPause = true;
      }
    }
  }
}
