using System;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Game_Events {
  [Serializable]
  public class BackgroundCheckChange {
    public string objectName;
    public BackgroundCheck.Level level;

    // ------------------------------------------------------------------------
    public BackgroundCheckChange(string objectName, BackgroundCheck.Level level) {
      this.objectName = objectName;
      this.level = level;
    }
  }

  // GameEvents with a BackgroundCheckChange payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Background Check Change Game Event")]
  public class BackgroundCheckChangeGameEvent : GameEvent<BackgroundCheckChange> {
  }
}