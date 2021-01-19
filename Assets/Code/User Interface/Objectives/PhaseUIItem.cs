using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Code.User_Interface.Objectives {
  public class PhaseUIItem : MonoBehaviour {
    public delegate void PhaseEventHandler();
    public event PhaseEventHandler onPhaseSelected;

    [Header("UI Elements")]
    [Tooltip("Content area to put phase UI items")]
    public RectTransform objectiveUIContentArea;
    [Tooltip("Label for showing the phase's display name")]
    public TMP_Text label;
    [Tooltip("Toggle to show this phase is completed")]
    public Toggle completedToggle;
    [Tooltip("Toggle to show this objective is currently selected")]
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
    public void SetCompleted(bool isCompleted) {
      _phase.isComplete = isCompleted;
      completedToggle.isOn = isCompleted;
    }

    // ------------------------------------------------------------------------
    public void AddObjective(ObjectiveUIItem objectiveUI) {
      objectiveUI.transform.SetParent(objectiveUIContentArea);
    }

    // ------------------------------------------------------------------------
    public void ToggleSelected(bool isSelected) {
      selectionToggle.isOn = isSelected;
    }

    // ------------------------------------------------------------------------
    public void Select() {
      onPhaseSelected?.Invoke();
    }
  }
}
