using Code.World_Objects.User;
using UnityEngine;

namespace Code.World_Objects.Character {
  
  //Contains the basic functionality of a character in the scenario
  public abstract class BaseCharacter : Navigator {
    [Header("UI Elements")]
    [SerializeField] protected SpeechBubble _speechBubble;

    //---------------------------------------------------------------------------
    protected abstract CharacterDataObject GetData();
    
    //---------------------------------------------------------------------------
    public void UpdateSpeechText(string speechText) {
      _speechBubble.SetSpeechText(speechText);
    }
    
    //---------------------------------------------------------------------------
    public void UpdateHappiness(int value) {
      GetData().happiness = value;
      ValueChanged();
    }
    
    //---------------------------------------------------------------------------
    public void UpdateProductivity(int value) {
      GetData().productivity = value;
      ValueChanged();
    }
    
    //---------------------------------------------------------------------------
    public void UpdateCurrentThought(string thought) {
      GetData().current_thought = thought;
      ValueChanged();
    }
  }
}