using UnityEngine;

namespace Code.User_Interface.Main {
  // The actual functional base class for property panels that will automatically
  // enable/disable them based on if the selected object has the given component type or not
  public abstract class GenericObjectPropertyPanel<T> : BaseObjectPropertyPanel where T : Component {
    // ------------------------------------------------------------------------
    public override void DisplayProperties(GameObject gameObjectToDisplay) {
      var canDisplay = false;
      if (gameObjectToDisplay != null) {
        var relevantComponent = gameObjectToDisplay.GetComponent<T>();
        if (relevantComponent != null) {
          DisplayProperties(relevantComponent);
          canDisplay = true;
        }
      }
      gameObject.SetActive(canDisplay);
    }

    // ------------------------------------------------------------------------
    protected abstract void DisplayProperties(T component);
  }
}
