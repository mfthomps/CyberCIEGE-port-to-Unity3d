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
    [Header("Input Variables")]
    [Tooltip("Prefab for a NetworkBehavior that represents a Network in the scenario.")]
    [SerializeField] private NetworkBehavior _prefab;
    [Tooltip("The list of properties for the scenario's organization.")]
    [SerializeField] private StringStringVariable _organizationDict;
    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Networks currently in the scenario.")]
    [SerializeField] private NetworkListVariable networkListVariable;

    private static Queue<Color> _networkColors = new Queue<Color>(new List<Color> { Color.red, Color.green, Color.blue, Color.yellow, Color.cyan, Color.magenta} );
    private readonly string NETWORKS = "networks.sdf";
    private readonly string ORGANIZATION_HAS_INTERNET = "Internet";
    private readonly string ORGANIZATION_INTERNET_NETWORK_NAME = "InternetName";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      networkListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      var item = Instantiate(_prefab, parent);
      item.Data = ParseNetworkData(filename, item);
      UpdateGameObject(item);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadNetworks(path, parent);
    }

    //-------------------------------------------------------------------------
    private void LoadNetworks(string path, Transform parent = null) {
      networkListVariable.Clear();

      // Add an "Internet" network if our organization has the internet
      if (_organizationDict.ContainsKey(ORGANIZATION_HAS_INTERNET) &&
          bool.Parse(_organizationDict[ORGANIZATION_HAS_INTERNET])) {
        var item = Instantiate(_prefab, parent);
        item.Data = CreateNetworkData(_organizationDict[ORGANIZATION_INTERNET_NETWORK_NAME], true, false);
        item.Data.isInternet = true;
        UpdateGameObject(item);
      }

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
    private NetworkDataObject ParseNetworkData(string sdf, NetworkBehavior newNetwork) {
      MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(sdf ?? ""));
      var name = ccUtils.SDTField(stream, "Name");
      var isStatic = ccUtils.SDTFieldDefault(stream, "Static", false);
      var isLeased = ccUtils.SDTFieldDefault(stream, "Leased", false);
      return CreateNetworkData(name, isStatic, isLeased);
    }

    //-------------------------------------------------------------------------
    private NetworkDataObject CreateNetworkData(string name, bool isStatic, bool isLeased) {
      var data = new NetworkDataObject();

      data.name = name;
      data.isStatic = isStatic;
      data.isLeased = isLeased;
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