using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Code.Scriptable_Variables;
using UnityEngine;

namespace Code.Factories {
  //Factory that create Staff GameObjects
  public class StaffFactory : MonoBehaviour, iFactory {
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

          StaffBehavior newStaff = LoadOneStaff(user_file, parent); 
          
          if (newStaff) {
            UpdateGameObject(newStaff);  
          }
          else {
            Debug.LogError($"Couldn't create staff instance using {user_file}");
          }
        }
    }
    
    //--------------------------------------------------------------------------
    private StaffBehavior LoadOneStaff(string user_file, Transform parent=null) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      StaffDataObject data = LoadStaff(cfile);
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
      
      return newStaff;
    }
    
    //--------------------------------------------------------------------------
    private static StaffDataObject LoadStaff(string filePath) {
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
                  Debug.Log("Error: LoadStaff parsing position" + value);
                }
                break;
              case "Dept":
                data.department = value;
                break;
              case "Cost":
                if (!int.TryParse(value, out data.cost)) {
                  Debug.Log("Error: LoadStaff parsing cost" + value);
                }
                break;
              case "Skill":
                if (!int.TryParse(value, out data.skill)) {
                  Debug.Log("Error: LoadStaff parsing skill" + value);
                }

                break;
              case "HISupportSkill":
                if (!int.TryParse(value, out data.hi_skill)) {
                  Debug.Log("Error: LoadStaff parsing hi_skill" + value);
                }

                break;
              case "HWSupportSkill":
                if (!int.TryParse(value, out data.hw_skill)) {
                  Debug.Log("Error: LoadStaff parsing hw_skill" + value);
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
      //This is a new ITStaff, which is presumed to not be hired yet. Hence,
      //this person should not be rendered in the scene.
      //TODO How to know when this Staff person has been hired and _should_ be rendered?
      staff.gameObject.SetActive(false);
      staff.gameObject.name = $"ITStaff--{staff.Data.user_name}";
    }
  }
}