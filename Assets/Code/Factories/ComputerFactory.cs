using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Hardware;
using Code.Scriptable_Variables;
using Code.World_Objects.Asset;
using Code.World_Objects.Workspace;

namespace Code.Factories {
  //Factory that creates Computers
  public class ComputerFactory : ComponentFactory, iFactory {
    [SerializeField] private ComputerBehavior _prefab;

    [Header("Input Variables")]
    [Tooltip("Path to the user's AppData folder")]
    public StringVariable userAppPath;
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Tooltip("The list of all the currently loaded workspaces")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;
    [Tooltip("The list of assets in the scenario")]
    [SerializeField] private AssetListVariable assets;
    [Tooltip("List of policy lists that computers care about")]
    public List<PolicyListVariable> policies = new List<PolicyListVariable>();
    [Tooltip("The variable that contains the currently in-game selected World Object")]
    [SerializeField] private GameObjectVariable _currentlySelectedWorldObject;

    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Computers currently in the scenario.")]
    [SerializeField] private ComputerListVariable computerListVariable;
   
    private static readonly string COMPUTERS = "computers";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      computerListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      ComputerBehavior item = Instantiate(_prefab, parent);
      item.Data = LoadOneComputer(Path.Combine(userAppPath.Value, COMPUTERS, filename), item);
      UpdateGameObject(item);
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadAllComputers(path);
    }

    //-------------------------------------------------------------------------
    public void Remove(string itemName) {
      var computer = computerListVariable.Value.Find(x => x.Data.component_name == itemName);
      if (computer) {
        Remove(computer);
      }
      else {
        Debug.LogError($"Couldn't find a computer to remove with the name '{itemName}'");
      }
    }

    //-------------------------------------------------------------------------
    public void Remove(ComputerBehavior computer) {
      computerListVariable.Remove(computer);

      //if this Computer was currently selected, deselect it
      if (_currentlySelectedWorldObject.Value == computer.gameObject) {
        _currentlySelectedWorldObject.Value = null;
      }

      //update the WorkSpace
      WorkSpace ws = _workSpaceListVariable.GetWorkSpace(computer.Data.position);
      ws?.RemoveComputer(computer);
      Destroy(computer.gameObject);
    }

    //-------------------------------------------------------------------------
    private void LoadAllComputers(string path, Transform parent = null) {
      computerListVariable.Clear();
      
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
    private ComputerDataObject LoadOneComputer(string computer_file, ComputerBehavior computer) {
      ComputerDataObject data = new ComputerDataObject();
      LoadComponent(computer_file, computer, data);
      return data;
    }

    //--------------------------------------------------------------------------
    protected override void ProcessComponentProperty(ComponentBehavior component, ComponentDataObject data, string tag, string value) {
      base.ProcessComponentProperty(component, data, tag, value);
      var computerComponent = component as ComputerBehavior;
      var computerData = data as ComputerDataObject;

      switch (tag) {
        case "ComponentProceduralSettings":
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            AddEnabledPolicy(computerData, subTag, subValue);
          });
          break;
        case "Software":
          computerData.software.Add(value);
          break;
        case "Assets":
          computerData.asset_list.Add(value);
          AssetBehavior asset = assets.FindAsset(value);
          asset.SetComputer(computerComponent);
          break;
        case "AccessListLocal":
          computerData.user_list.Add(value);
          break;
        case "User":
          computerData.assignedUser = value;
          break;
        case "OS":
          computerData.os = value;
          break;
        case "Availability":
          if (!int.TryParse(value, out computerData.availability)) {
            Debug.LogError($"Error: ComputerFactory parsing availability: {value}");
          }
          break;
        case "DomainName":
          computerData.domain = value;
          break;
        case "hwName":
          computerData.hw_name = value;
          computerData.isServer = hardwareCatalog.Value.GetHardwareType(value) == HardwareType.Servers;
          break;
        default:
          // Check our policies to see if this is one of them
          AddEnabledPolicy(computerData, tag, value);
          break;
      }
    }
    
    //-------------------------------------------------------------------------
    private void UpdateGameObject(ComputerBehavior newComputer) {
      //This is the part that will hopefully load the correct assets from dict
      var hardwareAsset = hardwareCatalog.Value.GetHardwareAsset(newComputer.Data.hw);
      if (hardwareAsset != null) {
        SkinnedMeshRenderer this_render = newComputer.GetComponent<SkinnedMeshRenderer>();
        this_render.sharedMesh = hardwareAsset.mesh;
        this_render.material = hardwareAsset.material;
      }
      else {
        Debug.LogError($"Hardware asset missing for computer: {newComputer.Data.hw}");
      }

      int pos = newComputer.Data.position;
      if (pos < 0) {
        Debug.Log("LoadOneComputer got invalid pos for " + newComputer.Data.component_name);
      }

      WorkSpace ws = _workSpaceListVariable.GetWorkSpace(pos);
      int slot = ws.AddComputer(newComputer);
      float xf, zf;
      ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);

      Vector3 v = new Vector3(xf, 0.5f, zf);
      newComputer.transform.position = v;

      newComputer.gameObject.name = $"Computer - {newComputer.Data.component_name}";

      //add it to the computer list.
      computerListVariable.Add(newComputer);
    }

    // ------------------------------------------------------------------------
    private void AddEnabledPolicy(ComputerDataObject computerData, string policyTag, string policySubTag) {
      foreach (var policy in policies) {
        var enabledPolicy = policy.GetPolicy(policyTag, policySubTag);
        if (enabledPolicy != null) {
          computerData.enabledPolicies.Add(enabledPolicy.GetName());
        }
      }
    }
  }
}