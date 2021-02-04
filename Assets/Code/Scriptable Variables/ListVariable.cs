using System.Collections.Generic;
using Shared.ScriptableVariables;

namespace Code.Scriptable_Variables {
  //Base placeholder for ScriptableVariables that contain a list
  public class ListVariable<T> : ScriptableVariable<List<T>> {

    // ------------------------------------------------------------------------
    //Add an item to the list.
    public void Add(T item) {
      Value.Add(item);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    //Remove an item from the list.
    //@return true if successful, false otherwise
    public bool Remove(T item) {
      bool ret = Value.Remove(item);
      if (ret) {
        ValueChanged();
      }

      return ret;
    }

    // ------------------------------------------------------------------------
    public void Clear() {
      Value.Clear();
      ValueChanged();
    }
  }
}