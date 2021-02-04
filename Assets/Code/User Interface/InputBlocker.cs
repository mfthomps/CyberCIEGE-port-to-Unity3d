using UnityEngine;
using UnityEngine.EventSystems;

namespace Code.User_Interface {
  // This class doesn't do anything except eat all UI types of input possible
  public class InputBlocker : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler, IScrollHandler {
    // ------------------------------------------------------------------------
    public void OnPointerEnter(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnPointerExit(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnPointerDown(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnPointerUp(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnPointerClick(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnBeginDrag(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnDrag(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnEndDrag(PointerEventData data) {
    }

    // ------------------------------------------------------------------------
    public void OnScroll(PointerEventData data) {
    }
  }
}
