using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //Factory that creates Computers
  public class ComputerFactory : ComponentFactory, iFactory {
    [SerializeField] private ComputerBehavior _prefab;

    [Tooltip("The variable containing the list of all the Computers currently in the scenario.")]
    [SerializeField] private ComputerListVariable computerListVariable;
    
    [Tooltip("The variable containing the list of all the Policies available to apply to Computers")]
    [SerializeField] private PolicyListVariable computerPolicyListVariable;
    
    private static readonly string COMPUTERS = "computers";

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      ComputerBehavior item = Instantiate(_prefab, parent);
      item.Data = LoadOneComputer(filename, item);
      UpdateGameObject(item);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadAllComputers(path);
    }

    //-------------------------------------------------------------------------
    private void LoadAllComputers(string path, Transform parent = null) {
      string cdir = Path.Combine(path, COMPUTERS);
      string[] clist = Directory.GetFiles(cdir);
      foreach (string computer_file in clist) {
        ComputerBehavior newComputer = Instantiate(_prefab, parent);
        
        newComputer.gameObject.SetActive(true);
        newComputer.Data = LoadOneComputer(computer_file, newComputer);

        UpdateGameObject(newComputer);
      }
    }
    
    //-------------------------------------------------------------------------
    private void UpdateGameObject(ComputerBehavior newComputer) {
      //This is the part that will hopefully load the correct assets from dict
      SkinnedMeshRenderer this_render = newComputer.GetComponent<SkinnedMeshRenderer>();
      try {
        this_render.sharedMesh = CatalogBehavior.object_mesh_dict[newComputer.Data.hw];
      }
      catch (KeyNotFoundException) {
        Debug.Log("Key Exception in object_mesh_dict caused by " + newComputer.Data.hw);
      }

      try {
        this_render.material = CatalogBehavior.object_mat_dict[newComputer.Data.hw];
      }
      catch (KeyNotFoundException) {
        Debug.Log("Key Exception in object_mat_dict caused by  " + newComputer.Data.hw);
      }

      int pos = newComputer.Data.position;
      if (pos < 0) {
        Debug.Log("LoadOneComputer got invalid pos for " + newComputer.Data.component_name);
      }

      WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
      int slot = ws.AddComputer(newComputer.Data.component_name);
      float xf, zf;
      ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);

      Vector3 v = new Vector3(xf, 0.5f, zf);
      newComputer.transform.position = v;

      newComputer.gameObject.name = $"Computer--{newComputer.Data.component_name}";

      //add it to the computer list.
      var componentList = this.computerListVariable.Value;
      componentList.Add(newComputer);
      computerListVariable.Value = new List<ComputerBehavior>(componentList);
    }

    //-------------------------------------------------------------------------
    private ComputerDataObject LoadOneComputer(string computer_file, ComputerBehavior computer) {
      ComputerDataObject data = new ComputerDataObject();
      string cdir = Path.Combine(GameLoadBehavior.user_app_path, COMPUTERS);
      string cfile = Path.Combine(cdir, computer_file);

      var componentData = (ComponentDataObject) data;
      LoadComponent(cfile, computer, ref componentData);
      LoadComputerInfoFromFile(cfile, computer, ref data);
      return data;
    }

    //-------------------------------------------------------------------------
    private void LoadComputerInfoFromFile(string filePath, ComputerBehavior computer, ref ComputerDataObject data) {
      data.config_settings = new ConfigurationSettings(true, data.component_name, computerPolicyListVariable.Value);

      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        ccUtils.PositionAfter(reader, "Component");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if ((value == null) || (tag == null))
            continue;
          if (!data.config_settings.HandleConfigurationSetting(tag, value))
            switch (tag) {
              case "ComponentProceduralSettings":
                //special case to process all of the sub-elements
                using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""))) {
                  using (var substream = new StreamReader(stream)) {
                    string v = null;
                    do {
                      v = ccUtils.SDTNext(substream, out string t);
                      if (string.IsNullOrEmpty(v)) {
                        continue;
                      }

                      data.config_settings.HandleConfigurationSetting(t, v);
                    } while (v != null);
                  }
                }

                break;
              case "Assets":
                data.asset_list.Add(value);
                AssetBehavior asset = AssetFactory.asset_dict[value];
                asset.SetComputer(computer);
                break;
              case "AccessListLocal":
                data.user_list.Add(value);
                break;
              case "User":
                break;
              case "HW":
                data.hw_name = value;
                data.hw = value;
                break;
            }
        } while (value != null);
      }


    }
  }
}