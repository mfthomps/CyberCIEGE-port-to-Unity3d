using Code.World_Objects.Character;
using UnityEngine;

namespace Code.World_Objects.Staff {
  //Represents a single Staff member
  public class StaffBehavior : BaseCharacter {

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
    
    //---------------------------------------------------------------------------
    public override CharacterDataObject GetCharacterData() {
      return _data;
    }
    
    // ------------------------------------------------------------------------
    public void SetHired(bool isHired) {
      Data.SetHired(isHired);
      gameObject.SetActive(isHired);
      ValueChanged();
    }
  }
}