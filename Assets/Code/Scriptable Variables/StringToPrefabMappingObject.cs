using System;
using System.Collections.Generic;
using NaughtyAttributes;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Scriptable_Variables {

  [Serializable]
  public class StringToPrefab {
    public string key;
    public GameObject prefab;
  }
  
  //This ScriptableObject is used to hold a static list of Strings to Prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/String to Prefab Mapping")]
  public class StringToPrefabMappingObject : ScriptableVariable {
    [SerializeField]
    [ReorderableList]
    private List<StringToPrefab> mapping = new List<StringToPrefab>();

    //-------------------------------------------------------------------------
    //@return the found prefab or null, if the key wasn't found
    public GameObject GetPrefabByKey(string key) {
      for (int i = 0; i < mapping.Count; i++) {
        if (mapping[i].key == key) {
          return mapping[i].prefab;
        }
      }

      return null;
    }
  }
}