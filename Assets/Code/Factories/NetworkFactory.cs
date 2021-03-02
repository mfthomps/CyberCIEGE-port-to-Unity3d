using System.Collections.Generic;
using System.IO;
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

    public readonly static string ORGANIZATION_INTERNET_NETWORK_NAME = "InternetName";

    private static Queue<Color> _networkColors = new Queue<Color>(new List<Color> { 
      new Color(1f, 0f, 0f, 1f), 
      new Color(0.01960784f, 0.8509804f, 0.02352941f, 1f), 
      new Color(0.1607843f, 0.509804f, 0.9686275f, 1f), 
      new Color(0.9607843f, 0.8156863f, 0.09411765f, 1f), 
      new Color(0f, 0.9098039f, 0.9333333f, 1f), 
      new Color(0.8784314f, 0.2117647f, 0.9921569f, 1f),
      new Color(0.9529412f, 0.3058824f, 0.03137255f, 1f)
    } );
    private readonly string NETWORKS = "networks.sdf";
    private readonly string ORGANIZATION_HAS_INTERNET = "Internet";
    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Networks").transform;
    }
    
    //-------------------------------------------------------------------------
    void OnDestroy() {
      networkListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      var item = Instantiate(_prefab, _parent);
      item.Data = ParseNetworkData(filename, item);
      UpdateGameObject(item);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      LoadNetworks(path, _parent);
    }

    //-------------------------------------------------------------------------
    private void LoadNetworks(string path, Transform parent = null) {
      networkListVariable.Clear();

      // Add an "Internet" network if our organization has the internet
      if (_organizationDict.ContainsKey(ORGANIZATION_HAS_INTERNET) &&
          bool.Parse(_organizationDict[ORGANIZATION_HAS_INTERNET])) {
        var item = Instantiate(_prefab, _parent);
        item.Data = CreateNetworkData(_organizationDict[ORGANIZATION_INTERNET_NETWORK_NAME], true, false);
        item.Data.isInternet = true;
        UpdateGameObject(item);
      }

      string filePath = Path.Combine(path, NETWORKS);
      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "Network") {
          Create(value);
        }
      });
    }
    
    //-------------------------------------------------------------------------
    private NetworkDataObject ParseNetworkData(string sdf, NetworkBehavior newNetwork) {
      string name = null;
      bool isStatic = false, isLeased = false;
      ccUtils.ParseSDFFileSubElement(sdf, (tag, value) => {
        switch (tag) {
          case "Name":
            name = value;
            break;
          case "Static":
            if (!bool.TryParse(value, out isStatic)) {
              Debug.Log($"Error: Can't parse NetworkFactory static parameter {value}");
            }
            break;
          case "Leased":
            if (!bool.TryParse(value, out isLeased)) {
              Debug.Log($"Error: Can't parse NetworkFactory static parameter {value}");
            }
            break;
        }
      });

      return CreateNetworkData(name, isStatic, isLeased);
    }

    //-------------------------------------------------------------------------
    private NetworkDataObject CreateNetworkData(string name, bool isStatic, bool isLeased) {
      var data = new NetworkDataObject();

      data.name = name;
      data.isStatic = isStatic;
      data.isLeased = isLeased;

      // Set the network color and put its color back to the end of the network color list
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