using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;
using Code.User_Interface.Dialog;

namespace Code.Game_Events {
  public class ConfirmationRequestGameEventListener : GameEventListener<ConfirmationRequest> {
    [Tooltip("The game event to listen to")]
    public ConfirmationRequestGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public ConfirmationRequestUnityEvent response;

    protected override GameEvent<ConfirmationRequest> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<ConfirmationRequest> GetUnityEvent() {
      return response;
    }
  }
}