using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NetworkLink : MonoBehaviour
{
  private Image _image;
  private Color _color;
  private bool _visible;

  // Start is called before the first frame update
  private void Start()
  {
      _image = GetComponent<Image>();
      if (!_image) {
        Debug.Log("Network Link has no Image Component.");
      }
  }

  // Color this link
  public Color NetworkLinkColor {
    get {
      return _color;
    }
    set {
      _color = value;
      _image.color = _color;
    }
  }

  // Make this link visible
  public bool IsVisible {
    get {
      return _visible;
    }
    set {
      _visible = value;
      _image.enabled = _visible;
    }
  }


}
