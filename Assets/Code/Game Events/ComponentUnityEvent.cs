using System;
using UnityEngine.Events;

namespace Code.Game_Events {
  [Serializable]
  public class ComponentUnityEvent : UnityEvent<ComponentBehavior>{}
}