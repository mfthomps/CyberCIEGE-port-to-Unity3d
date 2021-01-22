using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //Factory that create Staff GameObjects
  public class StaffFactory : MonoBehaviour, iFactory {
    [Tooltip("The scriptable variable to store all the current Staff instances.")]
    [SerializeField] private StaffListVariable _staffListVariable;
    
    //TODO Remove this dictionary when its not referenced anymore, in lieu of the StaffListVariable. 
    public static Dictionary<string, StaffBehavior> staff_dict = new Dictionary<string, StaffBehavior>();
    
    private static readonly string STAFF = "staff";
    
    [Tooltip("Mapping of magic department string to StaffBehavior prefab")]
    [SerializeField] private StringToStaffBehaviorMappingObject _prefabMapping;

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
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      StaffDataObject data = LoadStaffData(cfile);
      if (data == null) {
        return null;
      }

      StaffBehavior prefab = _prefabMapping.GetPrefabByKey(data.department);
      if (!prefab) {
        return null;
      }
      
      StaffBehavior newStaff = Instantiate(prefab, parent);
      newStaff.Data = data;
      staff_dict.Add(data.user_name, newStaff);
      _staffListVariable.Add(newStaff);

      return newStaff;
    }
    
    //--------------------------------------------------------------------------
    private static StaffDataObject LoadStaffData(string filePath) {
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
                data.department = value;
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
    private static void UpdateGameObject(StaffBehavior staff) {
      staff.gameObject.SetActive(staff.Data.IsCurrentlyHired());
      staff.gameObject.name = $"Staff-{staff.Data.department}--{staff.Data.user_name}";
    }
  }
}