using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.Objectives;

namespace Code.User_Interface.Objectives {
  public class PhaseUIItem : MonoBehaviour {
    public delegate void PhaseEventHandler();
    public event PhaseEventHandler onPhaseSelected;
    public event PhaseEventHandler onInactiveObjectiveSelected;

    [Header("UI Elements")]
    [Tooltip("UI to display when phase is inactive")]
    public GameObject inactiveUI;
    [Tooltip("Toggle to show this phase's inactive objective is currently selected")]
    public Toggle inactiveUISelectionToggle;
    [Tooltip("Content area to put objective UI items")]
    public RectTransform objectiveUIContentArea;
    [Tooltip("Label for showing the phase's display name")]
    public TMP_Text label;
    [Tooltip("Toggle to show this phase is completed")]
    public Toggle completedToggle;
    [Tooltip("Toggle to show this phase is currently selected")]
    public Toggle selectionToggle;

    private Phase _phase;
    private int _index;

    // ------------------------------------------------------------------------
    public void SetPhase(Phase phase, int index) {
      _phase = phase;
      _index = index;
      label.text = $"PHASE {_index}";
    }

    // ------------------------------------------------------------------------
    public bool IsComplete() {
      return _phase.isComplete;
    }

    // ------------------------------------------------------------------------
    public void SetCompleted(bool isCompleted) {
      _phase.isComplete = isCompleted;
      completedToggle.isOn = isCompleted;
    }

    // ------------------------------------------------------------------------
    public void ToggleActive(bool isActive) {
      inactiveUI.SetActive(!isActive);
      objectiveUIContentArea.gameObject.SetActive(isActive);
    }

    // ------------------------------------------------------------------------
    public void ToggleInactiveSelected(bool isSelected) {
      inactiveUISelectionToggle.isOn = isSelected;
      selectionToggle.isOn = false;
    }

    // ------------------------------------------------------------------------
    public void AddObjective(ObjectiveUIItem objectiveUI) {
      objectiveUI.transform.SetParent(objectiveUIContentArea);
      objectiveUI.transform.localScale = new Vector3(1f,1f,1f);
    }

    // ------------------------------------------------------------------------
    public void ToggleSelected(bool isSelected) {
      inactiveUISelectionToggle.isOn = false;
      selectionToggle.isOn = isSelected;
    }

    // ------------------------------------------------------------------------
    public void Select() {
      onPhaseSelected?.Invoke();
    }

    // ------------------------------------------------------------------------
    public void InactiveObjectiveSelected() {
      onInactiveObjectiveSelected?.Invoke();
    }
  }
}
