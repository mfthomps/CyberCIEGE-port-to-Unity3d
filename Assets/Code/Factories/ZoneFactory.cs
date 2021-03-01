using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.World_Objects.Zone;

namespace Code.Factories {
  //A Factory that creates Zones
  public class ZoneFactory : MonoBehaviour, iFactory {
    [Tooltip("The prefab to use when creating new Zones")] [SerializeField]
    private ZoneBehavior _prefab;

    [Header("Input Variables")]
    [Tooltip("List of policy lists that zones care about")]
    public List<PolicyListVariable> policies = new List<PolicyListVariable>();

    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Zones currently in the scenario.")]
    [SerializeField] private ZoneListVariable _zoneListVariable;

    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Zones").transform;
    }

    //-------------------------------------------------------------------------
    void OnDestroy() {
      _zoneListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new System.NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      LoadZones(path, _parent);
    }

    //-------------------------------------------------------------------------
    private void LoadZones(string path, Transform parent) {
      _zoneListVariable.Clear();

      var colors = new Color[6];
      colors[0] = Color.cyan;
      colors[1] = Color.red;
      colors[2] = Color.green;
      colors[3] = Color.blue;
      string zone_dir = Path.Combine(path, "zones");
      string[] clist = Directory.GetFiles(zone_dir);
      int i = 0;
      foreach (string zone_file in clist)
        if (zone_file.EndsWith(".sdf")) {
          LoadOneZone(zone_file, colors[i]);
          i++;
          if (i >= colors.Length) {
            i = 0;
          }
        }
    }

    //-------------------------------------------------------------------------
    private void LoadOneZone(string zone_file, Color color) {
      ZoneBehavior newZone = Instantiate(_prefab, new Vector3(1.0F, 0, 0), Quaternion.identity, _parent);

      newZone.gameObject.GetComponent<Renderer>().material.color = color;
      newZone.gameObject.SetActive(true);
      
      var data = CreateDataObject(zone_file);
      newZone.gameObject.name = $"Zone--{data.ZoneName}";
      
      newZone.Data = data;

      //add ourself to the zone list variable.
      _zoneListVariable.Add(newZone);

      DoPosition(newZone);
    }

    //-------------------------------------------------------------------------
    private void DoPosition(ZoneBehavior zone) {
      int left = zone.Data.ulc_x;
      int right = zone.Data.lrc_x;
      int top = zone.Data.ulc_y;
      int bottom = zone.Data.lrc_y;
      Vector3 scale = new Vector3();
      Vector3 pos = new Vector3 {x = left + (right - left) / 2, z = bottom + (top - bottom) / 2};
      zone.transform.position = pos;
      scale.x = (right - left) / 10.0f;
      scale.z = (top - bottom) / 10.0f;

      scale.y = 1;
      zone.transform.localScale = scale;
    }

    //-------------------------------------------------------------------------
    private ZoneDataObject CreateDataObject(string zoneFile) {
      ZoneDataObject data = new ZoneDataObject();

      ccUtils.ParseSDFFile(zoneFile, (tag, value) => {
        if (tag == "Zone") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                data.ZoneName = subValue;
                string lowerName = subValue.ToLower();
                if (lowerName.Contains("entire") && data.RootZoneName == null) {
                  data.RootZoneName = data.ZoneName;
                }
                break;
              case "ULC":
                string[] parts = subValue.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                if (!int.TryParse(parts[0], out data.ulc_x)) {
                  Debug.Log($"Error: ZoneBehavior parsing ULC X {subValue}");
                }

                if (!int.TryParse(parts[1], out data.ulc_y)) {
                  Debug.Log($"Error: ZoneBehavior parsing ULC Y {subValue}");
                }

                break;
              case "LRC":
                parts = subValue.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                if (!int.TryParse(parts[0], out data.lrc_x)) {
                  Debug.Log($"Error: ZoneBehavior parsing LRC X {subValue}");
                }

                if (!int.TryParse(parts[1], out data.lrc_y)) {
                  Debug.Log($"Error: ZoneBehavior parsing LRC Y {subValue}");
                }

                break;
              case "PermittedUsers":
                data.permittedUsers.Add(subValue);
                break;
              case "ExcludeNetwork":
                data.excludedNetworks.Add(subValue);
                break;
              case "Secrecy":
                data.secrecy = subValue;
                break;
              case "Integrity":
                data.integrity = subValue;
                break;
              case "Site":
                data.domain = subValue;
                break;
              case "Description":
                data.description = subValue;
                break;
              default:
                AddEnabledPolicy(data, subTag, subValue);
                break;
            }
          });
        }
      });

      return data;
    }

    // ------------------------------------------------------------------------
    private void AddEnabledPolicy(ZoneDataObject zoneData, string policyTag, string policySubTag) {
      foreach (var policy in policies) {
        var enabledPolicy = policy.GetPolicy(policyTag, policySubTag);
        if (enabledPolicy != null) {
          zoneData.enabledPolicies.Add(enabledPolicy.GetName());
        }
      }
    }
  }
}