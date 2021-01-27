using UnityEngine;

namespace Code.World_Objects.Staff {
  //Represents a single Staff member
  public class StaffBehavior : MonoBehaviour {
    [SerializeField] private StaffDataObject _data;

    public StaffDataObject Data {
      get => _data;
      set => _data = value;
    }

    // ------------------------------------------------------------------------
    public void SetHired(bool isHired) {
      Data.SetHired(isHired);
      gameObject.SetActive(isHired);
    }
  }
}