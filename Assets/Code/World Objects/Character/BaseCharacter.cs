using Code.World_Objects.User;
using UnityEngine;

namespace Code.World_Objects.Character {
  
  //Contains the basic functionality of a character in the scenario
  public abstract class BaseCharacter : Navigator {
    [Header("UI Elements")]
    [SerializeField] protected SpeechBubble _speechBubble;

    //---------------------------------------------------------------------------
    public abstract CharacterDataObject GetCharacterData();
    
    //---------------------------------------------------------------------------
    public void UpdateSpeechText(string speechText) {
      _speechBubble.SetSpeechText(speechText);
    }
    
    //---------------------------------------------------------------------------
    public void UpdateHappiness(int value) {
      GetCharacterData().happiness = value;
      ValueChanged();
    }
    
    //---------------------------------------------------------------------------
    public void UpdateProductivity(int value) {
      GetCharacterData().productivity = value;
      ValueChanged();
    }
    
    //---------------------------------------------------------------------------
    public void UpdateCurrentThought(string thought) {
      GetCharacterData().current_thought = thought;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateVisitingObject(string visiting) {
      GetCharacterData().Visiting = visiting;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateStayAtVisitingObject(bool stay) {
      GetCharacterData().Stay = stay;
      ValueChanged();
    }
  }
}