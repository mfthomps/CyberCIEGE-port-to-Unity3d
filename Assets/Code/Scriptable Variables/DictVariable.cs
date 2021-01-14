using System.Collections.Generic;
using Shared.ScriptableVariables;

namespace Code.Scriptable_Variables {
  
  //A ScriptableVariable that contains a templated Dictionary
  public class DictVariable<K,V> : ScriptableVariable {
    protected Dictionary<K,V> value = new Dictionary<K,V>();
    
    //-------------------------------------------------------------------------
    public V this[K key] {
      get => value[key];
      set => this.value[key] = value;
    }

    //-------------------------------------------------------------------------
    public void Clear() {
      value.Clear();
    }
    
    //-------------------------------------------------------------------------
    public Dictionary<K, V>.KeyCollection Keys() {
      return value.Keys;
    }
    
    //-------------------------------------------------------------------------
    public Dictionary<K, V>.ValueCollection Values() {
      return value.Values;
    }

    //-------------------------------------------------------------------------
    public int Length => this.value.Count;
  }
}