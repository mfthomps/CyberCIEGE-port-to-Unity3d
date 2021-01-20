using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.Factories {
  //Factory that create ITStaff GameObjects
  public class ITStaffFactory : MonoBehaviour, iFactory {
    public static Dictionary<string, ITStaffBehavior> staff_dict = new Dictionary<string, ITStaffBehavior>();
    
    private static readonly string STAFF = "staff";

    [SerializeField] private ITStaffBehavior _prefab;

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
          
          ITStaffBehavior newStaff = Instantiate(_prefab, parent);
          
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
    private bool LoadOneStaff(string user_file, ITStaffBehavior itStaffBehavior) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      var data = LoadStaff(cfile, itStaffBehavior);
      if (data == null) {
        return false;
      }

      itStaffBehavior.Data = data;
      return true;
    }
    
    //--------------------------------------------------------------------------
    private static ITStaffDataObject LoadStaff(string filePath, ITStaffBehavior itStaffBehavior) {
      var data = new ITStaffDataObject();
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
                staff_dict.Add(data.user_name, itStaffBehavior);
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
    private static void UpdateGameObject(ITStaffBehavior staff) {
      staff.gameObject.SetActive(true);
      staff.gameObject.name = $"ITStaff--{staff.Data.user_name}";
      
      int pos = staff.Data.position;
      if (pos < 0) {
        Debug.LogError($"Got invalid pos for '{staff.Data.user_name}'");
      }
      else {
        WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
        if (ws == null) {
          Debug.LogError("ITStaffBehavior got null workspace for pos " + pos);
          return;
        }
        
        if (!ws.AddUser(staff.Data.user_name)) {
          Debug.LogError($"Could not add {staff.Data.user_name} to WorkSpace at pos {pos}, already taken by {ws.user}");
          return;
        }

        float xf, zf;
        ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
        Vector3 v = new Vector3(xf - 1.0f, 0.5f, zf);
        staff.transform.position = v;
      }
    }
  }
}