using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Game_Events {
  // GameEvents with a ComponentBehavior payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Component Game Event")]
  public class ComponentGameEvent : GameEvent<ComponentBehavior> {
  }
}