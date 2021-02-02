using System;
using System.IO;
using System.Text;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.World_Objects.Staff;

namespace Code.Factories {
  //Factory that create Staff GameObjects.
  //Call HireStaff() to hire an unemployed staff member.
  public class StaffFactory : MonoBehaviour, iFactory {
    [Header("Input Variables")]
    [Tooltip("The scriptable variable to store all the current Staff instances.")]
    [SerializeField] private StaffListVariable _staffListVariable;
    [Tooltip("The list of all the currently loaded workspaces")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;

    private static readonly string STAFF = "staff";
    private const string STAFF_TYPE_TECH = "Tech";
    private const string STAFF_TYPE_SECURITY = "Security";
    
    [Tooltip("Mapping of magic department string to StaffBehavior prefab")]
    [SerializeField] private StaffTypeBehaviorMappingObject _prefabMapping;

    //--------------------------------------------------------------------------
    void OnDestroy() {
      _staffListVariable.Clear();
    }

    //--------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //--------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadStaffFromFile(path, parent);
    }

    //--------------------------------------------------------------------------
    private void LoadStaffFromFile(string path, Transform parent = null) {
      _staffListVariable.Clear();

      string user_dir = Path.Combine(path, STAFF);
      string[] clist = Directory.GetFiles(user_dir);
      foreach (string user_file in clist)
        if (user_file.EndsWith(".sdf")) {

          StaffBehavior newStaff = InstantiateStaffFromFile(user_file, parent); 
          
          if (newStaff) {
            UpdateGameObject(newStaff);  
          }
          else {
            Debug.LogError($"Couldn't create staff instance using {user_file}");
          }
        }
    }
    
    //--------------------------------------------------------------------------
    private StaffBehavior InstantiateStaffFromFile(string user_file, Transform parent=null) {
      StaffDataObject data = LoadStaffData(user_file);
      if (data == null) {
        return null;
      }

      StaffBehavior prefab = _prefabMapping.GetPrefabByKey(data.type);
      if (!prefab) {
        return null;
      }
      
      StaffBehavior newStaff = Instantiate(prefab, parent);
      newStaff.Data = data;
      
      _staffListVariable.Add(newStaff);

      return newStaff;
    }
    
    //--------------------------------------------------------------------------
    private StaffDataObject LoadStaffData(string filePath) {
      var data = new StaffDataObject();
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.Default);
        using (reader) {
          string tag;
          ccUtils.PositionAfter(reader, "User");
          //if this is the end of the stream, then something went bad
          if (reader.EndOfStream) {
            return null;
          }
          string value;
          do {
            value = ccUtils.SDTNext(reader, out tag);
            if (value == null || tag == null) {
              continue;
            }

            switch (tag) {
              case "Name":
                data.user_name = value;
                break;
              case "PosIndex":
                if (!int.TryParse(value, out data.position)) {
                  Debug.LogError("LoadStaff parsing position " + value);
                }
                break;
              case "Dept":
                data.type = GetStaffType(value);
                break;
              case "Cost":
                if (!int.TryParse(value, out data.cost)) {
                  Debug.LogError("LoadStaff parsing cost " + value);
                }
                break;
              case "Skill":
                if (!int.TryParse(value, out data.skill)) {
                  Debug.LogError("LoadStaff parsing skill " + value);
                }

                break;
              case "HISupportSkill":
                if (!int.TryParse(value, out data.hi_skill)) {
                  Debug.LogError("LoadStaff parsing hi_skill " + value);
                }

                break;
              case "HWSupportSkill":
                if (!int.TryParse(value, out data.hw_skill)) {
                  Debug.LogError("LoadStaff parsing hw_skill " + value);
                }
                break;
              case "DaysTillAvailable":
                if (!int.TryParse(value, out data.daysTillAvailable)) {
                  Debug.LogError("LoadStaff parsing DaysTillAvailable " + value);
                }
                break;
            }
          } while (value != null);
        }
      }
      catch (Exception e) {
        Debug.LogError(e.ToString());
      }

      return data;
    }
    
    //--------------------------------------------------------------------------
    private void UpdateGameObject(StaffBehavior staff) {
      //Position the new Staff based on their "position", read from the .sdf file.
      WorkSpace ws = _workSpaceListVariable.GetWorkSpace(staff.Data.position);
      if (ws == null) {
        Debug.Log($"Can't find a position to place {staff.Data.user_name} with position {staff.Data.position}");
      }
      else {
        ccUtils.GridTo3dPos(ws.x, ws.y, out float xf, out float zf);
        // Vector3 v = new Vector3(xf - 1.0f, 0.5f, zf); //TODO what were these offsets for?
        staff.transform.position = new Vector3(xf, 0, zf);
      }
      
      //activate and rename
      staff.gameObject.SetActive(staff.Data.IsCurrentlyHired());
      staff.gameObject.name = $"Staff-{staff.Data.type}--{staff.Data.user_name}";
    }
    
    //--------------------------------------------------------------------------
    private StaffType GetStaffType(string department) {
      switch (department) {
        case STAFF_TYPE_TECH:
          return StaffType.Tech;
        case STAFF_TYPE_SECURITY:
          return StaffType.Security;
      }
      return StaffType.Invalid;
    }
  }
}