using Shared.ScriptableVariables;
using UnityEngine;
using Code.World_Objects.Zone;

namespace Code.Game_Events {
  // Data needed to send a zone access change to the server
  public class ZoneAccessChange {
    public ZoneBehavior zone;
    public string target;

    // ------------------------------------------------------------------------
    public ZoneAccessChange(ZoneBehavior zone, string target) {
      this.zone = zone;
      this.target = target;
    }
  }

  // ScriptableVariable that decouples components firing and listening to game events that require a ZoneAccessChange parameter
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Zone Access Change Game Event")]
  public class ZoneAccessChangeGameEvent : GameEvent<ZoneAccessChange> {
  }
}
