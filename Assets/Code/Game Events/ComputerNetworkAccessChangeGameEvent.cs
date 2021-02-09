using Shared.ScriptableVariables;
using UnityEngine;
using Code.User_Interface.Components;

namespace Code.Game_Events {
  // GameEvents with a ComputerNetworkAccessChange payload
  [CreateAssetMenu(menuName = "Scriptable Objects/Events/CC/Computer Network Access Change Game Event")]
  public class ComputerNetworkAccessChangeGameEvent : GameEvent<ComputerNetworkAccessChange> {
  }
}