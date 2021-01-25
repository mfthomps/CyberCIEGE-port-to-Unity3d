using System.Collections.Generic;
using Shared.ScriptableVariables;

namespace Code.Scriptable_Variables {
  //Base placeholder for ScriptableVariables that contain a list
  public class ListVariable<T> : ScriptableVariable<List<T>> {

    //Add an item to the list. Note, this creates a whole new List with the item added to it.
    public void Add(T item) {
      Value.Add(item);
      ValueChanged();
    }

    // ------------------------------------------------------------------------
    public void Clear() {
      Value.Clear();
      ValueChanged();
    }
  }
}