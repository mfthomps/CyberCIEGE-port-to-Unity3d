using System;
using UnityEngine;
using UnityEngine.Events;

namespace Code.Scriptable_Variables {
  
  [Serializable]
  public class StringStringUnityEvent : UnityEvent<string, string> {
  }
  
  //A "listener" that picks up changes on a StringStringVariable and Invokes
  //A Unity Event with the changed key/value pair.
  public class StringStringDictVariableListener : MonoBehaviour {
    [Tooltip("The StringStringVariable to listen to for changes.")]
    [SerializeField] private StringStringVariable variable;

    [Tooltip("The Unity Event triggered when the variable has changed.")]
    public StringStringUnityEvent OnValueChangedEvent;
    
    private void OnEnable() {
      variable.OnValueChanged += OnValueChanged;
    }
    private void OnDisable() {
      variable.OnValueChanged -= OnValueChanged;
    }

    private void OnValueChanged(string  key, string value) {
      OnValueChangedEvent?.Invoke(key, value);
    }
    
  }
}