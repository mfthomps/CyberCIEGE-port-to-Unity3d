using Shared.ScriptableVariables;
using UnityEngine;
using UnityEngine.Events;

namespace Code.Game_Events {
  // Component to tie ZoneAccessChangeEvents to Unity's event system
  public class ZoneAccessChangeGameEventListener : GameEventListener<ZoneAccessChange> {
    [Tooltip("The game event to listen to")]
    public ZoneAccessChangeGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public ZoneAccessChangeUnityEvent response;

    //---------------------------------------------------------------------------
    protected override GameEvent<ZoneAccessChange> GetGameEvent() { return eventToListenTo; }

    //---------------------------------------------------------------------------
    protected override UnityEvent<ZoneAccessChange> GetUnityEvent() { return response; }
  }
}
