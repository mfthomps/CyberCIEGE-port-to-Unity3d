using System;
using Code.Scriptable_Variables;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.ViewPoint {
  //Responsible for managing a list of ViewPoints that the player can cycle through to
  //see the different Buildings.
  public class OffsiteViewPointManager : MonoBehaviour {
    [Tooltip("Inputs")]
    [SerializeField] private ViewPointListVariable _viewPointList;
    [SerializeField] private ZoneListVariable _zoneList;
    
    [Tooltip("Outputs")]
    [SerializeField] private ViewPointListVariable _offsiteViewPointList;

    //-------------------------------------------------------------------------
    private void Awake() {
      _viewPointList.OnValueChanged += OnListChanged;
      _zoneList.OnValueChanged += OnListChanged;
      OnListChanged();
    }
    
  //-------------------------------------------------------------------------
    private void OnDestroy() {
      _viewPointList.OnValueChanged -= OnListChanged;
      _zoneList.OnValueChanged -= OnListChanged;
    }

    //-------------------------------------------------------------------------
    //Some Zone has changed its hidden status, recalculate the list of view points.
    public void OnZoneHiddenStatusChanged(bool hidden) {
      OnListChanged();
    }
    
    //-------------------------------------------------------------------------
    private void OnListChanged() {
      var availableZones = _zoneList.Value.FindAll(x => !x.Data.hidden);
   
      //For every ViewPoint that has a Site which matches an available Zone.
      _offsiteViewPointList.Clear();
      
      if (_viewPointList.Value.Count > 0) {
        //always start with the very first ViewPoint? Not sure about this.
        _offsiteViewPointList.Add(_viewPointList.Value[0]);
      }
      
      foreach (ViewPoint viewPoint in _viewPointList.Value) {
        if (availableZones.Exists(x => x.Data.ZoneName == viewPoint.Data.Site)) {
          if (!_offsiteViewPointList.Value.Contains(viewPoint)) {
            _offsiteViewPointList.Add(viewPoint);
          }
        }
      }
    }

  }
}