using UnityEngine;
using Code.World_Objects;

namespace Code.Test {
  public class TestOfficeUI : MonoBehaviour {
    // ------------------------------------------------------------------------
    public void SelectScene(Vector2 screenPosition) {
      Debug.Log($"Select screen at: {screenPosition}");
    }

    // ------------------------------------------------------------------------
    public void OpenContextMenu() {
      Debug.Log("Open context menu (remove this once menus.cpp is no longer necessary)");
    }

    // ------------------------------------------------------------------------
    public void PanCamera(Vector2 delta) {
      Debug.Log($"Pan camera - X: {delta.x} Y: {delta.y}");
    }

    // ------------------------------------------------------------------------
    public void RotateCamera(Vector2 delta) {
      Debug.Log($"Rotate camera - X: {delta.x} Y: {delta.y}");
    }

    // ------------------------------------------------------------------------
    public void ZoomCamera(Vector2 delta) {
      Debug.Log($"Zoom camera - X: {delta.x} Y: {delta.y}");
    }

    // ------------------------------------------------------------------------
    public void MoveCameraToObject(WorldObjectType type) {
      Debug.Log($"Move camera to next {type} type of object");
    }
  }
}
