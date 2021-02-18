using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //This class is responsible for creating and placing the 3D model of the office
  public class OfficeModelFactory : MonoBehaviour {
    [Tooltip("The property name, defined in the Organization's properties, which " +
             "maps to the office 3D model.")]
    [SerializeField] private string _officePropertyName = "MainOfficeVersion";
    
    [Tooltip("The ScriptableVariable that maps magic strings to actual 3D model prefabs.")]
    [SerializeField] private StringToPrefabMappingObject _prefabMapping;
    
    //This is called when the properties of an Organization have changed. If the correct
    //property has changed, try to find a prefab that corresponds and instantiate it.
    public void OrganizationPropertiesChanged(string key, string value) {
      if (key == _officePropertyName) {
        CreateModel(value);
      }
    }

    //-------------------------------------------------------------------------
    private void CreateModel(string prefabKey) {
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