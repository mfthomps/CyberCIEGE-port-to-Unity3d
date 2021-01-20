﻿using System.Collections.Generic;
using UnityEngine;
using TMPro;

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

    // ------------------------------------------------------------------------
    void Awake() {
      var objectiveParser = new ObjectiveParser();
      foreach (var phase in objectiveParser.phases) {
        _phaseUI.Add(phase.name, AddPhaseUI(phase));
      }

      foreach (var objective in objectiveParser.objectives) {
        var objectiveUI = AddObjectiveUI(objective);
        if (objectiveUI != null) {
          _objectivesUI.Add(objective.name, objectiveUI);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetPhaseDone(string phaseName) {
      if (_phaseUI.ContainsKey(phaseName)) {
        _phaseUI[phaseName].SetCompleted(true);

        if (_selectedPhase != null && _selectedPhase.name == phaseName) {
          UpdateDescription(_selectedPhase);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetObjectiveComplete(string objectiveName) {
      if (_objectivesUI.ContainsKey(objectiveName)) {
        _objectivesUI[objectiveName].SetCompleted(true);

        if (_selectedObjective != null && _selectedObjective.name == objectiveName) {
          UpdateDescription(_selectedObjective);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetObjectiveIncomplete(string objectiveName) {
      if (_objectivesUI.ContainsKey(objectiveName)) {
        _objectivesUI[objectiveName].SetCompleted(false);

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
    private void UpdateDescription(Phase phase) {
      descriptionLabel.text = phase.GetDescription();
    }

    // ------------------------------------------------------------------------
    private void UpdateDescription(Objective objective) {
      descriptionLabel.text = objective.GetDescription();
    }
  }
}
