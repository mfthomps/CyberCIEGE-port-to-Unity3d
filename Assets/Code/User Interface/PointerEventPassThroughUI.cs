using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

namespace Code.User_Interface {
  // Class that fires UnityEvents on pointer events, but passes the event on to the next item behind this one
  public class PointerEventPassThroughUI : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler {
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

    // ------------------------------------------------------------------------
    public void OnPointerEnter(PointerEventData data) {
      onPointerEnter?.Invoke();
      _onPointerMove = StartCoroutine(OnPointerMove());
    }

    // ------------------------------------------------------------------------
    public void OnPointerExit(PointerEventData data) {
      HandlePointerEvent<IPointerExitHandler>(data, onPointerExit, (objectToTrigger) => objectToTrigger.OnPointerExit(data));
      StopCoroutine(_onPointerMove);
    }

    // ------------------------------------------------------------------------
    public void OnPointerDown(PointerEventData data) {
      HandlePointerEvent<IPointerDownHandler>(data, onPointerDown, (objectToTrigger) => objectToTrigger.OnPointerDown(data));
    }

    // ------------------------------------------------------------------------
    public void OnPointerUp(PointerEventData data) {
      HandlePointerEvent<IPointerUpHandler>(data, onPointerUp, (objectToTrigger) => objectToTrigger.OnPointerUp(data));
    }

    // ------------------------------------------------------------------------
    public void OnPointerClick(PointerEventData data) {
      HandlePointerEvent<IPointerClickHandler>(data, onPointerClick, (objectToTrigger) => objectToTrigger.OnPointerClick(data));
    }

    // ------------------------------------------------------------------------
    private IEnumerator OnPointerMove() {
      GameObject previousPointerEnterObject = null, currentPointerEnterObject = null;
      while (true) {
        // Figure out what UI object the mouse is over now
        var currentPointerData = new PointerEventData(EventSystem.current);
        currentPointerData.position = Input.mousePosition;
        var results = new List<RaycastResult>();
        EventSystem.current.RaycastAll(currentPointerData, results);
        foreach (var res in results) {
          var hitGameObject = GetParentObjectWithComponent<IPointerEnterHandler>(res.gameObject);
          if (hitGameObject != gameObject && hitGameObject != null) {
            currentPointerEnterObject = hitGameObject;
            break;
          }
        }

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
    private void HandlePointerEvent<T>(PointerEventData data, UnityEvent eventToFire, Action<T> eventCallback) where T : IEventSystemHandler {
      // Fire a UnityEvent for the pointer click
      eventToFire?.Invoke();

      // Pass-through click event to all IPointerClickHandler components
      var results = new List<RaycastResult>();
      EventSystem.current.RaycastAll(data, results);
      foreach (var res in results) {
        // Don't trigger ourselves or we get stuck in an infinite loop
        if (res.gameObject.GetComponentInParent<PointerEventPassThroughUI>() != this) {
          // If there's another pointer click handler, trigger them and only them
          var objectToTrigger = res.gameObject.GetComponentInParent<T>();
          if (objectToTrigger != null) {
            eventCallback(objectToTrigger);
            break;
          }
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
  }
}
