using UnityEngine;

namespace Code {
  //Represents a single Staff member
  public class StaffBehavior : MonoBehaviour {
    [SerializeField] private StaffDataObject _data;

    public StaffDataObject Data {
      get => _data;
      set => _data = value;
    }

  }
}