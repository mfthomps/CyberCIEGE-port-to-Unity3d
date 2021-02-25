using Shared.ScriptableVariables;
using UnityEngine;
using Code.User_Interface.Dialog;

namespace Code.Game_Events {
  // GameEvents with a ConfirmationRequest payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Confirmation Request Game Event")]
  public class ConfirmationRequestGameEvent : GameEvent<ConfirmationRequest> {
  }
}