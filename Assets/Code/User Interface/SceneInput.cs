using UnityEngine;
using UnityEngine.EventSystems;
using Shared.ScriptableVariables;

namespace Code.User_Interface {
  // Routes Unity input into various GameEvents so there is one place in charge of handling it all
  public class SceneInput : MonoBehaviour, IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler, IScrollHandler {
    [Header("Output Events")]
    [Tooltip("Fired when a left click happens")]
    public Vector2GameEvent sceneLeftClick;
    [Tooltip("Fired when a right click happens")]
    public Vector2GameEvent sceneRightClick;
    [Tooltip("Fired when a left click drag happens")]
    public Vector2GameEvent sceneLeftDrag;
    [Tooltip("Fired when a right click drag happens")]
    public Vector2GameEvent sceneRightDrag;
    [Tooltip("Fired when a scroll happens")]
    public Vector2GameEvent sceneScroll;

    // ------------------------------------------------------------------------
    public void OnPointerClick(PointerEventData data) {
      if (!data.dragging) {
        switch (data.button) {
          case PointerEventData.InputButton.Left:
            sceneLeftClick?.Raise(data.pressPosition);
            break;
          case PointerEventData.InputButton.Right:
            sceneRightClick?.Raise(data.pressPosition);
            break;
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnBeginDrag(PointerEventData data) {
      // Empty implementation just so the PointerEventPassThrough system works
      // with this one
    }

    // ------------------------------------------------------------------------
    public void OnDrag(PointerEventData data) {
      switch (data.button) {
        case PointerEventData.InputButton.Left:
          sceneLeftDrag?.Raise(data.delta);
          break;
        case PointerEventData.InputButton.Right:
          sceneRightDrag?.Raise(data.delta);
          break;
      }
    }

    // ------------------------------------------------------------------------
    public void OnEndDrag(PointerEventData data) {
      // Empty implementation just so the PointerEventPassThrough system works
      // with this one
    }

    // ------------------------------------------------------------------------
    public void OnScroll(PointerEventData data) {
      sceneScroll?.Raise(data.scrollDelta);
    }
  }
}
