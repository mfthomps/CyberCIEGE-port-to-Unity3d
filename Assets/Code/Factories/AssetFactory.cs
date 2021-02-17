using System;
using System.IO;
using System.Text.RegularExpressions;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.AccessControlGroup;
using Code.World_Objects.Asset;

namespace Code.Factories {
  //A factory that creates Asset instances
  public class AssetFactory : MonoBehaviour, iFactory {
    [Tooltip("The prefab to instantiate for new Assets")]
    [SerializeField] private AssetBehavior _prefab;

    [Header("Output Variables")]
    [Tooltip("The list of assets in the scenario")]
    [SerializeField] private AssetListVariable assets;
    
    [Header("Input Variables")]
    [Tooltip("The list of users in the scenario")]
    [SerializeField] private UserListVariable _userList;

    private static readonly string ASSETS = "assets";
    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Assets").transform;
    }

    //-------------------------------------------------------------------------
    void OnDestroy() {
      assets.Clear();
    }

    //--------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //--------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadAssets(path, _parent);
    }
    
    //--------------------------------------------------------------------------
    private void LoadAssets(string path, Transform parent = null) {
      assets.Clear();

      string asset_dir = Path.Combine(path, ASSETS);
      string[] clist = Directory.GetFiles(asset_dir);
      foreach (string asset_file in clist)
        if (asset_file.EndsWith(".sdf")) {
          LoadOneAsset(asset_file);
        }
    }
    
    //--------------------------------------------------------------------------
    private void LoadOneAsset(string assetFile, Transform parent = null) {
      AssetBehavior asset = Instantiate(_prefab, _parent);
      asset.gameObject.SetActive(true);
      
      var data = LoadAsset(assetFile, asset);
      asset.Data = data;
      asset.gameObject.name = $"Asset--{asset.Data.AssetName}";

      assets.Add(asset);
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
                break;
              case "Description":
                data.description = subValue;
                break;
              case "AccessList":
                var accessors = Regex.Matches(subValue, @"(\w+)[ ]+(\w+)");
                foreach (Match accessor in accessors) {
                  var accessorName = accessor.Groups[1].ToString();
                  var permissionsString = accessor.Groups[2].ToString();
                  data.DACAccessors.Add(new DACAccess(accessorName, permissionsString));
                }
                break;
              case "Secrecy":
                data.secrecy = subValue;
                break;
              case "Integrity":
                data.integrity = subValue;
                break;
            }
          });
        }
      });

      return data;
    }
  }
}