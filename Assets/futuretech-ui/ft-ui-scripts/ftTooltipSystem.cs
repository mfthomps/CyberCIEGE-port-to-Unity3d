using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ftUI
{

  public class ftTooltipSystem : MonoBehaviour
  {
    ///////////////////////////////////////////////////////
    // Inspector revealed properties
    ///////////////////////////////////////////////////////
    [SerializeField]
    // this float sets the time it takes for the tooltip to 
    //appear after the mouse cursor begins hovering over the elem
    private float _tooltipDelay = 1f;
    
    [SerializeField]
    private float _maxWidth = 100f;
    [SerializeField]
    private float _verticalPadding = 4f;
    [SerializeField]
    private float _horizontalPadding = 4f;
    [SerializeField]
    private bool _followMouse = true;

    // The tooltip can be assiged to in code using this property
    public float TooltipDelay {
      get {
        return _tooltipDelay;
      }
      set {
        _tooltipDelay = value;
      }
    }

  // Max width of the tooltip
    public float MaxWidth {
      get
      {
        return _maxWidth;
      }
      set
      {
        _maxWidth = value;
      }
    }

  // Padding on left and right of the tooltip
    public float HorizontalPadding {
      get
      {
        return _horizontalPadding;
      }
      set
      {
        _horizontalPadding = value;
      }
    }

    // Padding on top and bottom of the tooltip
    public float VerticalPadding {
      get
      {
        return _verticalPadding;
      }
      set
      {
        _verticalPadding = value;
      }
    }

    // Should the tooltip follow the mouse cursor while over the ui element?

    public bool FollowMouse
    {
      get
      {
        return _followMouse;
      }
      set
      {
        _followMouse = value;
      }
    }
  }
}