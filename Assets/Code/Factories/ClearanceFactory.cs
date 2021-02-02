using System;
using System.IO;
using System.Text;
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
    [SerializeField] private ClearanceListVariable accessControlGroupListVariable;

    private readonly string LABELS = "labels.sdf";
    private const string TAG_SECRECY = "Secrecy";
    private const string TAG_INTEGRITY = "Integrity";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      accessControlGroupListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      accessControlGroupListVariable.Clear();

      string filePath = Path.Combine(path, LABELS);
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.ASCII);

        using (reader) {
          string tag;
          var value = ccUtils.SDTNext(reader, out tag);
          while (value != null) {
            switch (tag) {
              case TAG_SECRECY:
              case TAG_INTEGRITY:
                var data = new ClearanceDataObject();
                data.type = GetType(tag);
                using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""))) {
                  using (var substream = new StreamReader(stream)) {
                    var v = ccUtils.SDTNext(substream, out string t);
                    while (v != null) {
                      switch (t) {
                        case "Name":
                          data.name = v;
                          break;
                      }
                      v = ccUtils.SDTNext(substream, out t);
                    };
                  }
                }
                CreateGameObject(data, parent);
              break;
            }
            value = ccUtils.SDTNext(reader, out tag);
          }
        }
      }
      catch (Exception e) {
        Debug.LogError(e);
      }
    }
    
    //-------------------------------------------------------------------------
    private void CreateGameObject(ClearanceDataObject data, Transform parent) {
      var group = Instantiate(_prefab, parent);
      group.name = $"Clearance - {data.name}";
      group.Data = data;

      //add it to the device list.
      accessControlGroupListVariable.Add(group);
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