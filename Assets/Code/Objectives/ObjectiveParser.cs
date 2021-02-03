using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace Code.Objectives {
  public class ObjectiveParser {
    public string shortBriefing;
    public string briefing;
    public List<Phase> phases = new List<Phase>();
    public List<Objective> objectives = new List<Objective>();

    // ------------------------------------------------------------------------
    public ObjectiveParser(string objectivesDirectory) {
      var obj_file = Path.Combine(objectivesDirectory, "objectives.sdf");
      ccUtils.ParseSDFFile(obj_file, (tag, value) => {
        switch (tag) {
          case "ShortBriefing":
            shortBriefing = value.Replace("(PARAGRAPH)", "\n\n");
            break;
          case "Briefing":
            briefing = value.Replace("(PARAGRAPH)", "\n\n");
            break;
          case "Phases":
            ccUtils.ParseSDFFileSubElement(value, (phaseTag, phaseValue) => {
              phases.Add(LoadPhase(phaseValue));
            });
            break;
          case "Objectives":
            ccUtils.ParseSDFFileSubElement(value, (objectiveTag, objectiveValue) => {
              objectives.Add(LoadObjective(objectiveValue));
            });
            break;
        }
      });
    }

    // ------------------------------------------------------------------------
    private Phase LoadPhase(string dataString) {
      var phase = new Phase();

      ccUtils.ParseSDFFileSubElement(dataString, (tag, value) => {
        switch (tag) {
          case "TagName":
            phase.name = value;
            break;
          case "DisplayName":
            phase.displayName = value;
            break;
          case "UncompletedText":
            phase.uncompletedText = value;
            break;
          case "CompletedText":
            phase.completedText = value;
            break;
          case "PhaseCompleted":
            if (!bool.TryParse(value, out phase.isComplete)) {
              Debug.Log($"Error Phase parsing {value}");
            }
            break;
        }
      });

      return phase;
    }

    // ------------------------------------------------------------------------
    private Objective LoadObjective(string dataString) {
      var objective = new Objective();

      ccUtils.ParseSDFFileSubElement(dataString, (tag, value) => {
        switch (tag) {
          case "TagName":
            objective.name = value;
            break;
          case "DisplayName":
            objective.displayName = value;
            break;
          case "UncompletedText":
            objective.uncompletedText = value;
            break;
          case "CompletedText":
            objective.completedText = value;
            break;
          case "Phase":
            var phaseIndex = 0;
            if (!int.TryParse(value, out phaseIndex)) {
              Debug.Log($"ERROR parsing phase from {value}");
            }
            if (0 <= phaseIndex && phaseIndex < phases.Count) {
              objective.phase = phases[phaseIndex];
            }
            break;
          case "LastPhase":
            var lastPhaseIndex = 0;
            if (!int.TryParse(value, out lastPhaseIndex)) {
              Debug.Log($"ERROR parsing LastPhase from {value}");
            }
            if (0 <= lastPhaseIndex && lastPhaseIndex < phases.Count) {
              objective.lastPhase = phases[lastPhaseIndex];
            }
            break;
          case "ObjectiveCompleted":
            if (!bool.TryParse(value, out objective.isComplete)) {
              Debug.Log($"ERROR parsing ObjectiveCompleted from {value}");
            }
            break;
        }
      });

      return objective;
    }
  }
}
