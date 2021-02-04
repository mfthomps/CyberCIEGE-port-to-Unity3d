using UnityEngine;

namespace Code.World_Objects {
  //represents the base class of all the world objects
  public abstract class BaseWorldObject : MonoBehaviour {
    public delegate void ValueChangeHandler();
    public event ValueChangeHandler OnValueChanged;

    public abstract WorldObjectType Type();

    // ------------------------------------------------------------------------
    protected void ValueChanged() {
      OnValueChanged?.Invoke();
    }
  }
}