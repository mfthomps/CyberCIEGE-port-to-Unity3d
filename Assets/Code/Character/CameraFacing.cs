using UnityEngine;

namespace Code.Character {
  public class CameraFacing : MonoBehaviour {
    private UnityEngine.Camera _mainCamera;

    [SerializeField] private Transform centerOfMass;
    public float verticalOffset = 1f;

    private void Start() {
      _mainCamera = UnityEngine.Camera.main;
    }

    private void Update() {
      // look at the camera
      this.transform.LookAt(_mainCamera.transform);
      // apply vertical offset
      this.transform.localPosition = centerOfMass.localPosition + new Vector3(0f, verticalOffset, 0f);
    }
  }
}