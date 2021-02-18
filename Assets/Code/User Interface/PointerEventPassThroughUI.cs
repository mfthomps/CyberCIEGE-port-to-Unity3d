using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

namespace Code.User_Interface {
  // Class that fires UnityEvents on pointer events, but passes the event on to the next item behind this one
  public class PointerEventPassThroughUI : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler, IScrollHandler {
    [Header("Output Events")]
    [Tooltip("Event to fire on pointer enter")]
    public UnityEvent onPointerEnter;
    [Tooltip("Event to fire on pointer exit")]
    public UnityEvent onPointerExit;
    [Tooltip("Event to fire on pointer down")]
    public UnityEvent onPointerDown;
    [Tooltip("Event to fire on pointer up")]
    public UnityEvent onPointerUp;
    [Tooltip("Event to fire on pointer click")]
    public UnityEvent onPointerClick;

    private Coroutine _onPointerMove;
    private GameObject currentPointerEnterObject;
    private GameObject currentPointerDownObject;
    private GameObject currentDragObject;

    // ------------------------------------------------------------------------
    public void OnPointerEnter(PointerEventData data) {
      // If something else had the pointer down event, grab it so we get the pointer up and click events
      if (data.pointerPress != null) {
        data.pointerPress = gameObject;
      }
      onPointerEnter?.Invoke();
      _onPointerMove = StartCoroutine(OnPointerMove());
    }

    // ------------------------------------------------------------------------
    public void OnPointerExit(PointerEventData data) {
      onPointerExit?.Invoke();
      if (currentPointerEnterObject != null) {
        var pointerEnterHandler = currentPointerEnterObject.GetComponentInParent<IPointerExitHandler>();
        if (pointerEnterHandler != null) {
          pointerEnterHandler.OnPointerExit(data);
        }
      }
      if (_onPointerMove != null) {
        StopCoroutine(_onPointerMove);
        _onPointerMove = null;
      }
    }

    // ------------------------------------------------------------------------
    public void OnPointerDown(PointerEventData data) {
      if (currentDragObject == null) {
        currentPointerDownObject = GetObjectAtPointerPosition<IPointerDownHandler>(data);
        HandlePointerEvent<IPointerDownHandler>(currentPointerDownObject, onPointerDown, (objectToTrigger) => objectToTrigger.OnPointerDown(data));
      }
    }

    // ------------------------------------------------------------------------
    public void OnPointerUp(PointerEventData data) {
      if (currentDragObject == null) {
        HandlePointerEvent<IPointerUpHandler>(currentPointerDownObject, onPointerUp, (objectToTrigger) => objectToTrigger.OnPointerUp(data));
      }
    }

    // ------------------------------------------------------------------------
    public void OnPointerClick(PointerEventData data) {
      if (currentDragObject == null) {
        var currentClickObject = GetObjectAtPointerPosition<IPointerClickHandler>(data);
        if (currentClickObject == currentPointerDownObject) {
          HandlePointerEvent<IPointerClickHandler>(currentPointerDownObject, onPointerClick, (objectToTrigger) => objectToTrigger.OnPointerClick(data));
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnBeginDrag(PointerEventData data) {
      currentDragObject = GetObjectAtPointerPosition<IBeginDragHandler>(data);
      HandlePointerEvent<IBeginDragHandler>(currentDragObject, null, (objectToTrigger) => objectToTrigger.OnBeginDrag(data));
    }

    // ------------------------------------------------------------------------
    public void OnDrag(PointerEventData data) {
      HandlePointerEvent<IDragHandler>(currentDragObject, null, (objectToTrigger) => objectToTrigger.OnDrag(data));
    }

    // ------------------------------------------------------------------------
    public void OnEndDrag(PointerEventData data) {
      HandlePointerEvent<IEndDragHandler>(currentDragObject, null, (objectToTrigger) => objectToTrigger.OnEndDrag(data));
      currentDragObject = null;
    }

    // ------------------------------------------------------------------------
    public void OnScroll(PointerEventData data) {
      var currentScrollObject = GetObjectAtPointerPosition<IScrollHandler>(data);
      HandlePointerEvent<IScrollHandler>(currentScrollObject, null, (objectToTrigger) => objectToTrigger.OnScroll(data));
    }

    // ------------------------------------------------------------------------
    private IEnumerator OnPointerMove() {
      var currentPointerData = GetCurrentPointerData();
      var previousPointerEnterObject = GetObjectAtPointerPosition<IPointerEnterHandler>(currentPointerData);
      if (previousPointerEnterObject != null) {
        previousPointerEnterObject.GetComponentInParent<IPointerEnterHandler>().OnPointerEnter(currentPointerData);
      }

      currentPointerEnterObject = null;
      while (true) {
        // Figure out what UI object the mouse is over now
        currentPointerData = GetCurrentPointerData();
        currentPointerEnterObject = GetObjectAtPointerPosition<IPointerEnterHandler>(currentPointerData);

        // If we the mouse is over a different object, then change the previous pointer objects
        if (previousPointerEnterObject != currentPointerEnterObject) {
          // If we had a previous pointer enter object, make sure pointer exit gets handled appropriately
          if (previousPointerEnterObject != null) {
            var pointerExitHandler = previousPointerEnterObject.GetComponentInParent<IPointerExitHandler>();
            if (pointerExitHandler != null) {
              pointerExitHandler.OnPointerExit(currentPointerData);
            }
          }

          // If we have an object the pointer is currently over, then handle the pointer enter event
          if (currentPointerEnterObject != null) {
            var pointerEnterHandler = currentPointerEnterObject.GetComponentInParent<IPointerEnterHandler>();
            if (pointerEnterHandler != null) {
              pointerEnterHandler.OnPointerEnter(currentPointerData);
            }
          }

          // Swap the last object we PointerEntered on
          previousPointerEnterObject = currentPointerEnterObject;
        }

        yield return null;
      }
    }

    // ------------------------------------------------------------------------
    private void HandlePointerEvent<T>(GameObject gameObject, UnityEvent eventToFire, Action<T> eventCallback) where T : IEventSystemHandler {
      // Fire a UnityEvent for the pointer click
      eventToFire?.Invoke();

      // Pass-through click event to all IPointerClickHandler components
      if (gameObject != null) {
        var objectToTrigger = gameObject.GetComponentInParent<T>();
        if (objectToTrigger != null) {
          eventCallback(objectToTrigger);
        }
      }
    }

    // ------------------------------------------------------------------------
    private GameObject GetParentObjectWithComponent<T>(GameObject currentObject) {
      while (currentObject != null) {
        var component = currentObject.GetComponent<T>();
        if (component != null) {
          return currentObject;
        }
        currentObject = currentObject.transform.parent?.gameObject;
      }
      return null;
    }

    // ------------------------------------------------------------------------
    private GameObject GetObjectAtPointerPosition<T>(PointerEventData data) where T : IEventSystemHandler {
      var results = new List<RaycastResult>();
      EventSystem.current.RaycastAll(data, results);
      foreach (var res in results) {
        // Don't trigger ourselves or we get stuck in an infinite loop
        if (res.gameObject.GetComponentInParent<PointerEventPassThroughUI>() != this) {
          // If there's another pointer click handler, trigger them and only them
          var objectToTrigger = res.gameObject.GetComponentInParent<T>();
          if (objectToTrigger != null) {
            return res.gameObject;
          }
        }
      }
      return null;
    }

    // ------------------------------------------------------------------------
    private PointerEventData GetCurrentPointerData() {
      var data = new PointerEventData(EventSystem.current);
      data.position = Input.mousePosition;
      return data;
    }
  }
}
