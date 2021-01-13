using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using TMPro;
// using UnityEngine.Input;

namespace ftUI {

  public class ftTooltipController : MonoBehaviour
  {
    ///////////////////////////////////////////////////////
    // Inspector revealed properties
    ///////////////////////////////////////////////////////

    [SerializeField]
    // The Text Mesh Pro Gameobject in this tooltip
    private TMP_Text _tooltipTMP = default;
    [SerializeField]
    // The Background Image of the tooltip
    private RectTransform _backgroundRectTransform = default;
    
    ///////////////////////////////////////////////////////
    // private fields
    ///////////////////////////////////////////////////////
    
    // the RectTransform of the Tooltip's parent object. 
    // So if this is placed on a Button, this will be the Rect Transform of the Button
    private RectTransform _parentTransform;
    private RectTransform _canvasTransform;
    private Canvas _canvas;

    // the actual text for this tooltip. Assigned through the Initialize method
    private string _tooltipText;

    // If the Canvas is set to screen space or not. This fact is important when we transform the mouse position to local space
    private bool _isScreenSpace = false;

    private float _maxWidth;

    private bool _followMouse;

    private static bool _leftSide;
    private static bool _topSide;


    // Should be called immediately after this is instantiated
    public void Initialize(RectTransform t_parentTransform, RectTransform t_canvasTransform, string t_tooltip, float t_maxWidth) {
      // the uiElement under which this tooltip is instantiated. This rect transform is used to calculate the position of the tooltip
      _parentTransform = t_parentTransform;
      _canvasTransform = t_canvasTransform;
      _canvas = t_canvasTransform.GetComponent<Canvas>();
      // assign the tool tip text
      _tooltipTMP.text = _tooltipText = t_tooltip;
      // assign the screen space flag
      _isScreenSpace = _canvas && _canvas.renderMode == RenderMode.ScreenSpaceOverlay;

      _maxWidth = t_maxWidth;


      // this section will resize the tooltip based on the text size
      // add some padding

      float horizontalTextPaddingSize = 4f;
      float verticalTextPaddingSize = 4f;
      ftTooltipSystem tooltipSystem = _canvas.GetComponent<ftTooltipSystem>();

      if (tooltipSystem) {
        horizontalTextPaddingSize = tooltipSystem.HorizontalPadding;
        verticalTextPaddingSize = tooltipSystem.VerticalPadding;
        _followMouse = tooltipSystem.FollowMouse;
      }
      
      // adjust the transform size
      Vector2 backgroundSize = new Vector2(_tooltipTMP.preferredWidth + horizontalTextPaddingSize * 2f, _tooltipTMP.preferredHeight + verticalTextPaddingSize * 2f);
      float clampedWidth = Mathf.Min(backgroundSize.x, _maxWidth);
      // backgroundSize = new Vector2(clampedWidth, backgroundSize.y);
      backgroundSize = new Vector2(backgroundSize.x, backgroundSize.y);
      // adjust the rectTransform to new size
      _backgroundRectTransform.sizeDelta = backgroundSize;

      _leftSide = _parentTransform.position.x <= Screen.width / 2;
      _topSide = _parentTransform.position.y >= Screen.height / 2;

      // Checks the quadrant of the ui element, then 
      // switches pivot based on the quadrant of the screen 
      // the ui element is in so the tooltip doesn't move off the screen

      float pivotX = _leftSide ? 0f : 1f;
      float pivotY = _topSide ? 1f : 0f;
      
      _backgroundRectTransform.pivot = new Vector2(pivotX, pivotY);

      _backgroundRectTransform.transform.localPosition = GetTooltipPosition(_parentTransform, _canvas);
      _backgroundRectTransform.gameObject.SetActive(_tooltipText != "");

    }

    private static Vector2 GetMouseCursorOffset(bool onLeftSide, bool onTopSide) {
      return new Vector2(onLeftSide ? 8f: 0f, onTopSide ? 0f : 0f);
    }

    // Get Starting position to prevent flickering
    public static Vector3 GetTooltipPosition(RectTransform parentTransform, Canvas canvas) {
      if (parentTransform)
      {
        // this block takes the mouse position and converts it to a transform space relative to the parent transform
        // As long as the mouse hovers over the element the tooltip will follow the mouse cursor
        Vector2 localPoint;
        Vector2 mousePos = Input.mousePosition;
        bool isScreenSpace = canvas.renderMode == RenderMode.ScreenSpaceOverlay; 
        RectTransform canvasTransform = canvas.GetComponent<RectTransform>();

        RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasTransform, mousePos, isScreenSpace ? null : Camera.main, out localPoint);
        localPoint += GetMouseCursorOffset(_leftSide, _topSide);

        return localPoint;
      }
      return Vector3.zero;
    }

    // Update is called once per frame
    // Will be called as long as this tooltip is active
    private void Update()
    {
      // only do this if the tooltip has been assigned

      if (_followMouse && _backgroundRectTransform.gameObject.activeSelf) {
          // Set tooltip position based on mouse cursor position
        _backgroundRectTransform.transform.localPosition = GetTooltipPosition(_parentTransform, _canvas);
      }
    }

  }
}