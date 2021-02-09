using Shared.ScriptableVariables;
using UnityEngine;
using Code.Software;

namespace Code.Game_Events {
  // GameEvents with a SoftwareBehavior payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Software Game Event")]
  public class SoftwareGameEvent : GameEvent<SoftwareBehavior> {
  }
}