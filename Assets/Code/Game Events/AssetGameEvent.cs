using Shared.ScriptableVariables;
using UnityEngine;
using Code.World_Objects.Asset;

namespace Code.Game_Events {
  // GameEvents with a AssetBehavior payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Asset Game Event")]
  public class AssetGameEvent : GameEvent<AssetBehavior> {
  }
}