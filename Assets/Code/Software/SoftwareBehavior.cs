using UnityEngine;

namespace Code.Software {
  public class SoftwareBehavior : MonoBehaviour {
    [SerializeField] private SoftwareDataObject _data;

    public SoftwareDataObject Data {
      get => _data;
      set => _data = value;
    }
  }
}
