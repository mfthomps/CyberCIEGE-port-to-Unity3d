using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Shared.ScriptableVariables;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Components {
  public class ComputerActionButtons : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object")]
    public GameObjectVariable selectedObject;

    [Header("UI Elements")]
    [Tooltip("List of Buttons to control based on the current selection")]
    public List<Button> buttons;

    // ------------------------------------------------------------------------
    void OnEnable() {
      selectedObject.OnValueChanged += UpdateButtonInteractability;
      UpdateButtonInteractability();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      selectedObject.OnValueChanged -= UpdateButtonInteractability;
    }

    // ------------------------------------------------------------------------
    void UpdateButtonInteractability() {
      var validSelection = selectedObject.Value != null && selectedObject.Value.GetComponent<ComputerBehavior>() != null;
      foreach (var button in buttons) {
        button.interactable = validSelection;
      }
    }
  }
}
