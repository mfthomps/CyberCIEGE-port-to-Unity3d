using UnityEngine;

namespace Code {
  
  //Utility to set a boolean animation parameter upon start up.
  public class StaticAnimationController : MonoBehaviour {
    [SerializeField] private Animator _animator;
    [SerializeField] private string _booleanAnimationParam;
    [SerializeField] private bool _booleanAnimationParamValue;

    //--------------------------------------------------------------------------
    private void Start() {
      if (!_animator) {
        _animator.GetComponent<Animator>();
      }
      
      if (_animator) {
        _animator.SetBool(_booleanAnimationParam, _booleanAnimationParamValue);
      }
    }
  }
}
