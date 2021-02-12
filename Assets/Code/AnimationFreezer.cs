using Shared.ScriptableVariables;
using UnityEngine;

namespace Code {
  
  //Utility to "freeze" an Animator based on a BooleanVariable. Will freeze the 
  //Animator if the pause variable value matches the freezeIfTrue value.
  public class AnimationFreezer : MonoBehaviour {
    [Tooltip("The BooleanVariable to listen for changes")]
    [SerializeField] private BooleanVariable _pauseVariable;
    [Tooltip("The Animator to freeze or unfreeze based on the state of the pause variable.")]
    [SerializeField] private Animator _animator;
    [Tooltip("Will freeze the animator if this value equals the boolean variable value.")]
    [SerializeField] private bool _freezeIfTrue = true;
    
    private float _originalSpeed = 1.0f;

    //-------------------------------------------------------------------------
    private void Awake() {
      _originalSpeed = _animator.speed;
      OnPauseChanged();
    }

    //-------------------------------------------------------------------------
    private void OnEnable() {
      _pauseVariable.OnValueChanged += OnPauseChanged;
      OnPauseChanged();
    }
    
    //-------------------------------------------------------------------------
    private void OnDisable() {
      _pauseVariable.OnValueChanged -= OnPauseChanged;
    }
    
    //-------------------------------------------------------------------------
    private void OnPauseChanged() {
      _animator.speed = (_pauseVariable.Value == _freezeIfTrue) ? 0 : _originalSpeed; 
    }
  }
}