using UnityEngine;

namespace Code.User_Interface.Main {
  // We need a concrete base class for the property panels so we can use them in the Unity Inspector,
  // but this class really doesn't do anything worthwhile other than that
  public class BaseObjectPropertyPanel : MonoBehaviour {
    // ------------------------------------------------------------------------
    public virtual void DisplayProperties(GameObject gameObject) {}
  }
}
