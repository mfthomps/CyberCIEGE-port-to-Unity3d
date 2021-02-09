using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;
using Code.World_Objects.Asset;

namespace Code.Game_Events {
  public class AssetGameEventListener : GameEventListener<AssetBehavior> {
    [Tooltip("The game event to listen to")]
    public AssetGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public AssetUnityEvent response;

    protected override GameEvent<AssetBehavior> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<AssetBehavior> GetUnityEvent() {
      return response;
    }
  }
}