using System.Collections.Generic;
using UnityEngine;
using TMPro;

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

    // ------------------------------------------------------------------------
    protected void SetStringProperty(TMP_Text label, string value, string placeholderValue = "") {
      label.text = !string.IsNullOrEmpty(value) ? value : placeholderValue;
    }

    // ------------------------------------------------------------------------
    protected void SetStringList(StringList stringList, HashSet<string> items) {
      SetStringList(stringList, new List<string>(items));
    }

    // ------------------------------------------------------------------------
    protected void SetStringList(StringList stringList, List<string> items) {
      if (items.Count > 0) {
        stringList.SetItems(items);
      }
      else {
        stringList.SetItems(new List<string>{ "None" });
      }
    }

    // ------------------------------------------------------------------------
    protected void SetRangeProperty(RangeProperty range, int value, int min = 0, int max = 100) {
      range.SetRange(value, min, max);
    }
  }
}
