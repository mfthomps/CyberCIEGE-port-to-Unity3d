using UnityEngine;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Components {
  public class ComponentView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of computers in the given scenario")]
    public ComputerListVariable computerListVariable;
    [Header("Output Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;
    [Header("UI Elements")]
    [Tooltip("List of computers to display")]
    public ComputerList computerList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      computerListVariable.OnValueChanged += UpdateComputerList;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateComputerList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      computerListVariable.OnValueChanged -= UpdateComputerList;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectComputer(ComputerBehavior computerBehavior) {
      selectedObject.Value = computerBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    private void UpdateComputerList() {
      computerList.SetItems(computerListVariable.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var computer in computerListVariable.Value) {
        if (computer != null) {
          computerList.SetSelected(computer, computer.gameObject == selectedObject.Value);
        }
      }
    }

  }
}
