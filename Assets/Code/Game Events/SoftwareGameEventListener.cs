using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;
using Code.Software;

namespace Code.Game_Events {
  public class SoftwareGameEventListener : GameEventListener<SoftwareBehavior> {
    [Tooltip("The game event to listen to")]
    public SoftwareGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public SoftwareUnityEvent response;

    protected override GameEvent<SoftwareBehavior> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<SoftwareBehavior> GetUnityEvent() {
      return response;
    }
  }
}