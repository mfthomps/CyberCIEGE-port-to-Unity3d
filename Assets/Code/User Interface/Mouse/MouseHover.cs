using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class MouseHover : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
  [SerializeField] private Texture2D hoverCursor;
  private CursorMode cursorMode = CursorMode.Auto;
  private Vector2 hotSpot = Vector2.zero;

  // [Tooltip("The Selectable Element used to determine the type of cursor displayed on highlight. Optional")]
  private Selectable selectable;

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

  }
  
  //----------------------------------------------------------
  public void OnPointerEnter(PointerEventData pointerEventData)
  {
    if (!selectable || (selectable && selectable.interactable)) {      
      Cursor.SetCursor(hoverCursor, hotSpot, cursorMode);
    }
  }

  //----------------------------------------------------------
  //Detect when Cursor leaves the ui element
  public void OnPointerExit(PointerEventData pointerEventData)
  {
    Cursor.SetCursor(null, Vector2.zero, cursorMode);
  }
}
