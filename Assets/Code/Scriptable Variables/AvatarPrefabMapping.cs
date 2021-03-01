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
    public bool _isTaken;
  }
  //A ScriptableVariable that contains a list of User Genders to GameObjects.
  //Used for creating new Users with the correct avatar mesh.
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Avatar Mapping")]
  public class AvatarPrefabMapping : ScriptableVariable {
    [ReorderableList]
    [SerializeField] private List<GenderToGameObject> _prefabs = new List<GenderToGameObject>();

    //Get the first prefab that matches the supplied Gender. Null if one is not defined.
    public GameObject GetPrefab(UserGender gender) {
      var mapping = _prefabs.Find(x => x._gender == gender && x._isTaken == false);
      if (mapping == null && _prefabs.Exists(x => x._gender == gender)) {  // ran out of prefabs?
        this.Reset(gender);
        mapping = _prefabs.Find(x => x._gender == gender && x._isTaken == false);
      }
      int idx = _prefabs.FindIndex(x => x._prefab.name == mapping._prefab.name);
      _prefabs[idx]._isTaken = true;
      return mapping?._prefab;
    }

    // Required in case number of characters in scenario exceeds number of available
    // avatars/prefabs (all elements in list are taken). In that case we re-start from element 0.
    private void Reset(UserGender _gender) {
      foreach(GenderToGameObject _prefab in _prefabs) {
        if (_prefab._gender == _gender) {
          _prefab._isTaken = false;
        }
      }
    }

    public void Reset() {
      foreach (GenderToGameObject _prefab in _prefabs) {
        _prefab._isTaken = false;
      }
    }
  }
}
