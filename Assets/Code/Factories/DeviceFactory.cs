﻿using System.IO;
using System.Text;
using UnityEngine;
using Code.Hardware;
using Code.Scriptable_Variables;

namespace Code.Factories {
  //Factory that create Device GameObjects
  public class DeviceFactory : ComponentFactory, iFactory{
    [SerializeField] private DeviceBehavior _prefab;

    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Tooltip("The variable containing the list of all the Devices currently in the scenario.")]
    [SerializeField] private DeviceListVariable deviceListVariable;

    private string user_app_path;
    
    private readonly string DEVICES = "devices";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      deviceListVariable.Clear();
    }

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
      deviceListVariable.Clear();
      
      string cdir = Path.Combine(path, DEVICES);
      string[] clist = Directory.GetFiles(cdir);
      
      foreach (string device_file in clist) {
        Create(device_file, parent);
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
      //This is the part that will hopefully load the correct assets from dict
      var hardwareAsset = hardwareCatalog.Value.GetHardwareAsset(device.Data.hw);
      if (hardwareAsset != null) {
        SkinnedMeshRenderer this_render = device.GetComponent<SkinnedMeshRenderer>();
        this_render.sharedMesh = hardwareAsset.mesh;
        this_render.material = hardwareAsset.material;
      }
      else {
        Debug.LogError($"Hardware asset missing for device: {device.Data.hw}");
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

      //add it to the device list.
      deviceListVariable.Add(device);
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