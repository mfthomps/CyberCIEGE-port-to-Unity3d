using System;
using System.Collections.Generic;
using NaughtyAttributes;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Scriptable_Variables {
  
  //ScriptableVariable that has a list of Strings to StaffBehavior prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/String to Staff Prefab Mapping")]
  public class StringToStaffBehaviorMappingObject : ScriptableVariable{
    
    [Serializable]
    public class StringToStaffPrefab {
      public string key;
      public StaffBehavior prefab;
    }
    
    [SerializeField]
    [ReorderableList]
    private List<StringToStaffPrefab> _mapping = new List<StringToStaffPrefab>();

    //-------------------------------------------------------------------------
    //@return the found prefab or null, if the key wasn't found
    public StaffBehavior GetPrefabByKey(string key) {
      for (int i = 0; i < _mapping.Count; i++) {
        if (_mapping[i].key == key) {
          return _mapping[i].prefab;
        }
      }

      return null;
    }
  }
}