﻿using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Hardware;
using Code.Scriptable_Variables;
using Code.World_Objects.Asset;
using Code.World_Objects.Computer;
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
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    private Transform _parent = null;

    private static readonly string COMPUTERS = "computers";

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Computers").transform;
    }

    //-------------------------------------------------------------------------
    void OnDestroy() {
      computerListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    public void OnServerAddComputer(string computerName) {
      Create($"{computerName}.sdf");

      // Select our newly created computer
      selectedObject.Value = computerListVariable.Value[computerListVariable.Value.Count - 1].gameObject;
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      LoadAllComputers(path);
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      var item = Instantiate(_prefab, _parent);
      item.Data = LoadOneComputer(Path.Combine(userAppPath.Value, COMPUTERS, filename), item);
      UpdateGameObject(item);
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
      WorkSpaceScript ws = _workSpaceListVariable.GetWorkSpaceScript(computer.Data.position);
      ws?.Data.RemoveComputer(computer);
      Destroy(computer.gameObject);
    }

    //-------------------------------------------------------------------------
    private void LoadAllComputers(string path, Transform parent = null) {
      computerListVariable.Clear();
      
      string cdir = Path.Combine(path, COMPUTERS);
      string[] clist = Directory.GetFiles(cdir);
      foreach (string computer_file in clist) {
        Create(computer_file);
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
          computerData.AddSoftware(value);
          break;
        case "Assets":
          computerData.AddAsset(value);
          AssetBehavior asset = assets.FindAsset(value);
          asset.SetComputer(computerComponent);
          break;
        case "AccessListLocal":
          computerData.AddLocalAccount(value);
          break;
        case "AuthServerList":
          computerData.SetAuthenticatedServer(value);
          break;
        case "SecrecyProfile":
          computerData.AddProfile(value);
          break;
        case "IntegrityProfile":
          computerData.AddProfile(value);
          break;
        case "GroupProfile":
          computerData.AddProfile(value);
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
    //Public, for unit testing
    private void UpdateGameObject(ComputerBehavior newComputer) {
      //This is the part that will hopefully load the correct assets from dict
      var hardwareAsset = hardwareCatalog.Value.GetHardwareAsset(newComputer.Data.hw);
      if (hardwareAsset != null) {
        SkinnedMeshRenderer newComputerRenderer = newComputer.GetRenderer();
        newComputerRenderer.sharedMesh = hardwareAsset.mesh;
        newComputerRenderer.material = hardwareAsset.material;
      }
      else {
        Debug.LogError($"Hardware asset missing for computer: {newComputer.Data.hw}");
      }

      int pos = newComputer.Data.position;
      if (pos < 0) {
        Debug.Log("LoadOneComputer got invalid pos for " + newComputer.Data.component_name);
      }

      WorkSpaceScript ws = _workSpaceListVariable.GetWorkSpaceScript(pos);
      int slot = ws.Data.AddComputer(newComputer);
      
      SetComputerPositionRotation(newComputer, ws, slot);
      newComputer.gameObject.name = $"Computer - {newComputer.Data.component_name}";

      //add it to the computer list.
      computerListVariable.Add(newComputer);
    }
    
    //-------------------------------------------------------------------------
    //setup the position and rotation of the computer based on the WorkSpace direction
    //and office-specific offsets
    private void SetComputerPositionRotation(Component newComputer, WorkSpaceScript ws, int workSpaceComponentSlot) {
      var computerPositionReference = ws.FurnitureConfiguration.GetComponentTransform(workSpaceComponentSlot);
      if (computerPositionReference) {
        newComputer.transform.SetPositionAndRotation(computerPositionReference.position, computerPositionReference.rotation);
      }
      else {
        Debug.Log($"Can't find a place in WorkSpace [{ws.name}] to position computer [{newComputer.name}]");
      }
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