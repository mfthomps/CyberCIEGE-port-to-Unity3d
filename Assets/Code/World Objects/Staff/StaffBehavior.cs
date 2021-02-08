using UnityEngine;

namespace Code.World_Objects.Staff {
  //Represents a single Staff member
  public class StaffBehavior : BaseWorldObject {
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
  }
}