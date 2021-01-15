using System.Collections.Generic;
using Shared.ScriptableVariables;

namespace Code.Scriptable_Variables {
  
  //A ScriptableVariable that contains a templated Dictionary
  public class DictVariable<K,V> : ScriptableVariable {
    public delegate void ValueChangeHandler(K key, V value);
    
    //Called when the dictionary contents have been modified
    public event ValueChangeHandler OnValueChanged;
    
    protected readonly Dictionary<K,V> Value = new Dictionary<K,V>();
    
    //-------------------------------------------------------------------------
    public V this[K key] {
      get => Value[key];
      set {
        if ((Value.ContainsKey(key) && !Value[key].Equals(value)) ||
             !Value.ContainsKey(key) ) {
          Value[key] = value;
          ValueChanged(key, value);
        }
      }
    }
    
    //-------------------------------------------------------------------------
    private void ValueChanged(K key, V v) {
      OnValueChanged?.Invoke(key, v);
    }

    //-------------------------------------------------------------------------
    public void Clear() {
      Value.Clear();
    }
    
    //-------------------------------------------------------------------------
    public Dictionary<K, V>.KeyCollection Keys() {
      return Value.Keys;
    }
    
    //-------------------------------------------------------------------------
    public Dictionary<K, V>.ValueCollection Values() {
      return Value.Values;
    }

    //-------------------------------------------------------------------------
    public int Length => Value.Count;
  }
}