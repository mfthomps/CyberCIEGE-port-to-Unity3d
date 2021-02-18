using UnityEngine;

namespace Code.ViewPoint {
  //represents a single Camera ViewPoint in the scenario
  public class ViewPoint : MonoBehaviour {
    [SerializeField] private ViewPointDataObject _data;

    //-------------------------------------------------------------------------
    public ViewPointDataObject Data {
      get => _data;
      set => _data = value;
    }
  }
}