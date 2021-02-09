using System;
using UnityEngine.Events;
using Code.World_Objects.Computer;

namespace Code.Game_Events {
  [Serializable]
  public class ComputerUnityEvent : UnityEvent<ComputerBehavior>{}
}