using Code.World_Objects.Character;
using Shared.ScriptableVariables;
using UnityEngine;
using UnityEngine.Events;

namespace Code.Game_Events {
  //A GameEventListener that listens to CharacterGameEvents
  public class CharacterGameEventListener : GameEventListener<BaseCharacter> {
    [Tooltip("The game event to listen to")]
    public CharacterGameEvent eventToListenTo;

    [Tooltip("The UnityEvent to raise in response to the game event being raised")]
    public CharacterUnityEvent response;
    
    protected override GameEvent<BaseCharacter> GetGameEvent() {
      return eventToListenTo;
    }

    protected override UnityEvent<BaseCharacter> GetUnityEvent() {
      return response;
    }
  }
}