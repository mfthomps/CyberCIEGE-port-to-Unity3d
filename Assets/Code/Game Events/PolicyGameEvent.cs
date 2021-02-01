using Shared.ScriptableVariables;
using UnityEngine;
using Code.Policies;

namespace Code.Game_Events {
  // ScriptableVariable that decouples components firing and listening to game events that require a Policy parameter
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Policy Game Event")]
  public class PolicyGameEvent : GameEvent<Policy> {
  }
}
