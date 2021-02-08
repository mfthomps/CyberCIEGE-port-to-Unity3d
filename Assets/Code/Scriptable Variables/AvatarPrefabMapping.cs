using System;
using System.Collections.Generic;
using Code.World_Objects.User;
using NaughtyAttributes;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Scriptable_Variables {
  [Serializable]
  public class GenderToGameObject {
    public UserGender _gender;
    public GameObject _prefab;
  }

  //A ScriptableVariable that contains a list of User Genders to GameObjects.
  //Used for creating new Users with the correct avatar mesh.
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Avatar Mapping")]
  public class AvatarPrefabMapping : ScriptableVariable {
    [ReorderableList]
    [SerializeField] private List<GenderToGameObject> _prefabs = new List<GenderToGameObject>();

    //Get the first prefab that matches the supplied Gender. Null if one is not defined.
    public GameObject GetPrefab(UserGender gender) {
      var mapping = _prefabs.Find(x => x._gender == gender);
      return mapping?._prefab;
    }
  }
}