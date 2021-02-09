using System;
using System.IO;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.Software;

namespace Code.Factories {
  // Factory that create Software GameObjects
  public class SoftwareFactory : MonoBehaviour, iFactory {
    [Header("Input Variables")]
    [Tooltip("Prefab for a SoftwareBehavior that represents a Software in the scenario.")]
    [SerializeField] private SoftwareBehavior _prefab;
    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Softwares currently in the scenario.")]
    [SerializeField] private SoftwareListVariable softwareListVariable;

    private readonly string SOFTWARE = "software.sdf";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      softwareListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      softwareListVariable.Clear();

      var filePath = Path.Combine(path, SOFTWARE);
      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "Applications") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            if (subTag == "Application") {
              var software = new SoftwareDataObject();
              ccUtils.ParseSDFFileSubElement(subValue, (applicationTag, applicationValue) => {
                switch (applicationTag) {
                  case "Name":
                    software.name = applicationValue;
                    break;
                  case "Cost":
                    if (!int.TryParse(applicationValue, out software.cost)) {
                      Debug.Log($"Error: SoftwareFactory parsing cost {applicationValue}");
                    }
                    break;
                  case "OS":
                    software.validOSes.Add(applicationValue);
                    break;
                }
              });
              CreateGameObject(software, parent);
            }
          });
        }
      });
    }
    
    //-------------------------------------------------------------------------
    private void CreateGameObject(SoftwareDataObject data, Transform parent) {
      var group = Instantiate(_prefab, parent);
      group.name = $"Software - {data.name}";
      group.Data = data;

      //add it to the device list.
      softwareListVariable.Add(group);
    }
  }
}