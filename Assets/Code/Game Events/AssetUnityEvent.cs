using System;
using UnityEngine.Events;
using Code.World_Objects.Asset;

namespace Code.Game_Events {
  [Serializable]
  public class AssetUnityEvent : UnityEvent<AssetBehavior>{}
}