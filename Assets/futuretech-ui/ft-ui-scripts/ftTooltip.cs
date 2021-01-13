using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

namespace ftUI {

  public class ftTooltip : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler
  {
      ///////////////////////////////////////////////////////
      // Inspector revealed properties
      ///////////////////////////////////////////////////////

    [SerializeField]
    // Tooltip prefab
    private GameObject _tooltipPrefab = null;

    [SerializeField]
    // tooltip text available in the inspector
    private string _tooltipText;

    ///////////////////////////////////////////////////////
    // private fields
    ///////////////////////////////////////////////////////

    // UI canvas parent for this element
    private Canvas _canvas;

    // default tooltip delay
    private float _tooltipDelay = 1f;
    private float _maxWidth = 100f;

    // tooltip text for this element
    // tool tip on the tooltip prefab
    private ftTooltipController _tooltip;

    // the Rect Transform for this element
    private RectTransform _thisRectTransform;
    private RectTransform _canvasRectTransform;

    // this is the object that points to the ftTooltip Prefab
    private GameObject _tooltipObject;

    // This ftTooltip System contains the global delay time for the tooltips
    private ftTooltipSystem _tooltipSystem;

    // Called before Start; Initialization phase
    void Awake()
    {
      // Grabs the rect transform for this element
      _thisRectTransform = GetComponent<RectTransform>();

      // Get the root ui canvas
      Transform _rootTransform = transform.root;
      _canvas = _rootTransform.GetComponent<Canvas>();

      // Get the ftTooltip System on the Canvas if we found the canvas
      if (_canvas) {
        _tooltipSystem = _canvas.GetComponent<ftTooltipSystem>();
        _canvasRectTransform = _canvas.GetComponent<RectTransform>();
      }

      // If we found the ftTooltipSystem then assign the global tooltip delay to the local tooltip delay
      if (_tooltipSystem) {
        _tooltipDelay = _tooltipSystem.TooltipDelay;
        _maxWidth = _tooltipSystem.MaxWidth;
      }
    }

    // Called on PointerEnter in the EventTrigger on this element
    // Assign this in the Inspector 
    public void ShowToolTip () {

      StartCoroutine("StartTooltip");
    }

    // This Corroutine is launched when the mouse enters this element
    private IEnumerator StartTooltip () {
      // wait for the tooltip delay before we instantiate the tooltip prefab
      yield return new WaitForSeconds(_tooltipDelay);


      // Instantiate the tooltip prefab off the screen so we do't see it moved into place  
      _tooltipObject = Instantiate(_tooltipPrefab, new Vector3(-Screen.width,-Screen.height, 0f), Quaternion.identity, _canvas.transform);
      // This grabs the tooltip script on the Tooltip Prefab
      _tooltip = _tooltipObject.transform.GetComponent<ftTooltipController>();
      // We send these five things: 
      // thisRectTransform: the rect transform of this element
      // canvasRectTransform: the rect transform of the canvas
      // tooltiptext: sets the tooltip text
      // sends the canvas rendermode
      // the max width of the tool tip 
      _tooltip.Initialize(_thisRectTransform, _canvasRectTransform, _tooltipText, _maxWidth);
    }

    // Called on PointerExit in the EventTrigger on this element
    // Assign this in the Inspector
    public void HideToolTip () {
      // destroy the tooltip prefab
      Destroy(_tooltipObject);
      // stop the coroutine so it doesn't instantiate multiple tooltip clones
      StopCoroutine("StartTooltip");
    }

    // Detects the pointer when it begins hovering over the ui element
    public void OnPointerEnter(PointerEventData pointerEventData)
    {
      ShowToolTip();
    }

    //Detect when Cursor leaves the ui element
    public void OnPointerExit(PointerEventData pointerEventData)
    {
      HideToolTip();
    }

    //Detect when mouse point is down--different than click, as it triggers when the mouse is first clicked
    public void OnPointerDown(PointerEventData pointerEventData)
    {
      HideToolTip();
    }

    // Use this property to set the tooltip text

    public string TooltipText {
      get {
        return _tooltipText;
      }
      set {
        _tooltipText = value;
      }
    }
  }

}
