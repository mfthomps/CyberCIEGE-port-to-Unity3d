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
    private bool _isDialogUp;

    //-------------------------------------------------------------------------
    private void Awake() {
      _originalSpeed = _animator.speed;
      UpdateAnimationSpeed();
    }

    //-------------------------------------------------------------------------
    private void OnEnable() {
      _pauseVariable.OnValueChanged += UpdateAnimationSpeed;
      UpdateAnimationSpeed();
    }
    
    //-------------------------------------------------------------------------
    private void OnDisable() {
      _pauseVariable.OnValueChanged -= UpdateAnimationSpeed;
    }

    //-------------------------------------------------------------------------
    public void DialogUp(bool dialogIsUp) {
      _isDialogUp = dialogIsUp;
      UpdateAnimationSpeed();
    }

    //-------------------------------------------------------------------------
    private void UpdateAnimationSpeed() {
      _animator.speed = ((_pauseVariable.Value || _isDialogUp) == _freezeIfTrue) ? 0 : _originalSpeed; 
    }
  }
}