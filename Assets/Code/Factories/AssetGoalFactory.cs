﻿using System;
using System.IO;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.AssetGoal;

namespace Code.Factories {
  // Factory that create AssetGoal GameObjects
  public class AssetGoalFactory : MonoBehaviour, iFactory {
    [Header("Input Variables")]
    [Tooltip("Prefab for a AssetGoalBehavior that represents a AssetGoal in the scenario.")]
    [SerializeField] private AssetGoalBehavior _prefab;
    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the AssetGoals currently in the scenario.")]
    [SerializeField] private AssetGoalListVariable assetGoalListVariable;

    private readonly string GOALS = "goals.sdf";
    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Asset Goals").transform;
    }

    //-------------------------------------------------------------------------
    void OnDestroy() {
      assetGoalListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      assetGoalListVariable.Clear();

      string filePath = Path.Combine(path, GOALS);
      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "AssetGoal") {
          var data = new AssetGoalDataObject();
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                data.name = subValue;
                break;
              case "Description":
                data.description = subValue;
                break;
            }
          });
          CreateGameObject(data, _parent);
        }
      });
    }
    
    //-------------------------------------------------------------------------
    private void CreateGameObject(AssetGoalDataObject data, Transform parent) {
      var group = Instantiate(_prefab, _parent);
      group.name = $"AssetGoal - {data.name}";
      group.Data = data;

      //add it to the device list.
      assetGoalListVariable.Add(group);
    }
  }
}