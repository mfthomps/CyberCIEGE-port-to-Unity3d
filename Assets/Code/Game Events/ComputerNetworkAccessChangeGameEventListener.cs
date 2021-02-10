using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;
using Code.User_Interface.Components;

namespace Code.Game_Events {
  public class ComputerNetworkAccessChangeGameEventListener : GameEventListener<ComputerNetworkAccessChange> {
    [Tooltip("The game event to listen to")]
    public ComputerNetworkAccessChangeGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public ComputerNetworkAccessChangeUnityEvent response;

    protected override GameEvent<ComputerNetworkAccessChange> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<ComputerNetworkAccessChange> GetUnityEvent() {
      return response;
    }
  }
}