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

    [Tooltip("A List of WorkSpaceFurnitureVariables. One for every office type.")]
    [SerializeField] private List<WorkSpaceFurnitureVariable> _workSpaceFurnitureVariables;

    [Header("Input Variables")]
    [SerializeField] private StringStringVariable _organizationDictionary;
    [Tooltip("The variable to contain the list of WorkSpaces in the current scenario")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;

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
      //get the magic string of office type in order to find the grouping of
      //furniture to populate the WorkSpaces with
      string officeName = _organizationDictionary["MainOfficeVersion"];
      WorkSpaceFurnitureVariable furnitureVar = _workSpaceFurnitureVariables.Find(
        x => x.Value._associatedOfficeMagicString == officeName);
      
      WorkSpaceFurniture furniture = furnitureVar ? furnitureVar.Value : null;
      
      if (furniture == null) {
        Debug.LogError($"No furniture object found for '{officeName}'");
        return; 
      }
      
      if (workSpace.Data.GetWorkSpaceType() == WorkSpace.WorkSpaceType.Regular) {
        PopulateRegularWorkspace(workSpace, supplementalData, index, furniture);
      }
      else if (workSpace.Data.GetWorkSpaceType() == WorkSpace.WorkSpaceType.Server) {
        PopulateServerRoom(workSpace, furniture);
      }
    }

    //-------------------------------------------------------------------------
    //instantiate and position the stuff that goes in a regular WorkSpace
    private static void PopulateRegularWorkspace(WorkSpaceScript workSpace, WorkSpaceData supplementalData, int workSpaceIndex, WorkSpaceFurniture furniture) {
      //regular WorkSpaces get a chair and a desk
      GameObject chairPrefab = furniture.GetWorkSpaceChair(workSpaceIndex);
      Direction direction = workSpace.Data.GetDirection();
      
      if (chairPrefab) {
        var item = Instantiate(chairPrefab, workSpace.transform);
        item.transform.Translate(furniture.ChairOffset.GetOffset(direction), Space.Self);
      }

      GameObject deskPrefab = furniture.GetWorkSpaceDesk(workSpaceIndex);
      if (deskPrefab) {
        var item = Instantiate(deskPrefab, workSpace.transform);
        item.transform.Translate(furniture.DeskOffset.GetOffset(direction), Space.Self);
      }

      //add in the random office stuff using the random lists of objects 
      //and the scenario-define random number (random number range?)
      var firstItemPrefab = furniture.GetRandomItem1(supplementalData.Random1, workSpaceIndex);
      if (firstItemPrefab) {
        var item = Instantiate(firstItemPrefab, workSpace.transform);
        item.gameObject.name = $"R1 - {item.gameObject.name}";
        item.transform.Translate(furniture.Random1Offset.GetOffset(direction), Space.Self);
      }
      
      var secondItemPrefab = furniture.GetRandomItem2(supplementalData.Random2, workSpaceIndex);
      if (secondItemPrefab) {
        var item = Instantiate(secondItemPrefab, workSpace.transform);
        item.gameObject.name = $"R2 - {item.gameObject.name}";
        item.transform.Translate(furniture.Random2Offset.GetOffset(direction), Space.Self);
        //the item needs to be rotated 90 degrees, relative to the parent
        item.transform.Rotate(0, 90, 0, Space.Self);
      }
    }

    //--------------------------------------------------------------------------
    //instantiate and position the stuff that goes in a server room WorkSpace
    private static void PopulateServerRoom(WorkSpaceScript workSpace, WorkSpaceFurniture furniture) {
      //create table
      if (furniture._serverRoomDeskPrefab) {
        var table = Instantiate(furniture._serverRoomDeskPrefab, workSpace.transform);
        table.transform.Translate(furniture._serverRoomDeskOffset, Space.Self);
      }

      //create server rack
      if (furniture._serverRoomServerRackPrefab) {
        var rack = Instantiate(furniture._serverRoomServerRackPrefab, workSpace.transform);
        rack.transform.Translate(furniture._serverRoomRackOffset, Space.Self);
      }

      //Add in the lamp
      if (furniture._serverRoomLampPrefab) {
        var lamp = Instantiate(furniture._serverRoomLampPrefab, workSpace.transform);
        lamp.transform.Translate(furniture._serverRoomLampOffset, Space.Self);
      }
      
    }
  }
}