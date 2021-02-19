using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class SpeechBubble : MonoBehaviour
{
  
  [SerializeField] private bool _active;
  [SerializeField] private string _startingSpeechBubbleText;
  [SerializeField] private GameObject _speechBubbleRoot;

  [SerializeField] private TMP_Text _speechBubbleTextComponent;
  [SerializeField] private Image _speechBubbleSprite;
  private string _speechBubbleText;

  // -----------------------------------------------------------------
  // Set the Thought Bubble with initial conditions

  private void Start () {
    Active = _active;
    SpeechBubbleText = _startingSpeechBubbleText;
  }


  // -----------------------------------------------------------------
  // Use this to update the thought bubble text at runtime
  public string SpeechBubbleText {
    get {
      return _speechBubbleText;
    }
    set {
      _speechBubbleText = value;

      _speechBubbleTextComponent.text = _speechBubbleText;
    }
  }

  // -----------------------------------------------------------------
  // Use this to turn on/off thought bubble at runtime
  public bool Active {
    get {
      return _active;
    }
    set {
      _active = value;
      _speechBubbleRoot.SetActive(_active);

    }
  }
}
