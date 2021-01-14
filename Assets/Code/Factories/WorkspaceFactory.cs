using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //A factory that creates Workspace GameObjects
  public class WorkspaceFactory : MonoBehaviour, iFactory {
    [SerializeField] private WorkSpaceScript _prefab;
    [SerializeField] private StringStringVariable _organizationDictionary;
    
    //TODO remove this static attribute
    private static readonly List<WorkSpace> _workSpaces = new List<WorkSpace>();
    
    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new NotImplementedException();
    }
    
    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      var item = Instantiate(_prefab, parent);
      LoadWorkSpace(item, path);
    }
    
    //-------------------------------------------------------------------------
    public static WorkSpace GetWorkSpace(int pos) {
      if (pos >= _workSpaces.Count || pos < 0) {
        Debug.Log("Workspace request out of range " + pos);
        return null;
      }
      return _workSpaces[pos];
    }
    
    //-------------------------------------------------------------------------
    public static bool FindClosestWorkspaceCenter(out int xout, out int yout, out int index) {
      Vector2 gridloc = ccUtils.GetMouseGrid();

      return FindClosestWorkspaceCenter(gridloc.x, gridloc.y, out xout, out yout, out index);
    }
    
    //-------------------------------------------------------------------------
    private static bool FindClosestWorkspaceCenter(float xin, float yin, out int xout, out int yout, out int index) {
      int i;
      float distance, temp;
      xout = 0;
      yout = 0;

      index = -1;
      distance = 9999999.9f;
      for (i = 0; i < _workSpaces.Count; i++) {
        temp = (xin - _workSpaces[i].x) * (xin - _workSpaces[i].x)
               + (yin - _workSpaces[i].y) * (yin - _workSpaces[i].y);
        if (temp < distance) {
          index = i;
          distance = temp;
          xout = _workSpaces[i].x;
          yout = _workSpaces[i].y;
        }
      }

      if (distance < 9999999.9f)
        return true;

      return false; // never found one
    }
    
    //-------------------------------------------------------------------------
    private void LoadWorkSpace(WorkSpaceScript workspace, string path) {
      string fname = _organizationDictionary["WorkSpaceFile"];
      string line;
      string full_path = Path.Combine(path, fname);
      Debug.Log("LoadWorkSpace fname is " + full_path);
      try {
        StreamReader reader = new StreamReader(full_path, Encoding.Default);
        using (reader) {
          do {
            line = reader.ReadLine().Trim();
            if (line == "WORKSPACELIST" || line == "end")
              continue;
            //Debug.Log("LoadWorkSpace got " + line);
            string[] parts = line.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
            int x = 0;
            int y = 0;
            if (!int.TryParse(parts[0], out x)) Debug.Log("Error: LoadWorkspace parse x " + parts[0] + " line " + line);

            if (!int.TryParse(parts[1], out y)) Debug.Log("Error: LoadWorkspace parse y " + parts[1] + " line " + line);

            char dir = parts[2][0];
            char usage = parts[3][0];
            WorkSpace ws = new WorkSpace(x, y, dir, usage);
            _workSpaces.Add(ws);
          } while (line != "end" && line != null);

          // Use this for initialization
        }

        Debug.Log("LoadWorkSpace got " + _workSpaces.Count);
      }
      catch (Exception e) {
        Debug.LogError(e.Message);
      }

      Debug.Log("LoadWorkSpace got " + _workSpaces.Count);
    }

  }
}