using Shared.ScriptableVariables;
using UnityEngine;
using UnityEngine.Events;
using Code.World_Objects;

namespace Code.Game_Events {
  // Component to tie WorldObjectTypeEvents to Unity's event system
  public class WorldObjectTypeGameEventListener : GameEventListener<WorldObjectType> {
    [Tooltip("The game event to listen to")]
    public WorldObjectTypeGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public WorldObjectTypeUnityEvent response;

    //---------------------------------------------------------------------------
    protected override GameEvent<WorldObjectType> GetGameEvent() { return eventToListenTo; }

    //---------------------------------------------------------------------------
    protected override UnityEvent<WorldObjectType> GetUnityEvent() { return response; }
  }
}
