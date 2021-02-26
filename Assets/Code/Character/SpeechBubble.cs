using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using TMPro;
using UnityEngine.Serialization;


public class SpeechBubble : MonoBehaviour {
  [SerializeField] private bool _active;

  [Tooltip("Starting text")]
  [FormerlySerializedAs("_startingSpeechBubbleText")] 
  [SerializeField] private string _speechBubbleText;

  [Tooltip("Shoudl be immediate child of prefab root. Used to hide speech bubble if no animator is assigned.")]
  [SerializeField] private GameObject _speechBubbleRoot;

  [Tooltip("Speech Bubble Text Mesh Pro Component")]
  [SerializeField] private TMP_Text _speechBubbleTextComponent;

  [Tooltip("Speech Bubble Animator that handles the transition animations. OPTIONAL")]
  [SerializeField] private Animator _animator;

  [Tooltip("Speech will disappear after this many seconds. If zero, speech bubble will remain until manually deactivated.")]
  public float _timeUntilInactive = 4f;

  

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
      if (_animator) {
        _animator.SetBool("Active",_active);
      }
      else {
        _speechBubbleRoot.SetActive(_active);
      }

      if (_active && _timeUntilInactive > 0) {
        StartCoroutine(SpeechBubbleTimer());
      }
    }
  }

  // -----------------------------------------------------------------
  public void SetSpeechText(string text) {
    SpeechBubbleText = text;
    Active = !string.IsNullOrEmpty(text);
  }

  // -----------------------------------------------------------------
  // Speech Bubble Timer
  IEnumerator SpeechBubbleTimer () {
    yield return new WaitForSeconds(_timeUntilInactive);

    Active = false;
  } 

}