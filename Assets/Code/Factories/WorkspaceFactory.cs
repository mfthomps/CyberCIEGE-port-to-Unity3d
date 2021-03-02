using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using Code.World_Objects.Office;
using Code.World_Objects.Workspace;
using UnityEngine;

namespace Code.Factories {
  //A factory that creates Workspace GameObjects
  public class WorkspaceFactory : MonoBehaviour, iFactory {
    [SerializeField] private WorkSpaceScript _prefab;

    [Header("Input Variables")]
    [SerializeField] private StringStringVariable _organizationDictionary;
    [Tooltip("The variable to contain the list of WorkSpaces in the current scenario")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;
    [Tooltip("The ScriptableVariable that should contain the list of OfficeBuildings instantiated" +
             " for the currently loaded scenario.")]
    [SerializeField] private OfficeListVariable _officeList;

    private Transform _parent;

    //Some local data read from the "workspace.sdf" file
    public class WorkSpaceData {
      public int PosIndex;
      public bool IsServer;
      public int Random1;
      public int Random2;

      public WorkSpaceData(int posIndex= -1, bool isServer = false, int random1 = -1, int random2 = -1) {
        PosIndex = posIndex;
        IsServer = isServer;
        Random1 = random1;
        Random2 = random2;
      }
    }
    
    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Work Spaces").transform;
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new NotImplementedException();
    }
    
    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      _workSpaceListVariable.Clear();
      LoadWorkSpacesFromFile(path, _parent);
    }
    
    //-------------------------------------------------------------------------
    public void OnDestroy() {
      _workSpaceListVariable.Clear();
    }

    //-------------------------------------------------------------------------
    private void LoadWorkSpacesFromFile(string path, Transform parent) {

      //Read from the workspace.sdf file for some information
      var wsDataList  = ParseSDF(path);
      
      string fname = _organizationDictionary["WorkSpaceFile"];
      string line;
      string full_path = Path.Combine(path, fname);
      
      try {
        StreamReader reader = new StreamReader(full_path, Encoding.Default);
        using (reader) {
          do {
            line = reader.ReadLine().Trim();
            if (line == "WORKSPACELIST" || line == "end") {
              continue;
            }

            string[] parts = line.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
            
            if (!int.TryParse(parts[0], out int x)) {
              Debug.Log("Error: LoadWorkspace parse x " + parts[0] + " line " + line);
            }

            if (!int.TryParse(parts[1], out int y)) {
              Debug.Log("Error: LoadWorkspace parse y " + parts[1] + " line " + line);
            }

            char dir = parts[2][0];
            char usage = parts[3][0];

            int currentWorkSpaceIndex = _workSpaceListVariable.Value.Count;
            var wsData = wsDataList.Find(item => item.PosIndex == currentWorkSpaceIndex);
            if (wsData != null) {
              usage = wsData.IsServer ? 'S' : usage;
            }

            WorkSpace ws = new WorkSpace(x, y, dir, usage);
            _workSpaceListVariable.Add(ws);
            var workSpace = Instantiate(_prefab, _parent);
            workSpace.Data = ws;
            SetupGameObject(workSpace, wsData, _workSpaceListVariable.Value.Count-1);
          } while (line != "end" && line != null);
        }
      }
      catch (Exception e) {
        Debug.LogError(e.Message);
      }
    }

    //-------------------------------------------------------------------------
    //Parse the workspace.sdf file and return the list of WorkSpace information
    private static List<WorkSpaceData> ParseSDF(string path) {
      var workSpaceDataList = new List<WorkSpaceData>();

      string full_path = Path.Combine(path, "workspace.sdf");
      ccUtils.ParseSDFFile(full_path, (tag, value) => {
        if (tag == "Workspace") {
          var wsData = new WorkSpaceData(){PosIndex = -1, Random1 = -1, Random2 = -1, IsServer = false};
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "PosIndex":
                int.TryParse(subValue, out int posIndex);
                wsData.PosIndex = posIndex;
                break;
              case "Type":
                wsData.IsServer = (subValue == "SERVER");
                break;
              case "Random1":
                int.TryParse(subValue, out int random1);
                wsData.Random1 = random1;
                break;
              case "Random2":
                int.TryParse(subValue, out int random2);
                wsData.Random2 = random2;
                break;
            }
          });
          workSpaceDataList.Add(wsData);
        }
      });

      return workSpaceDataList;
    }

    //-------------------------------------------------------------------------
    //Public, for unit testing.
    public void SetupGameObject(WorkSpaceScript workSpace, WorkSpaceData supplementalData, int index) { 
      ccUtils.GridTo3dPos(workSpace.Data.x, workSpace.Data.y,  out float x, out float y);
      workSpace.transform.position = new Vector3(x, 0, y);
      workSpace.transform.rotation = WorkSpace.GetRotation(workSpace.Data.GetDirection());
      
      workSpace.gameObject.name = $"WorkSpace--{index}";
      PopulateWorkspace(workSpace, supplementalData, index);
    }

    //-------------------------------------------------------------------------
    //Instantiate the office furniture for the supplied WorkSpace
    private void PopulateWorkspace(WorkSpaceScript workSpace, WorkSpaceData supplementalData, int index) {
      var mainOffice = _officeList.GetMainOffice();
      WorkSpaceFurnitureConfiguration workSpaceFurniture = mainOffice.GetWorkSpaceFurniture(workSpace.Data.GetWorkSpaceType());
      if (workSpaceFurniture) {
        WorkSpaceFurnitureConfiguration config = Instantiate(workSpaceFurniture, workSpace.transform, false);
        config.SetupFurniture(supplementalData.Random1, supplementalData.Random2, index);
      }
    }
  }
}