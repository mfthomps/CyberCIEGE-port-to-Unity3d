using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Code.User_Interface.Objectives {
  public class ObjectiveUIItem : MonoBehaviour {
    public delegate void ObjectiveEventHandler();
    public event ObjectiveEventHandler onObjectiveSelected;

    [Header("UI Elements")]
    [Tooltip("Label for showing the phase's display name")]
    public TMP_Text label;
    [Tooltip("Toggle to show this objective is completed")]
    public Toggle completedToggle;
    [Tooltip("Toggle to show this objective is currently selected")]
    public Toggle selectionToggle;

    private Objective _objective;

    // ------------------------------------------------------------------------
    public void SetObjective(Objective objective) {
      _objective = objective;
      label.text = _objective.GetTitle();
    }

    // ------------------------------------------------------------------------
    public void SetCompleted(bool isCompleted) {
      _objective.isComplete = isCompleted;
      completedToggle.isOn = isCompleted;
    }

    // ------------------------------------------------------------------------
    public void ToggleSelected(bool isSelected) {
      selectionToggle.isOn = isSelected;
    }

    // ------------------------------------------------------------------------
    public void Select() {
      onObjectiveSelected?.Invoke();
    }
  }
}
