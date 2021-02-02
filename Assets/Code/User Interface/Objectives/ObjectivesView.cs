using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Code.Objectives;

namespace Code.User_Interface.Objectives {
  public class ObjectivesView : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("Prefab for creating phase UI")]
    public PhaseUIItem phaseUIPrefab;
    [Tooltip("Prefab for creating objective UI")]
    public ObjectiveUIItem objectiveUIPrefab;
    [Tooltip("Content area to put phase UI items")]
    public RectTransform phaseUIContentArea;
    [Tooltip("Label for the description of the currently selected objective")]
    public TMP_Text descriptionLabel;

    private Dictionary<string, PhaseUIItem> _phaseUI = new Dictionary<string, PhaseUIItem>();
    private Dictionary<string, ObjectiveUIItem> _objectivesUI = new Dictionary<string, ObjectiveUIItem>();
    private Phase _selectedPhase;
    private Objective _selectedObjective;
    private string _activePhase;

    // ------------------------------------------------------------------------
    public void Init(string userAppPath) {
      var objectiveParser = new ObjectiveParser(userAppPath);
      foreach (var phase in objectiveParser.phases) {
        _phaseUI.Add(phase.name, AddPhaseUI(phase));
      }

      foreach (var objective in objectiveParser.objectives) {
        var objectiveUI = AddObjectiveUI(objective);
        if (objectiveUI != null) {
          _objectivesUI.Add(objective.name, objectiveUI);
        }
      }

      // Setup the initial active state of each phase to start
      var foundIncompletePhase = false;
      foreach (var phaseUI in _phaseUI) {
        // The first incomplete phase we find is the active phase
        if (!foundIncompletePhase && !phaseUI.Value.IsComplete()) {
          foundIncompletePhase = true;
          phaseUI.Value.ToggleActive(true);
          _activePhase = phaseUI.Key;
        }
        else {
          phaseUI.Value.ToggleActive(phaseUI.Value.IsComplete());
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetPhaseDone(string phaseName) {
      if (_activePhase != phaseName) {
        if (!string.IsNullOrEmpty(_activePhase) && _phaseUI.ContainsKey(_activePhase)) {
          _phaseUI[_activePhase].SetCompleted(true);

          if (_selectedPhase != null && _selectedPhase.name == _activePhase) {
            UpdateDescription(_selectedPhase);
          }

          _activePhase = phaseName;
          if (!string.IsNullOrEmpty(_activePhase) && _phaseUI.ContainsKey(_activePhase)) {
            _phaseUI[_activePhase].ToggleActive(true);
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleObjectiveComplete(string objectiveName, bool isComplete) {
      if (_objectivesUI.ContainsKey(objectiveName)) {
        _objectivesUI[objectiveName].SetCompleted(isComplete);

        if (_selectedObjective != null && _selectedObjective.name == objectiveName) {
          UpdateDescription(_selectedObjective);
        }
      }
    }

    // ------------------------------------------------------------------------
    private PhaseUIItem AddPhaseUI(Phase phase) {
      var phaseUI = Instantiate(phaseUIPrefab, phaseUIContentArea);
      phaseUI.SetPhase(phase, _phaseUI.Count + 1);
      phaseUI.onPhaseSelected += delegate() {
        _selectedPhase = phase;
        _selectedObjective = null;

        // When an objective is selected, set the description text
        UpdateDescription(phase);

        // And deselect all other phase UI
        foreach (var existingPhaseUI in _phaseUI) {
          existingPhaseUI.Value.ToggleSelected(existingPhaseUI.Key == phase.name);
        }

        // And deselect all objective UI
        foreach (var existingObjectiveUI in _objectivesUI) {
          existingObjectiveUI.Value.ToggleSelected(false);
        }
      };
      phaseUI.onInactiveObjectiveSelected += delegate() {
        _selectedPhase = null;
        _selectedObjective = null;

        // Update description with locked objective text
        UpdateDescription();

        // And deselect all other phase UI's inactive objective
        foreach (var existingPhaseUI in _phaseUI) {
          existingPhaseUI.Value.ToggleInactiveSelected(existingPhaseUI.Key == phase.name);
        }

        // And deselect all objective UI
        foreach (var existingObjectiveUI in _objectivesUI) {
          existingObjectiveUI.Value.ToggleSelected(false);
        }
      };

      return phaseUI;
    }

    // ------------------------------------------------------------------------
    private ObjectiveUIItem AddObjectiveUI(Objective objective) {
      if (objective.phase != null && _phaseUI.ContainsKey(objective.phase.name)) {
        var objectiveUI = Instantiate(objectiveUIPrefab);
        objectiveUI.SetObjective(objective);
        objectiveUI.onObjectiveSelected += delegate() {
          _selectedPhase = null;
          _selectedObjective = objective;

          // When an objective is selected, set the description text
          UpdateDescription(objective);

          // And deselect all phase UI
          foreach (var existingPhaseUI in _phaseUI) {
            existingPhaseUI.Value.ToggleSelected(false);
          }

          // And deselect all other objective UI
          foreach (var existingObjectiveUI in _objectivesUI) {
            existingObjectiveUI.Value.ToggleSelected(existingObjectiveUI.Key == objective.name);
          }
        };

        // Add the Objective UI to the corresponding Phase UI
        var phaseUI = _phaseUI[objective.phase.name];
        phaseUI.AddObjective(objectiveUI);

        return objectiveUI;
      }
      return null;
    }

    // ------------------------------------------------------------------------
    private void UpdateDescription() {
      descriptionLabel.text = "You cannot see these objectives until you reach this phase.";
    }

    // ------------------------------------------------------------------------
    private void UpdateDescription(Phase phase) {
      descriptionLabel.text = phase.GetDescription();
    }

    // ------------------------------------------------------------------------
    private void UpdateDescription(Objective objective) {
      descriptionLabel.text = objective.GetDescription();
    }
  }
}
