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
        currentPointerDownObject = data.pointerPress;
        data.pointerPress = gameObject;
      }
      onPointerEnter?.Invoke();
      _onPointerMove = StartCoroutine(OnPointerMove());
    }

    // ------------------------------------------------------------------------
    public void OnPointerExit(PointerEventData data) {
      onPointerExit?.Invoke();
      CallPointerExits(currentPointerEnterObject, data);
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
        if (IsChildOf(currentClickObject, currentPointerDownObject)) {
          HandlePointerEvent<IPointerClickHandler>(currentPointerDownObject, onPointerClick, (objectToTrigger) => objectToTrigger.OnPointerClick(data));
        }
        else if (currentPointerDownObject == null) {
          onPointerClick?.Invoke();
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
      CallPointerEnters(previousPointerEnterObject, currentPointerData);

      currentPointerEnterObject = null;
      while (true) {
        // Figure out what UI object the mouse is over now
        currentPointerData = GetCurrentPointerData();
        currentPointerEnterObject = GetObjectAtPointerPosition<IPointerEnterHandler>(currentPointerData);

        // If we the mouse is over a different object, then change the previous pointer objects
        if (previousPointerEnterObject != currentPointerEnterObject) {
          // If we had a previous pointer enter object, make sure pointer exit gets handled appropriately
          CallPointerExits(previousPointerEnterObject, currentPointerData);

          // If we have an object the pointer is currently over, then handle the pointer enter event
          CallPointerEnters(currentPointerEnterObject, currentPointerData);

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
        var objectsToTrigger = gameObject.GetComponentsInParent<T>();
        foreach (var objectToTrigger in objectsToTrigger) {
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

    // ------------------------------------------------------------------------
    private void CallPointerEnters(GameObject gameObject, PointerEventData eventData) {
      if (gameObject != null) {
        var pointerEnterHandlers = gameObject.GetComponentsInParent<IPointerEnterHandler>();
        foreach (var pointerEnterHandler in pointerEnterHandlers) {
          pointerEnterHandler.OnPointerEnter(eventData);
        }
      }
    }

    // ------------------------------------------------------------------------
    private void CallPointerExits(GameObject gameObject, PointerEventData eventData) {
      if (gameObject != null) {
        var pointerExitHandlers = gameObject.GetComponentsInParent<IPointerExitHandler>();
        foreach (var pointerExitHandler in pointerExitHandlers) {
          pointerExitHandler.OnPointerExit(eventData);
        }
      }
    }

    // ------------------------------------------------------------------------
    private bool IsChildOf(GameObject gameObject1, GameObject gameObject2) {
      if (gameObject1 != null && gameObject2 != null) {
        return gameObject1.transform.IsChildOf(gameObject2.transform);
      }
      return false;
    }
  }
}
