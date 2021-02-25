using System;
using UnityEngine.Events;
using Code.User_Interface.Dialog;

namespace Code.Game_Events {
  [Serializable]
  public class ConfirmationRequestUnityEvent : UnityEvent<ConfirmationRequest>{}
}