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
          newStaff.Data = LoadOneStaff(user_file, newStaff);
          UpdateGameObject(newStaff);
        }
    }
    
    //--------------------------------------------------------------------------
    private ITStaffDataObject LoadOneStaff(string user_file, ITStaffBehavior itStaffBehavior) {
      var data = new ITStaffDataObject();
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      
      LoadStaff(cfile, itStaffBehavior, ref data);
      
      return data;
    }
    
    //--------------------------------------------------------------------------
    private static void LoadStaff(string filePath, ITStaffBehavior itStaffBehavior, ref ITStaffDataObject data) {
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.Default);
        using (reader) {
          string tag;
          ccUtils.PositionAfter(reader, "User");
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
    }
    
    //--------------------------------------------------------------------------
    private static void UpdateGameObject(ITStaffBehavior staff) {
      staff.gameObject.SetActive(true);
      staff.gameObject.name = $"ITStaff--{staff.Data.user_name}";
      
      int pos = staff.Data.position;
      if (pos < 0) {
        Debug.Log("LoadOneStaff got invalid pos for " + staff.Data.user_name);
      }
      else {
        WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
        if (ws == null) {
          Debug.Log("ITStaffBehavior got null workspace for pos" + pos);
        }

        if (!ws.AddUser(staff.Data.user_name)) {
          Debug.Log("ITStaffBehavior AddUser, could not user, already populated " + staff.Data.user_name);
        }

        float xf, zf;
        ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
        Vector3 v = new Vector3(xf - 1.0f, 0.5f, zf);
        staff.transform.position = v;
      }
    }
  }
}