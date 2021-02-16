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
  
  public void OnPointerEnter(PointerEventData pointerEventData)
  {
    Cursor.SetCursor(hoverCursor, hotSpot, cursorMode);
  }

  //Detect when Cursor leaves the ui element
  public void OnPointerExit(PointerEventData pointerEventData)
  {
    Cursor.SetCursor(null, Vector2.zero, cursorMode);
  }
}
