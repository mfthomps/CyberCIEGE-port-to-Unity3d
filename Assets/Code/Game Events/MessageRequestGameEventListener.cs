using UnityEngine;
using UnityEngine.Events;
using Shared.ScriptableVariables;
using Code.User_Interface.Dialog;

namespace Code.Game_Events {
  public class MessageRequestGameEventListener : GameEventListener<MessageRequest> {
    [Tooltip("The game event to listen to")]
    public MessageRequestGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public MessageRequestUnityEvent response;

    protected override GameEvent<MessageRequest> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<MessageRequest> GetUnityEvent() {
      return response;
    }
  }
}