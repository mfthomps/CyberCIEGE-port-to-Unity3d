using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;

namespace Code.Game_Events {
  public class ComponentGameEventListener : GameEventListener<ComponentBehavior> {
    [Tooltip("The game event to listen to")]
    public ComponentGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public ComponentUnityEvent response;

    protected override GameEvent<ComponentBehavior> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<ComponentBehavior> GetUnityEvent() {
      return response;
    }
  }
}