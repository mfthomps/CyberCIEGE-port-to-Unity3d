using System.IO;
using UnityEngine;

namespace Code.Factories {
  //Factory that create Device GameObjects
  public class DeviceFactory : MonoBehaviour, iFactory{
    [SerializeField] private DeviceBehavior _prefab;

    private string user_app_path;
    
    private readonly string DEVICES = "devices";

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      DeviceBehavior item = Instantiate(_prefab, parent);
      item.LoadOneDevice(filename);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadDevices(path, parent = null);
    }

    //-------------------------------------------------------------------------
    private void LoadDevices(string path, Transform parent = null) {
      user_app_path = path;
      string cdir = Path.Combine(user_app_path, DEVICES);
      string[] clist = Directory.GetFiles(cdir);
      
      foreach (string device_file in clist) {
        DeviceBehavior item = Instantiate(_prefab, parent);
        item.LoadOneDevice(device_file);
      }
    }
  }
}