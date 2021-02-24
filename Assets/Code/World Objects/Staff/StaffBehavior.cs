using Code.World_Objects.User;
using UnityEngine;

namespace Code.World_Objects.Staff {
  //Represents a single Staff member
  public class StaffBehavior : Navigator {
    [Header("UI Elements")]
    [SerializeField] private SpeechBubble _speechBubble;

    [Header("Data")]
    [SerializeField] private StaffDataObject _data;

    // ------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Staff;
    }
    
    // ------------------------------------------------------------------------
    public StaffDataObject Data {
      get => _data;
      set => _data = value;
    }

    // ------------------------------------------------------------------------
    public void SetHired(bool isHired) {
      Data.SetHired(isHired);
      gameObject.SetActive(isHired);
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateCurrentThought(string thought) {
      Data.current_thought = thought;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateSpeechText(string speechText) {
      _speechBubble.SetSpeechText(speechText);
    }

    //---------------------------------------------------------------------------
    public void UpdateHappiness(int value) {
      Data.happiness = value;
      ValueChanged();
    }

    //---------------------------------------------------------------------------
    public void UpdateProductivity(int value) {
      Data.productivity = value;
      ValueChanged();
    }
  }
}