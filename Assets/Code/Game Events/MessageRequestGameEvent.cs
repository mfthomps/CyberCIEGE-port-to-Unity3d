using Shared.ScriptableVariables;
using UnityEngine;
using Code.User_Interface.Dialog;

namespace Code.Game_Events {
  // GameEvents with a MessageRequest payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Message Request Game Event")]
  public class MessageRequestGameEvent : GameEvent<MessageRequest> {
  }
}