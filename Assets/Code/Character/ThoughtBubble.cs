using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ThoughtBubble : MonoBehaviour
{
  
  [SerializeField] private bool _Active;
  [SerializeField] private string _startingThoughtBubbleText;
  [SerializeField] private GameObject _thoughtBubbleRoot;

  [SerializeField] private TMP_Text _thoughtBubbleTextComponent;
  [SerializeField] private Image _thoughtBubbleSprite;
  private string _thoughtBubbleText;
  private bool _active;

  private void Start () {
    Active = _Active;
    ThoughtBubbleText = _startingThoughtBubbleText;
  }
  private void Update () {
    if (_startingThoughtBubbleText != ThoughtBubbleText)
    {
      ThoughtBubbleText = _startingThoughtBubbleText;
    }
    if (_Active != Active) {
      Active = _Active;
    }
  }

  public string ThoughtBubbleText {
    get {
      return _thoughtBubbleText;
    }
    set {
      _thoughtBubbleText = value;

      _thoughtBubbleTextComponent.text = _thoughtBubbleText;
    }
  }

  public bool Active {
    get {
      return _active;
    }
    set {
      _active = value;
      _thoughtBubbleRoot.SetActive(_active);

    }
  }
}
