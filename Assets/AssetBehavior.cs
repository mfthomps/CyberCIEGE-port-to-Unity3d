using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class AssetBehavior : MonoBehaviour {
  public static Dictionary<string, AssetBehavior> asset_dict = new Dictionary<string, AssetBehavior>();
  private static readonly string ASSETS = "assets";
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  public static Texture2D background, LOGO;
  public string asset_name;
  public int position = -1;
  public ComputerBehavior computer;
  private DACAccess dac_access;

  private string filePath;

  // Use this for initialization
  private void Start() {
  }

  public static void LoadOneAsset(string asset_file) {
    GameObject asset = GameObject.Find("Asset");
    //Debug.Log("user_app_path" + user_app_path + " file [" + User_file+"]");
    string cfile = Path.Combine(GameLoadBehavior.user_app_path, asset_file);

    GameObject new_c = Instantiate(asset, new Vector3(1.0F, 0, 0), Quaternion.identity);
    AssetBehavior script = (AssetBehavior) new_c.GetComponent(typeof(AssetBehavior));
    script.SetFilePath(cfile);
    new_c.SetActive(true);
    script.LoadAsset();
  }

  public void SetComputer(ComputerBehavior computer) {
    this.computer = computer;
  }

  public void SetFilePath(string path) {
    filePath = path;
  }

  public static void LoadAssets() {
    string asset_dir = Path.Combine(GameLoadBehavior.user_app_path, ASSETS);
    string[] clist = Directory.GetFiles(asset_dir);
    foreach (string asset_file in clist)
      if (asset_file.EndsWith(".sdf"))
        LoadOneAsset(asset_file);
  }

  public void LoadAsset() {
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
              asset_name = value;
              //Debug.Log("LoadAsset adding to dict: " + this.asset_name);
              asset_dict.Add(asset_name, this);
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
      Console.WriteLine(e.Message + "\n");
    }
  }

  public string GetDACString() {
    return dac_access.ToString();
  }

  public DACAccess GetDACAccess() {
    return dac_access;
  }
}