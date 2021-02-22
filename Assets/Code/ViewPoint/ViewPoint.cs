using Code.World_Objects;
using UnityEngine;

namespace Code.ViewPoint {
  //represents a single Camera ViewPoint in the scenario
  public class ViewPoint : BaseWorldObject {
    [SerializeField] private ViewPointDataObject _data;
    [SerializeField] private Transform _from;
    [SerializeField] private Transform _to;

    //-------------------------------------------------------------------------
    public ViewPointDataObject Data {
      get => _data;
      set => _data = value;
    }

    public Transform From => _from;

    public Transform To => _to;

    //-------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.ViewPoint;
    }
    
  }
}