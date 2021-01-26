using Shared.ScriptableVariables;
using UnityEngine;
using Code.World_Objects.Network;

namespace Code.Game_Events {
  // ScriptableVariable that decouples components firing and listening to game events that require a NetworkBehavior parameter
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Network Behavior Game Event")]
  public class NetworkBehaviorGameEvent : GameEvent<NetworkBehavior> {
  }
}
