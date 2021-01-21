using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.Factories {
  //Factory that create Device GameObjects
  public class DeviceFactory : ComponentFactory, iFactory{
    [SerializeField] private DeviceBehavior _prefab;

    private string user_app_path;
    
    private readonly string DEVICES = "devices";

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      DeviceBehavior item = Instantiate(_prefab, parent);
      item.Data = LoadOneDevice(filename, item);
      UpdateGameObject(item);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadDevices(path, parent);
    }

    //-------------------------------------------------------------------------
    private void LoadDevices(string path, Transform parent = null) {
      
      string cdir = Path.Combine(path, DEVICES);
      string[] clist = Directory.GetFiles(cdir);
      
      foreach (string device_file in clist) {
        DeviceBehavior item = Instantiate(_prefab, parent);
        item.Data = LoadOneDevice(device_file, item);
        UpdateGameObject(item);
      }
    }
    
    //-------------------------------------------------------------------------
    private DeviceDataObject LoadOneDevice(string device_file, DeviceBehavior newDevice) {
      var data = new DeviceDataObject();
      
      string cdir = Path.Combine(GameLoadBehavior.user_app_path, DEVICES);
      string cfile = Path.Combine(cdir, device_file);
      
      // gameObject.SetActive(true);
      var componentData = (ComponentDataObject) data;
      LoadComponent(cfile, newDevice, ref componentData);
      LoadDevice(cfile, ref data);
      
      return data;
    }
    
    //-------------------------------------------------------------------------
    private void UpdateGameObject(DeviceBehavior device) {
      SkinnedMeshRenderer this_render = device.GetComponent<SkinnedMeshRenderer>();
      try {
        this_render.sharedMesh = CatalogBehavior.object_mesh_dict[device.Data.hw];
      }
      catch (KeyNotFoundException) {
        Debug.Log("Key exception in object_mesh_dict caused by " + device.Data.hw);
      }

      try {
        this_render.material = CatalogBehavior.object_mat_dict[device.Data.hw];
      }
      catch (KeyNotFoundException) {
        Debug.Log("Key exception in object_mat_dict caused by " + device.Data.hw);
      }

      int pos = device.Data.position;
      if (pos < 0) {
        Debug.Log("LoadOneDevice got invalid pos for " + device.Data.component_name);
      }

      WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
      int slot = ws.AddDevice(device.Data.component_name);
      float xf, zf;
      ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
      Vector3 v = new Vector3(xf, 0.5f, zf);
      device.transform.position = v;

      device.gameObject.name = $"Device--{device.Data.component_name}";
    }

    //---------------------------------------------------------------------------
    private void LoadDevice(string filePath, ref DeviceDataObject data) {

      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        ccUtils.PositionAfter(reader, "Component");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if ((value == null) || (tag == null))
            continue;
          switch (tag) {
            case "HW": //Right now I think we're only using one of the params here, could change though
              data.hw = value;
              break;
          }
        } while (value != null);
      }

    }
    
  }
}