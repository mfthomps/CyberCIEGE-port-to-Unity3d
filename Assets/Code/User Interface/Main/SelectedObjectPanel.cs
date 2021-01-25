using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.User_Interface.Main {
  public class SelectedObjectPanel : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Header("UI Elements")]
    [Tooltip("List of property panels")]
    public List<BaseObjectPropertyPanel> propertyPanels = new List<BaseObjectPropertyPanel>();

    // ------------------------------------------------------------------------
    void OnEnable() {
      selectedObject.OnValueChanged += UpdatePropertyPanel;
      UpdatePropertyPanel();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      selectedObject.OnValueChanged -= UpdatePropertyPanel;
    }

    // ------------------------------------------------------------------------
    private void UpdatePropertyPanel() {
      foreach (var propertyPanel in propertyPanels) {
        propertyPanel.DisplayProperties(selectedObject.Value);
      }
    }
  }
}
