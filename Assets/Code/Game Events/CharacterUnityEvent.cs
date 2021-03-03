using System;
using Code.World_Objects.Character;
using UnityEngine.Events;

namespace Code.Game_Events {
  //A UnityEvent that has a parameter of type BaseCharacter
  [Serializable]
  public class CharacterUnityEvent : UnityEvent<BaseCharacter> {
  }
}