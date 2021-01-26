using UnityEngine.Events;
using Code.World_Objects.Network;

namespace Code.Game_Events {
  [System.Serializable]
  public class NetworkBehaviorUnityEvent : UnityEvent<NetworkBehavior> {}
}
