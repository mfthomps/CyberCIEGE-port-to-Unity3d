using System;
using System.IO;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.Clearance;

namespace Code.Factories {
  // Factory that create Clearance GameObjects
  public class ClearanceFactory : MonoBehaviour, iFactory {
    [Header("Input Variables")]
    [Tooltip("Prefab for a ClearanceBehavior that represents a Clearance in the scenario.")]
    [SerializeField] private ClearanceBehavior _prefab;
    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Clearances currently in the scenario.")]
    [SerializeField] private ClearanceListVariable clearanceListVariable;

    private readonly string LABELS = "labels.sdf";
    private Transform _parent;
    private const string TAG_SECRECY = "Secrecy";
    private const string TAG_INTEGRITY = "Integrity";

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Clearances").transform;
    }
    
    //-------------------------------------------------------------------------
    void OnDestroy() {
      clearanceListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      clearanceListVariable.Clear();

      string filePath = Path.Combine(path, LABELS);
      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        switch (tag) {
          case TAG_SECRECY:
          case TAG_INTEGRITY:
            var data = new ClearanceDataObject();
            data.type = GetType(tag);
            ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
              switch (subTag) {
                case "Name":
                  data.name = subValue;
                  break;
                case "InitialBackGroundCheck":
                  data.backgroundCheckLevel = BackgroundCheck.FromString(subValue);
                  break;
                case "Level":
                  if (!int.TryParse(subValue, out data.level)) {
                    Debug.LogError($"Error: ClearanceFactory parsing level: {subValue}");
                  }
                  break;
              }
            });
            CreateGameObject(data, _parent);
            break;
        }
      });
    }
    
    //-------------------------------------------------------------------------
    private void CreateGameObject(ClearanceDataObject data, Transform parent) {
      var group = Instantiate(_prefab, _parent);
      group.name = $"Clearance - {data.name}";
      group.Data = data;

      //add it to the device list.
      clearanceListVariable.Add(group);
    }

    //-------------------------------------------------------------------------
    private ClearanceDataObject.ClearanceType GetType(string tag) {
      switch (tag) {
        case TAG_SECRECY:
          return ClearanceDataObject.ClearanceType.Secrecy;
        case TAG_INTEGRITY:
          return ClearanceDataObject.ClearanceType.Integrity;
      }
      return ClearanceDataObject.ClearanceType.Invalid;
    }
  }
}