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

  private Selectable selectable;

  //----------------------------------------------------------
  // Get the first instance of a selectable (Toggle, Button) in the hierarchy
  // We are assuming there is only one, or at least the first one we find is the relevant one
  private void Start () {
    
    selectable = GetComponentInChildren<Selectable>();

  }
  
  //----------------------------------------------------------
  public void OnPointerEnter(PointerEventData pointerEventData)
  {
    if (selectable && selectable.interactable) {      
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
