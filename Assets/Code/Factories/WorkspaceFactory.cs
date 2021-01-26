using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using Code.World_Objects.Workspace;
using UnityEngine;

namespace Code.Factories {
  //A factory that creates Workspace GameObjects
  public class WorkspaceFactory : MonoBehaviour, iFactory {
    [SerializeField] private WorkSpaceScript _prefab;

    [Tooltip("The chair prefab to use in a regular work space")]
    [SerializeField] private GameObject _workSpaceChairPrefab;
    [Tooltip("The work station prefab to use in a regular work space")]
    [SerializeField] private GameObject _workSpaceWorkDeskPrefab;
    // [Tooltip("The desk prefab to use in the server room")]
    // [SerializeField] private GameObject _workSpaceWorkServerDeskPrefab;
    // [Tooltip("The server rack prefab to use in the server room")]
    // [SerializeField] private GameObject _workSpaceWorkServerRackPrefab;
    [SerializeField] private List<GameObject> _random1List = new List<GameObject>();
    [SerializeField] private List<GameObject> _random2List = new List<GameObject>();
    
    
    [Header("Input Variables")]
    [SerializeField] private StringStringVariable _organizationDictionary;
    [Tooltip("The variable to contain the list of WorkSpaces in the current scenario")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;

    //Some temporal data read from the "workspace.sdf" file
    private class WorkSpaceData {
      public int PosIndex;
      public bool IsServer;
      public int Random1;
      public int Random2;
    }
    
    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new NotImplementedException();
    }
    
    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      _workSpaceListVariable.Clear();
      LoadWorkSpacesFromFile(path, parent);
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
            var workSpace = Instantiate(_prefab, parent);
            workSpace.Data = ws;
            SetupGameObject(workSpace, _workSpaceListVariable.Value.Count-1);
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
      string full_path = Path.Combine(path, "workspace.sdf");
      var workSpaceDataList = new List<WorkSpaceData>();

      StreamReader reader = new StreamReader(full_path, Encoding.Default);
      using (reader) {
        string value = null;
        
        do {
          value = ccUtils.SDTNext(reader, out string key);
          if ((value == null) || (key == null)) {
            continue;
          }

          if (key == "Workspace") {
            var wsData = new WorkSpaceData(){PosIndex = -1, Random1 = -1, Random2 = -1, IsServer = false};
            workSpaceDataList.Add(wsData);
            
            using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""))) {
              using (var substream = new StreamReader(stream)) {
                string v = null;
                do {
                  v = ccUtils.SDTNext(substream, out string t);
                  if (string.IsNullOrEmpty(v)) {
                    continue;
                  }
                  switch (t) {
                    case "PosIndex":
                      int.TryParse(v, out int posIndex);
                      wsData.PosIndex = posIndex;
                      break;
                    case "Type":
                      wsData.IsServer = (v == "SERVER");
                      break;
                    case "Random1":
                      int.TryParse(v, out int random1);
                      wsData.Random1 = random1;
                      break;
                    case "Random2":
                      int.TryParse(v, out int random2);
                      wsData.Random2 = random2;
                      break;
                  }
                } while (v != null);
              }
            }
          }
          
        } while (value != null);

        return workSpaceDataList;
      }
    }

    //-------------------------------------------------------------------------
    private void SetupGameObject(WorkSpaceScript workSpace, int index) { 
      ccUtils.GridTo3dPos(workSpace.Data.x, workSpace.Data.y,  out float x, out float y);
      workSpace.transform.position = new Vector3(x, 0, y);
      workSpace.transform.rotation = GetRotation(workSpace.Data.GetDirection());
      
      workSpace.gameObject.name = $"WorkSpace--{index}";
      PopulateWorkspace(workSpace);
    }

    //-------------------------------------------------------------------------
    private static Quaternion GetRotation(WorkSpace.WorkSpaceDirection direction) {
      switch (direction) {
        case WorkSpace.WorkSpaceDirection.North: return Quaternion.Euler(0, -90, 0);
        case WorkSpace.WorkSpaceDirection.East: return Quaternion.Euler(0, -180, 0);
        case WorkSpace.WorkSpaceDirection.South: return Quaternion.Euler(0, 90, 0);
        case WorkSpace.WorkSpaceDirection.West: return Quaternion.Euler(0, 0, 0);
        default:
          return Quaternion.identity;
      }
    }


    //-------------------------------------------------------------------------
    //Instantiate the office furniture for the supplied WorkSpace
    private void PopulateWorkspace(WorkSpaceScript workSpace) {
      //Chair
      if (workSpace.Data.GetWorkSpaceType() == WorkSpace.WorkSpaceType.Regular) {
        //instantiate a _chairPrefab at the workstations x,y (rotation?) 
        var chair = Instantiate(_workSpaceChairPrefab, workSpace.transform);
        //table
        var table = Instantiate(_workSpaceWorkDeskPrefab, workSpace.transform);
        //TODO add in the random office stuff using the random lists of objects 
        //and the scenario-define random number (random number range?)
      }
      else if (workSpace.Data.GetWorkSpaceType() == WorkSpace.WorkSpaceType.Server) {
        // //create table
        // var table = Instantiate(_workSpaceWorkServerDeskPrefab, workSpace.transform);
        // //create server rack
        // var rack = Instantiate(_workSpaceWorkServerRackPrefab, workSpace.transform);
      }
    }
  }
}