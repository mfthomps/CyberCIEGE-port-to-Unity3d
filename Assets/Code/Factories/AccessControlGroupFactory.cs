using System;
using System.IO;
using System.Text;
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

      // Add a group for the public
      var publicData = new AccessControlGroupDataObject();
      publicData.name = "Public";
      CreateGameObject(publicData, parent);

      string filePath = Path.Combine(path, GROUPS);
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.ASCII);

        using (reader) {
          string tag;
          ccUtils.PositionAfter(reader, "DACGroups");
          var value = ccUtils.SDTNext(reader, out tag);
          while (value != null) {
            if (value != "end") {
              var data = new AccessControlGroupDataObject();
              data.name = value;
              data.domain = ccUtils.SDTNext(reader, out tag);
              data.background = ccUtils.SDTNext(reader, out tag);
              CreateGameObject(data, parent);
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
    private void CreateGameObject(AccessControlGroupDataObject data, Transform parent) {
      var group = Instantiate(_prefab, parent);
      group.name = $"AccessControlGroup - {data.name}";
      group.Data = data;

      //add it to the device list.
      accessControlGroupListVariable.Add(group);
    }
  }
}