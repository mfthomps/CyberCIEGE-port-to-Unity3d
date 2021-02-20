using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.Serialization;

public class SpeechBubble : MonoBehaviour {
  [SerializeField] private bool _active;

  [FormerlySerializedAs("_startingSpeechBubbleText")] 
  [SerializeField] private string _speechBubbleText;

  [SerializeField] private GameObject _speechBubbleRoot;

  [SerializeField] private TMP_Text _speechBubbleTextComponent;
  [SerializeField] private Image _speechBubbleSprite;

  // -----------------------------------------------------------------
  // Set the Thought Bubble with initial conditions
  private void Start() {
    Active = _active;
    SpeechBubbleText = _speechBubbleText;
  }
  
  // -----------------------------------------------------------------
  // Use this to update the thought bubble text at runtime
  public string SpeechBubbleText {
    get => _speechBubbleText;
    set {
      _speechBubbleText = value;

      _speechBubbleTextComponent.text = _speechBubbleText;
    }
  }

  // -----------------------------------------------------------------
  // Use this to turn on/off thought bubble at runtime
  public bool Active {
    get => _active;
    set {
      _active = value;
      _speechBubbleRoot.SetActive(_active);
    }
  }
}