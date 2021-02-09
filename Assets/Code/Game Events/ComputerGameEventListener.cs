using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;
using Code.World_Objects.Computer;

namespace Code.Game_Events {
  public class ComputerGameEventListener : GameEventListener<ComputerBehavior> {
    [Tooltip("The game event to listen to")]
    public ComputerGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public ComputerUnityEvent response;

    protected override GameEvent<ComputerBehavior> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<ComputerBehavior> GetUnityEvent() {
      return response;
    }
  }
}