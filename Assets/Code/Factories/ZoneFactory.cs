﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //A Factory that creates Zones
  public class ZoneFactory : MonoBehaviour, iFactory {
    [Tooltip("The prefab to use when creating new Zones")] [SerializeField]
    private ZoneBehavior _prefab;

    [Tooltip("The variable containing the game's list of policies available to the Computers.")] [SerializeField]
    private PolicyListVariable computerPolicyListVariable;

    [Tooltip("The variable containing the game's list of physical security policies available to the Zones.")]
    [SerializeField]
    private PolicyListVariable physicalPolicyListVariable;

    [SerializeField] private ZoneListVariable _zoneListVariable;

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadZones(path, parent);
    }

    //-------------------------------------------------------------------------
    private void LoadZones(string path, Transform parent) {
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
        }
    }

    //-------------------------------------------------------------------------
    private void LoadOneZone(string zone_file, Color color) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, zone_file);

      ZoneBehavior newZone = Instantiate(_prefab, new Vector3(1.0F, 0, 0), Quaternion.identity);

      newZone.gameObject.GetComponent<Renderer>().material.color = color;
      newZone.gameObject.SetActive(true);
      
      var data = CreateDataObject(cfile);
      newZone.gameObject.name = $"Zone--{data.ZoneName}";
      
      newZone.Data = data;

      //add ourself to the zone list variable.
      var zoneList = _zoneListVariable.Value;
      zoneList.Add(newZone);
      _zoneListVariable.Value = new List<ZoneBehavior>(zoneList);

      DoPosition(newZone);
    }

    //-------------------------------------------------------------------------
    private static void DoPosition(ZoneBehavior zone) {
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
      ZoneDataObject data = new ZoneDataObject {
        ConfigSettings = new ConfigurationSettings(false, "", computerPolicyListVariable.Value),
        PhysSettings = new PhysicalSettings(physicalPolicyListVariable.Value)
      };

      StreamReader reader = new StreamReader(zoneFile, Encoding.Default);
      using (reader) {
        string tag;
        ccUtils.PositionAfter(reader, "Zone");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value == null)
            continue;
          if (value == "") {
            continue;
          }

          if (!data.ConfigSettings.HandleConfigurationSetting(tag, value))
            if (!data.PhysSettings.HandleConfigurationSetting(tag, value))
              switch (tag) {
                case "Name":
                  data.ZoneName = value;
                  data.ConfigSettings.SetName(data.ZoneName);
                  string lowerName = value.ToLower();
                  if (lowerName.Contains("entire") && data.RootZoneName == null) {
                    data.RootZoneName = data.ZoneName;
                  }

                  break;
                case "ULC":
                  string[] parts = value.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                  if (!int.TryParse(parts[0], out data.ulc_x)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return null;
                  }

                  if (!int.TryParse(parts[1], out data.ulc_y)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return null;
                  }

                  break;
                case "LRC":
                  parts = value.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                  if (!int.TryParse(parts[0], out data.lrc_x)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return null;
                  }

                  if (!int.TryParse(parts[1], out data.lrc_y)) {
                    Debug.Log("Error: ZoneBehavior parsing " + value);
                    return null;
                  }

                  break;
              }
        } while (value != null);
      }

      return data;
    }
  }
}