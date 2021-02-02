using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.Factories {
  //A factory that creates Asset instances
  public class AssetFactory : MonoBehaviour, iFactory {
    public static Dictionary<string, AssetBehavior> asset_dict = new Dictionary<string, AssetBehavior>();
    
    [Tooltip("The prefab to instantiate for new Assets")]
    [SerializeField] private AssetBehavior _prefab;
    
    [Tooltip("The list of users in the scenario")]
    [SerializeField] private UserListVariable _userList;

    private static readonly string ASSETS = "assets";
    
    //--------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //--------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadAssets(path, parent);
    }
    
    //--------------------------------------------------------------------------
    private void LoadAssets(string path, Transform parent = null) {
      string asset_dir = Path.Combine(path, ASSETS);
      string[] clist = Directory.GetFiles(asset_dir);
      foreach (string asset_file in clist)
        if (asset_file.EndsWith(".sdf")) {
          LoadOneAsset(asset_file);
        }
    }
    
    //--------------------------------------------------------------------------
    private void LoadOneAsset(string assetFile, Transform parent = null) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, assetFile);

      AssetBehavior asset = Instantiate(_prefab, parent);
      asset.gameObject.SetActive(true);
      
      var data = LoadAsset(cfile, asset);
      asset.Data = data;
      asset.gameObject.name = $"Asset--{asset.Data.AssetName}";
    }

    //----------------------------------------------------------------------------
    private AssetDataObject LoadAsset(string filePath, AssetBehavior newAsset) {
      AssetDataObject data = new AssetDataObject();
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.Default);
        using (reader) {
          ccUtils.PositionAfter(reader, "Asset");
          string value = null;
          do {
            value = ccUtils.SDTNext(reader, out string tag);
            if (value == null || tag == null) {
              continue;
            }

            switch (tag) {
              case "Name":
                data.AssetName = value;
                asset_dict.Add(data.AssetName, newAsset);
                break;
              case "ActualAccessList":
                data.DACAccess = new DACAccess(value, newAsset, _userList);
                break;
            }
          } while (value != null);
        }
      }
      catch (Exception e) {
        Debug.LogError(e.ToString());
      }
      return data;
    }
  }
}