using System;
using System.IO;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.World_Objects.Staff;
using Code.World_Objects.Workspace;

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

    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Staff").transform;
    }

    //--------------------------------------------------------------------------
    void OnDestroy() {
      _staffListVariable.Clear();
    }

    //--------------------------------------------------------------------------
    public void Create(string filename) {
      throw new System.NotImplementedException();
    }

    //--------------------------------------------------------------------------
    public void CreateAll(string path) {
      LoadStaffFromFile(path, _parent);
    }

    //--------------------------------------------------------------------------
    private void LoadStaffFromFile(string path, Transform parent = null) {
      _staffListVariable.Clear();

      string user_dir = Path.Combine(path, STAFF);
      string[] clist = Directory.GetFiles(user_dir);
      foreach (string user_file in clist)
        if (user_file.EndsWith(".sdf")) {

          StaffBehavior newStaff = InstantiateStaffFromFile(user_file, _parent); 
          
          if (newStaff) {
            UpdateGameObject(newStaff);  
          }
          else {
            Debug.LogError($"Couldn't create staff instance using {user_file}");
          }
        }
    }
    
    //--------------------------------------------------------------------------
    private StaffBehavior InstantiateStaffFromFile(string user_file, Transform parent = null) {
      StaffDataObject data = LoadStaffData(user_file);
      if (data == null) {
        return null;
      }

      StaffBehavior prefab = _prefabMapping.GetPrefabByKey(data.type);
      if (!prefab) {
        return null;
      }
      
      StaffBehavior newStaff = Instantiate(prefab, _parent);
      newStaff.Data = data;
      
      _staffListVariable.Add(newStaff);

      return newStaff;
    }
    
    //--------------------------------------------------------------------------
    private StaffDataObject LoadStaffData(string filePath) {
      var data = new StaffDataObject();

      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "User") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                data.user_name = subValue;
                break;
              case "PosIndex":
                if (!int.TryParse(subValue, out data.position)) {
                  Debug.LogError($"StaffFactory parsing position {subValue}");
                }
                break;
              case "Dept":
                data.type = GetStaffType(subValue);
                break;
              case "Cost":
                if (!int.TryParse(subValue, out data.cost)) {
                  Debug.LogError($"StaffFactory parsing cost {subValue}");
                }
                break;
              case "Skill":
                if (!int.TryParse(subValue, out data.skill)) {
                  Debug.LogError($"StaffFactory parsing skill {subValue}");
                }
                break;
              case "HISupportSkill":
                if (!int.TryParse(subValue, out data.hi_skill)) {
                  Debug.LogError($"StaffFactory parsing hi_skill {subValue}");
                }
                break;
              case "HWSupportSkill":
                if (!int.TryParse(subValue, out data.hw_skill)) {
                  Debug.LogError($"StaffFactory parsing hw_skill {subValue}");
                }
                break;
              case "DaysTillAvailable":
                if (!int.TryParse(subValue, out data.daysTillAvailable)) {
                  Debug.LogError($"StaffFactory parsing DaysTillAvailable {subValue}");
                }
                break;
              case "UserDescription":
                data.description = subValue;
                break;
              case "Productivity":
                if (!int.TryParse(subValue, out data.productivity)) {
                  Debug.LogError($"StaffFactory parsing productivity {subValue}");
                }
                break;
              case "DACGroups":
                var groups = subValue.Split(new string[] { ":end" }, StringSplitOptions.None);
                foreach (var group in groups) {
                  data.groups.Add(group.Trim());
                }
                break;
            }
          });
        }
      });

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
      staff.gameObject.name = $"Staff-{staff.Data.type} - {staff.Data.user_name}";
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