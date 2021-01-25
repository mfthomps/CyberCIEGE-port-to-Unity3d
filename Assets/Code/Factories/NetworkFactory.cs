using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.World_Objects.Network;

namespace Code.Factories {
  // Factory that create Network GameObjects
  public class NetworkFactory : MonoBehaviour, iFactory {
    [SerializeField] private NetworkBehavior _prefab;

    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the Networks currently in the scenario.")]
    [SerializeField] private NetworkListVariable networkListVariable;

    private static Queue<Color> _networkColors = new Queue<Color>(new List<Color> { Color.red, Color.green, Color.blue, Color.yellow, Color.cyan, Color.magenta} );
    private readonly string NETWORKS = "networks.sdf";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      networkListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      var item = Instantiate(_prefab, parent);
      item.Data = LoadOneNetwork(filename, item);
      UpdateGameObject(item);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadNetworks(path, parent);
    }

    //-------------------------------------------------------------------------
    private void LoadNetworks(string path, Transform parent = null) {
      networkListVariable.Clear();

      string filePath = Path.Combine(path, NETWORKS);
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.ASCII);

        using (reader) {
          string tag;
          //Debug.Log("LoadNetworks read from " + filePath);
          var value = ccUtils.SDTNext(reader, out tag);
          while (value != null) {
            if (tag == "Network") {
              Create(value, parent);
              value = ccUtils.SDTNext(reader, out tag);
            }
            else {
              Debug.Log("LoadNetwork found unexpected tag " + tag);
              Debug.Break();
              break;
            }
          }
        }
      }
      catch (Exception e) {
        Debug.LogError(e);
      }
    }
    
    //-------------------------------------------------------------------------
    public NetworkDataObject LoadOneNetwork(string sdf, NetworkBehavior newNetwork) {
      var data = new NetworkDataObject();

      //Debug.Log("LoadOneNetwork");
      MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(sdf ?? ""));
      data.name = ccUtils.SDTField(stream, "Name");
      data.isStatic = ccUtils.SDTFieldDefault(stream, "Static", false);
      data.isLeased = ccUtils.SDTFieldDefault(stream, "Leased", false);
      data.color = _networkColors.Dequeue();
      _networkColors.Enqueue(data.color);

      return data;
    }

    //-------------------------------------------------------------------------
    private void UpdateGameObject(NetworkBehavior device) {
      device.name = $"Network - {device.Data.name}";

      //add it to the device list.
      networkListVariable.Add(device);
    }
  }
}