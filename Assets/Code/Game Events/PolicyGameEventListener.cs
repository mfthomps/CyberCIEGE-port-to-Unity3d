using Shared.ScriptableVariables;
using UnityEngine;
using UnityEngine.Events;
using Code.Policies;

namespace Code.Game_Events {
  // Component to tie PolicyEvents to Unity's event system
  public class PolicyGameEventListener : GameEventListener<Policy> {
    [Tooltip("The game event to listen to")]
    public PolicyGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public PolicyUnityEvent response;

    //---------------------------------------------------------------------------
    protected override GameEvent<Policy> GetGameEvent() { return eventToListenTo; }

    //---------------------------------------------------------------------------
    protected override UnityEvent<Policy> GetUnityEvent() { return response; }
  }
}
