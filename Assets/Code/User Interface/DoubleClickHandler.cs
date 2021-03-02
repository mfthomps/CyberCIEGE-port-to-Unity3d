using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

namespace Code.User_Interface {
  public class DoubleClickHandler : MonoBehaviour, IPointerClickHandler {
    [Header("Output Events")]
    [Tooltip("Fires when this component is clicked")]
    public UnityEvent onClick;
    [Tooltip("Fires when this component is double clicked")]
    public UnityEvent onDoubleClick;

    // ------------------------------------------------------------------------
    public void OnPointerClick(PointerEventData data) {
      if (!data.dragging) {
        switch (data.button) {
          case PointerEventData.InputButton.Left:
            if (data.clickCount == 1) {
              onClick?.Invoke();
            }
            else if (data.clickCount > 1) {
              onDoubleClick?.Invoke();
            }
            break;
        }
      }
    }
  }
}
