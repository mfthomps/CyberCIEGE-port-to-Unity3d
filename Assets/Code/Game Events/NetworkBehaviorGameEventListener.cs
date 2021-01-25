using Shared.ScriptableVariables;
using UnityEngine;
using UnityEngine.Events;
using Code.World_Objects.Network;

namespace Code.Game_Events {
  // Component to tie NetworkBehaviorEvents to Unity's event system
  public class NetworkBehaviorGameEventListener : GameEventListener<NetworkBehavior> {
    [Tooltip("The game event to listen to")]
    public NetworkBehaviorGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public NetworkBehaviorUnityEvent response;

    //---------------------------------------------------------------------------
    protected override GameEvent<NetworkBehavior> GetGameEvent() { return eventToListenTo; }

    //---------------------------------------------------------------------------
    protected override UnityEvent<NetworkBehavior> GetUnityEvent() { return response; }
  }
}
