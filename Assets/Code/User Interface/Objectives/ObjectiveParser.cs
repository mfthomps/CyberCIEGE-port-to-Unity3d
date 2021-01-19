using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.User_Interface.Objectives {
  public class ObjectiveParser {
    public List<Phase> phases = new List<Phase>();
    public List<Objective> objectives = new List<Objective>();

    // ------------------------------------------------------------------------
    public ObjectiveParser() {
      var obj_file = Path.Combine(GameLoadBehavior.user_app_path, "objectives.sdf");
      //Debug.Log("LoadObjectives " + obj_file);
      StreamReader reader = new StreamReader(obj_file, Encoding.Default);
      using (reader) {
        string value = null;
        string tag;
        ccUtils.PositionAfter(reader, "Phases");
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value != null && value != "end") {
            // Debug.Log("block for " + tag + " index " + phases.Count + " is " + value);
            phases.Add(LoadPhase(value));
          }
        } while (value != null && value != "end");

        ccUtils.PositionAfter(reader, "Objectives");
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value != null && value != "end") {
            objectives.Add(LoadObjective(value));
          }
        } while (value != null && value != "end");
      }
    }

    // ------------------------------------------------------------------------
    private Phase LoadPhase(string dataString) {
      var phase = new Phase();

      // Load phase contents
      var stream = new MemoryStream(Encoding.UTF8.GetBytes(dataString ?? ""));
      phase.name = ccUtils.SDTField(stream, "TagName");
      phase.displayName = ccUtils.SDTField(stream, "DisplayName");
      phase.uncompletedText = ccUtils.SDTField(stream, "UncompletedText");
      phase.completedText = ccUtils.SDTField(stream, "CompletedText");
      if (!bool.TryParse(ccUtils.SDTField(stream, "PhaseCompleted"), out phase.isComplete)) {
        Debug.Log("Error Phase parsing " + dataString);
      }

      return phase;
    }

    // ------------------------------------------------------------------------
    private Objective LoadObjective(string dataString) {
      var objective = new Objective();

      // Load objective contents
      MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(dataString ?? ""));
      objective.name = ccUtils.SDTField(stream, "TagName");
      objective.displayName = ccUtils.SDTField(stream, "DisplayName");
      objective.uncompletedText = ccUtils.SDTField(stream, "UncompletedText");
      objective.completedText = ccUtils.SDTField(stream, "CompletedText");
      int phaseIndex = 0, lastPhaseIndex = 0;
      if (!int.TryParse(ccUtils.SDTField(stream, "Phase"), out phaseIndex)) {
        Debug.Log("ERROR parsing phase from " + dataString);
      }
      if (0 <= phaseIndex && phaseIndex < phases.Count) {
        objective.phase = phases[phaseIndex];
      }
      if (!int.TryParse(ccUtils.SDTField(stream, "LastPhase"), out lastPhaseIndex)) {
        Debug.Log("ERROR parsing LastPhase from " + dataString);
      }
      if (0 <= lastPhaseIndex && lastPhaseIndex < phases.Count) {
        objective.lastPhase = phases[lastPhaseIndex];
      }
      if (!bool.TryParse(ccUtils.SDTField(stream, "ObjectiveCompleted"), out objective.isComplete)) {
        Debug.Log("ERROR parsing ObjectiveCompleted from " + dataString);
      }

      return objective;
    }
  }
}
