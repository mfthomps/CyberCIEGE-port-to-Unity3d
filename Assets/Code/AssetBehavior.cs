using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class AssetBehavior : MonoBehaviour {
  public static Dictionary<string, AssetBehavior> asset_dict = new Dictionary<string, AssetBehavior>();

  private string _assetName;
  public ComputerBehavior computer;
  private DACAccess dac_access;

  public string AssetName {
    get => _assetName;
    private set {
      _assetName = value;
      gameObject.name = $"Asset--{_assetName}";
    }
  }

  //----------------------------------------------------------------------------
  public void SetComputer(ComputerBehavior computer) {
    this.computer = computer;
  }

  //----------------------------------------------------------------------------
  public void LoadAsset(string filePath) {
    try {
      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        //Debug.Log("LoadAsset read from " + filePath);
        ccUtils.PositionAfter(reader, "Asset");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value == null)
            continue;
          //Debug.Log("LoadAsset got " + value + " for tag " + tag);
          switch (tag) {
            case "Name":
              AssetName = value;
              //Debug.Log("LoadAsset adding to dict: " + this.asset_name);
              asset_dict.Add(AssetName, this);
              break;
            case "ActualAccessList":
              //Debug.Log("AssetBehavior, LoadAsset ActualAccessList is " + value);
              dac_access = new DACAccess(value, this);
              //Debug.Log("dac string is "+GetDACString());
              break;
          }
        } while (value != null);
      }
    }
    catch (Exception e) {
      Debug.LogError(e.ToString());
    }
  }

  //----------------------------------------------------------------------------
  public string GetDACString() {
    return dac_access.ToString();
  }

  //----------------------------------------------------------------------------
  public DACAccess GetDACAccess() {
    return dac_access;
  }
}