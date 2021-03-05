using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;

namespace Code.Game_Events {
  public class BackgroundCheckChangeGameEventListener : GameEventListener<BackgroundCheckChange> {
    [Tooltip("The game event to listen to")]
    public BackgroundCheckChangeGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public BackgroundCheckChangeUnityEvent response;

    protected override GameEvent<BackgroundCheckChange> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<BackgroundCheckChange> GetUnityEvent() {
      return response;
    }
  }
}