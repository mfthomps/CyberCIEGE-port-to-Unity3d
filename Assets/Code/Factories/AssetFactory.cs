using System.Collections.Generic;
using System.IO;
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
      AssetBehavior asset = Instantiate(_prefab, parent);
      asset.gameObject.SetActive(true);
      
      var data = LoadAsset(assetFile, asset);
      asset.Data = data;
      asset.gameObject.name = $"Asset--{asset.Data.AssetName}";
    }

    //----------------------------------------------------------------------------
    private AssetDataObject LoadAsset(string filePath, AssetBehavior newAsset) {
      AssetDataObject data = new AssetDataObject();

      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "Asset") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                data.AssetName = subValue;
                asset_dict.Add(data.AssetName, newAsset);
                break;
              case "ActualAccessList":
                data.DACAccess = new DACAccess(subValue, newAsset, _userList);
                break;
            }
          });
        }
      });

      return data;
    }
  }
}