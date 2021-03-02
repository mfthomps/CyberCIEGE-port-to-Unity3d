using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class MouseHover : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
  [SerializeField] private Texture2D hoverCursor;
  private CursorMode cursorMode = CursorMode.Auto;
  static public Vector2 hotSpot = Vector2.zero;

  // [Tooltip("The Selectable Element used to determine the type of cursor displayed on highlight. Optional")]
  private Selectable selectable;
  private bool _active = false;

  //----------------------------------------------------------
  // Get the first instance of a selectable (Toggle, Button) in the hierarchy
  // We are assuming there is only one, or at least the first one we find is the relevant one
  private void Start () {
    // Grab the first one in the hierarchy if none is specified
    if (!selectable) {
      Button button = GetComponentInChildren<Button>();
      if (button) {
        selectable = button as Selectable;
      }
      else {
        selectable = GetComponentInChildren<Selectable>();
      }
    }

    hotSpot = new Vector2(19f, 2f);

  }
  
  //----------------------------------------------------------
  void OnDisable() {
    if (_active) {
      ToggleCursor(false);
    }
  }

  //----------------------------------------------------------
  public void OnPointerEnter(PointerEventData pointerEventData) {
    if (!selectable || (selectable && selectable.interactable)) {  
      ToggleCursor(true);
    }
  }

  //----------------------------------------------------------
  //Detect when Cursor leaves the ui element
  public void OnPointerExit(PointerEventData pointerEventData) {
    ToggleCursor(false);
  }

  //----------------------------------------------------------
  private void ToggleCursor(bool active) {
    _active = active;
    if (active) {
      Cursor.SetCursor(hoverCursor, hotSpot, cursorMode);
    }
    else {
      Cursor.SetCursor(null, Vector2.zero, cursorMode);
    }
  }
}
