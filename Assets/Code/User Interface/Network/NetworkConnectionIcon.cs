using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NetworkConnectionIcon : MonoBehaviour
{
   [SerializeField] private Image connectionIcon;
   [SerializeField] private Sprite connectedImage;
   [SerializeField] private Sprite disconnectedImage;

   private bool _connected;

   public bool Connected {
    get {
      return _connected;
    }
    set {
      _connected = value;
      connectionIcon.sprite = _connected ? connectedImage : disconnectedImage;
    }
  }
}
