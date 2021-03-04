using System;
using System.Collections.Generic;
using Code.Scriptable_Variables;
using Code.World_Objects.Office;
using NaughtyAttributes;
using UnityEngine;

namespace Code.Factories {
  //This class is responsible for creating and placing the 3D model of the office
  public class OfficeModelFactory : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The property names, defined in the Organization's properties, which " +
             "map to main office and remote office 3D models. The list order matters and" +
             " should have the main office first, with each offsite office listed in order.")]
    [ReorderableList]
    [SerializeField] private List<string> _officePropertyNames = new List<string>();
    
    [Tooltip("The ScriptableVariable that maps magic strings to actual 3D model prefabs.")]
    [SerializeField] private StringToPrefabMappingObject _prefabMapping;

    [Header("Output Variables")]
    [Tooltip("The ScriptableVariable that should contain the list of OfficeBuildings instantiated" +
             " for the currently loaded scenario.")]
    [SerializeField] private OfficeListVariable _officeList;

    //-------------------------------------------------------------------------
    private void Awake() {
      _officeList.Clear();
    }
    
    //-------------------------------------------------------------------------
    private void OnDestroy() {
      _officeList.Clear();
    }

    //-------------------------------------------------------------------------
    //This is called when the properties of an Organization have changed. If the correct
    //property has changed, try to find a prefab that corresponds and instantiate it.
    public void OrganizationPropertiesChanged(string key, string value) {
      if (_officePropertyNames.Contains(key)) {
        CreateModel(value, _officePropertyNames.IndexOf(key));
      }
    }

    //-------------------------------------------------------------------------
    private void CreateModel(string prefabKey, int listIndex) {
      const float buildingOffset = 30f;
      
      //ignore any values that aren't defined.
      if (prefabKey == "none" || string.IsNullOrEmpty(prefabKey)) {
        return;
      }

      var prefab = _prefabMapping.GetPrefabByKey(prefabKey);
      if (prefab) {
        var go = Instantiate(prefab);
        //offset the off-site buildings by a hard-coded amount.
        //Main office = 0 offset, 1st offsite = 0, 2nd offsite = 30, etc.
        float offset = Mathf.Max(0, (listIndex - 1) * buildingOffset);
        go.transform.Translate(0, 0, offset, Space.World);

        OfficeBuilding building = go.GetComponent<OfficeBuilding>();
        //the first in the list is considered the main office, he rest
        //are offsites.
        building.BuildingType = listIndex == 0 ? OfficeBuildingType.MainOffice : OfficeBuildingType.OffsiteOffice;
        _officeList.Add(building);
      }
      else {
        Debug.LogError($"Could not find a prefab mapping for the office of type '{prefabKey}'");
      }
    }
  }
}