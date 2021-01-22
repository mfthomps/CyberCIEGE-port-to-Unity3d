using Shared.ScriptableVariables;
using UnityEngine;
using Code.World_Objects;

namespace Code.Game_Events {
  // ScriptableVariable that decouples components firing and listening to game events that require a WorldObjectType parameter
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/World Object Type Game Event")]
  public class WorldObjectTypeGameEvent : GameEvent<WorldObjectType> {
    // ------------------------------------------------------------------------
    public void Raise(int enumValue) {
      Raise((WorldObjectType)enumValue);
    }
  }
}
