using System.Collections.Generic;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //This class is responsible for creating and placing the 3D model of the office
  public class OfficeModelFactory : MonoBehaviour {
    [Tooltip("The property names, defined in the Organization's properties, which " +
             "map to main office and remote office 3D models.")]
    [SerializeField] private List<string> _officePropertyNames = new List<string>();
    
    [Tooltip("The ScriptableVariable that maps magic strings to actual 3D model prefabs.")]
    [SerializeField] private StringToPrefabMappingObject _prefabMapping;

    //-------------------------------------------------------------------------
    //This is called when the properties of an Organization have changed. If the correct
    //property has changed, try to find a prefab that corresponds and instantiate it.
    public void OrganizationPropertiesChanged(string key, string value) {
      if (_officePropertyNames.Contains(key)) {
        CreateModel(value);
      }
    }

    //-------------------------------------------------------------------------
    private void CreateModel(string prefabKey) {
      //ignore any values that aren't defined.
      if (prefabKey == "none" || string.IsNullOrEmpty(prefabKey)) {
        return;
        
      }
      var prefab = _prefabMapping.GetPrefabByKey(prefabKey);
      if (prefab) {
        Instantiate(prefab);
      }
      else {
        Debug.LogError($"Could not find a prefab mapping for the office of type '{prefabKey}'");
      }
    }
  }
}