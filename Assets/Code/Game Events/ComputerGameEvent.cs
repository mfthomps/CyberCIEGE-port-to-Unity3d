using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Game_Events {
  // GameEvents with a ComputerBehavior payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Computer Game Event")]
  public class ComputerGameEvent : GameEvent<ComputerBehavior> {
  }
}