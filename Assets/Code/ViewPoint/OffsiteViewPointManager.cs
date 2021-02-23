using System;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.ViewPoint {
  public class OffsiteViewPointManager : MonoBehaviour {
    [Tooltip("Inputs")]
    [SerializeField] private ViewPointListVariable _viewPointList;
    [SerializeField] private ZoneListVariable _zoneList;
    
    [Tooltip("Outputs")]
    [SerializeField] private ViewPointListVariable _offsiteViewPointList;

    private void Awake() {
      _viewPointList.OnValueChanged += OnListChanged;
      _zoneList.OnValueChanged += OnListChanged;
      OnListChanged();
    }


    private void OnDestroy() {
      _viewPointList.OnValueChanged -= OnListChanged;
      _zoneList.OnValueChanged -= OnListChanged;
    }
    
    private void OnListChanged() {
      var offsiteZones = _zoneList.Value.FindAll(x => x.Data.ulc_x > 80 && !x.Data.hidden);
      foreach (var zone in offsiteZones) {
        Debug.Log($"Offset zone: {zone.Data.ZoneName}");
      }
    }

  }
}