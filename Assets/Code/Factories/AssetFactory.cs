using System.IO;
using UnityEngine;

namespace Code.Factories {
  //A factory that creates Asset instances
  public class AssetFactory : MonoBehaviour, iFactory {
    [SerializeField] private AssetBehavior _prefab;
    
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

      var asset = Instantiate(_prefab, parent);
      asset.gameObject.SetActive(true);
      asset.LoadAsset(cfile);
    }
  }
}