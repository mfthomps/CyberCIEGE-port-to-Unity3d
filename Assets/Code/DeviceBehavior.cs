using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Factories;
using UnityEngine;

public class DeviceBehavior : ComponentBehavior {
  private static readonly string DEVICES = "devices";
  
  private static string hw_name;

  public void LoadOneDevice(string device_file) {
    string cdir = Path.Combine(GameLoadBehavior.user_app_path, DEVICES);
    string cfile = Path.Combine(cdir, device_file);
    
    SetFilePath(cfile);
    gameObject.SetActive(true);
    LoadComponent();
    LoadDevice();
    hw = hw_name;
    SkinnedMeshRenderer this_render = GetComponent<SkinnedMeshRenderer>();
    try {
      this_render.sharedMesh = CatalogBehavior.object_mesh_dict[hw];
    }
    catch (KeyNotFoundException) {
      Debug.Log("Key exception in object_mesh_dict caused by " + hw);
    }

    try {
      this_render.material = CatalogBehavior.object_mat_dict[hw];
    }
    catch (KeyNotFoundException) {
      Debug.Log("Key exception in object_mat_dict caused by " + hw);
    }

    int pos = position;
    //Debug.Log("LoadComputers " + script.computer_name + " pos is " + pos);
    if (pos < 0) {
      Debug.Log("LoadOneDevice got invalid pos for " + component_name);
      return;
    }

    WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
    int slot = ws.AddDevice(component_name);
    float xf, zf;
    ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
    //Debug.Log(ws.x + " " + ws.y + " " + xf + " " + zf);
    Vector3 v = new Vector3(xf, 0.5f, zf);
    transform.position = v;
  }

  
  private void LoadDevice() {
    try {
      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        //Debug.("LoadDevice read from " + filePath);
        ccUtils.PositionAfter(reader, "Component");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag).Trim();
          if (value == null)
            continue;
          switch (tag) {
            case "HW": //Right now I think we're only using one of the params here, could change though
              hw_name = value;
              break;
          }
        } while (value != null);
      }
    }
    catch (Exception e) {
      Debug.LogError(e.Message);
    }
  }
}