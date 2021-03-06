﻿using System;
using System.IO;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.AccessControlGroup;

namespace Code.Factories {
  // Factory that create AccessControlGroup GameObjects
  public class AccessControlGroupFactory : MonoBehaviour, iFactory {
    [Header("Input Variables")]
    [Tooltip("Prefab for a AccessControlGroupBehavior that represents a AccessControlGroup in the scenario.")]
    [SerializeField] private AccessControlGroupBehavior _prefab;
    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the AccessControlGroups currently in the scenario.")]
    [SerializeField] private AccessControlGroupListVariable accessControlGroupListVariable;

    private readonly string GROUPS = "groups.sdf";
    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Access Control Groups").transform;
    }

    //-------------------------------------------------------------------------
    void OnDestroy() {
      accessControlGroupListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      accessControlGroupListVariable.Clear();

      // Add a group for the public
      var publicData = new AccessControlGroupDataObject();
      publicData.name = "Public";
      CreateGameObject(publicData, _parent);

      var filePath = Path.Combine(path, GROUPS);
      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "DACGroups") {
          AccessControlGroupDataObject currentGroup = null;
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Group":
                // If we had a previous group we were working on, add it to our list
                if (currentGroup != null) {
                  CreateGameObject(currentGroup, _parent);
                }
                currentGroup = new AccessControlGroupDataObject();
                currentGroup.name = subValue;
                break;
              case "Domain":
                currentGroup.domain = subValue;
                break;
              case "InitialBackGroundCheck":
                currentGroup.backgroundCheckLevel = BackgroundCheck.FromString(subValue);
                break;
            }
          });
          // If we had a previous group we were working on, add it to our list
          if (currentGroup != null) {
            CreateGameObject(currentGroup, _parent);
          }
        }
      });
    }
    
    //-------------------------------------------------------------------------
    private void CreateGameObject(AccessControlGroupDataObject data, Transform parent) {
      var group = Instantiate(_prefab, _parent);
      group.name = $"AccessControlGroup - {data.name}";
      group.Data = data;

      //add it to the device list.
      accessControlGroupListVariable.Add(group);
    }
  }
}