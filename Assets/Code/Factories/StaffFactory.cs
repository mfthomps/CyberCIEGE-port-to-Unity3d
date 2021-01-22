using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.Factories {
  //Factory that create Staff GameObjects
  public class StaffFactory : MonoBehaviour, iFactory {
    public static Dictionary<string, StaffBehavior> staff_dict = new Dictionary<string, StaffBehavior>();
    
    private static readonly string STAFF = "staff";

    [SerializeField] private StaffBehavior _prefab;

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
          
          StaffBehavior newStaff = Instantiate(_prefab, parent);
          
          if (LoadOneStaff(user_file, newStaff)) {
            UpdateGameObject(newStaff);  
          }
          else {
            Debug.LogError($"Couldn't read from the staff file {user_file}");
            Destroy(newStaff.gameObject);  
          }
        }
    }
    
    //--------------------------------------------------------------------------
    private bool LoadOneStaff(string user_file, StaffBehavior staffBehavior) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      var data = LoadStaff(cfile, staffBehavior);
      if (data == null) {
        return false;
      }

      staffBehavior.Data = data;
      return true;
    }
    
    //--------------------------------------------------------------------------
    private static StaffDataObject LoadStaff(string filePath, StaffBehavior staffBehavior) {
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
                staff_dict.Add(data.user_name, staffBehavior);
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