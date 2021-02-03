using System;
using System.IO;
using System.Text;
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

    //-------------------------------------------------------------------------
    void OnDestroy() {
      assetGoalListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      assetGoalListVariable.Clear();

      string filePath = Path.Combine(path, GOALS);
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.ASCII);

        using (reader) {
          string tag;
          var value = ccUtils.SDTNext(reader, out tag);
          while (value != null) {
            switch (tag) {
              case "AssetGoal":
                var data = new AssetGoalDataObject();
                using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""))) {
                  using (var substream = new StreamReader(stream)) {
                    var v = ccUtils.SDTNext(substream, out string t);
                    while (v != null) {
                      switch (t) {
                        case "Name":
                          data.name = v;
                          break;
                        case "Description":
                          data.description = v;
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
    private void CreateGameObject(AssetGoalDataObject data, Transform parent) {
      var group = Instantiate(_prefab, parent);
      group.name = $"AssetGoal - {data.name}";
      group.Data = data;

      //add it to the device list.
      assetGoalListVariable.Add(group);
    }
  }
}