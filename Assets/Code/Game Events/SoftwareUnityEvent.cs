using System;
using UnityEngine.Events;
using Code.Software;

namespace Code.Game_Events {
  [Serializable]
  public class SoftwareUnityEvent : UnityEvent<SoftwareBehavior>{}
}