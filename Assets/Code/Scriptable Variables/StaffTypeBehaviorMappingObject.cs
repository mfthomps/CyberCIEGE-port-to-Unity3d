using System;
using System.Collections.Generic;
using NaughtyAttributes;
using Shared.ScriptableVariables;
using UnityEngine;
using Code.World_Objects.Staff;

namespace Code.Scriptable_Variables {
  
  //ScriptableVariable that has a list of StaffTypes to StaffBehavior prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Staff Type Prefab Mapping")]
  public class StaffTypeBehaviorMappingObject : ScriptableVariable{
    
    [Serializable]
    public class StaffTypePrefab {
      public StaffType key;
      public StaffBehavior prefab;
    }
    
    [SerializeField]
    [ReorderableList]
    private List<StaffTypePrefab> _mapping = new List<StaffTypePrefab>();

    //-------------------------------------------------------------------------
    //@return the found prefab or null, if the key wasn't found
    public StaffBehavior GetPrefabByKey(StaffType key) {
      for (int i = 0; i < _mapping.Count; i++) {
        if (_mapping[i].key == key) {
          return _mapping[i].prefab;
        }
      }

      return null;
    }
  }
}