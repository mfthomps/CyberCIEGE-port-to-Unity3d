using System.IO;
using Code.Scriptable_Variables;
using Code.ViewPoint;
using UnityEngine;

namespace Code.Factories {
  //Responsible for creating new ViewPoints that are defined in the Scenario
  public class ViewPointFactory : MonoBehaviour, iFactory {
    [Header("Input Variables")]
    [Tooltip("Prefab for a ViewPoints that represents a ViewPoint.")]
    [SerializeField] private ViewPoint.ViewPoint _prefab;
    
    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the ViewPoints currently in the scenario.")]
    [SerializeField] private ViewPointListVariable _list;
    
    private const string ViewpointsSDF = "viewpoints.sdf";
    private Transform _parent;
    
    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("ViewPoints").transform;
    }

    //-------------------------------------------------------------------------
    public void OnDestroy() {
      _list.Clear();
    }
    
    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new System.NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      _list.Clear();
      LoadViewPoints(path);
    }

    //-------------------------------------------------------------------------
    private void LoadViewPoints(string path) {
      var fullPath = Path.Combine(path, ViewpointsSDF);
      ccUtils.ParseSDFFile(fullPath, (key, value) => {
        if (key == "VIEWPOINT") {
          Debug.Log("Found ViewPoint");
          var viewPoint = Instantiate(_prefab, _parent);
          var data = new ViewPointDataObject();
          viewPoint.Data = data;
          _list.Add(viewPoint);
          
          Vector3 from = new Vector3();
          Vector3 to = new Vector3();
          
          ccUtils.ParseSDFFileSubElement(value, (viewPointKey, viewPointValue) => {
            switch (viewPointKey) {
              case "FromX": float.TryParse(viewPointValue, out from.x); break;
              case "FromY": float.TryParse(viewPointValue, out from.y); break;
              case "FromZ": float.TryParse(viewPointValue, out from.z); break;
              case "ToX": float.TryParse(viewPointValue, out to.x); break;
              case "ToY": float.TryParse(viewPointValue, out to.y); break;
              case "ToZ": float.TryParse(viewPointValue, out to.z); break;
              case "MagicHeight": float.TryParse(viewPointValue, out data.MagicHeight); break;
              case "ZoomLevel": float.TryParse(viewPointValue, out data.ZoomLevel); break;
              case "SkipTab": bool.TryParse(viewPointValue, out data.SkipTab); break;
            }
          });

          data.From = from;
          data.To = to;
        }
      });
    }
  }
}