using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.Factories {
  //A factory that creates User GameObjects
  public class UserFactory : MonoBehaviour, iFactory {
    [SerializeField] private UserBehavior _prefab;
    
    public static Dictionary<string, UserBehavior> user_dict = new Dictionary<string, UserBehavior>();
    
    private static readonly string USERS = "users";

    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadUsers(path, parent);
    }

    //-------------------------------------------------------------------------
    private void LoadUsers(string path, Transform parent = null) {
      string user_dir = Path.Combine(GameLoadBehavior.user_app_path, USERS);
      string[] clist = Directory.GetFiles(user_dir);
      foreach (string user_file in clist) {
        if (user_file.EndsWith(".sdf")) {
          UserBehavior newUser = Instantiate(_prefab, parent);
          var data = LoadOneUser(user_file);
          int pos = data.position;
          
          if (pos < 0) {
            Debug.Log("LoadOneUser got invalid pos for " + data.user_name);
            continue;
          }
          
          WorkSpace ws = WorkspaceFactory.GetWorkSpace(pos);
          if (ws == null) {
            Debug.Log("UserBehavior got null workspace for pos" + pos);
          }
          else {
            if (!ws.AddUser(data.user_name)) {
              Debug.Log("UserBehavior AddUser, could not user, already populated " + data.user_name);
            }

            ccUtils.GridTo3dPos(ws.x, ws.y, out float xf, out float zf);
            Vector3 v = new Vector3(xf - 1.0f, 0.5f, zf);
            newUser.transform.position = v;
          }
          
          newUser.gameObject.SetActive(true);
          newUser.gameObject.name = $"User--{data.user_name}";
          newUser.Data = data;
          user_dict.Add(newUser.Data.user_name, newUser);
        }
      }
    }

    //---------------------------------------------------------------------------
    private UserDataObject LoadOneUser(string user_file) {
      UserDataObject data = new UserDataObject();
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      var this_user_info = new Dictionary<string, string>();

      LoadUser(cfile, ref this_user_info);

      data.gender =  this_user_info.ContainsKey("Gender") ? this_user_info["Gender"] : "";
      data.user_name = this_user_info.ContainsKey("Name") ? this_user_info["Name"]   : "";
      data.department = this_user_info.ContainsKey("Dept")? this_user_info["Dept"]   : "";
      
      if (!int.TryParse(this_user_info["PosIndex"], out data.position)) {
        Debug.Log("Error: LoadUser parsing position" + this_user_info["PosIndex"]);
      }

      if (!int.TryParse(this_user_info["InitialTraining"], out data.training)) {
        Debug.Log("Error: LoadUser parsing training" + this_user_info["InitialTraining"]);
      }
      
      return data;
    }
    
    //-------------------------------------------------------------------------
    private static void LoadUser(string thisFilePath, ref Dictionary<string, string> this_user_info) {
      StreamReader reader = new StreamReader(thisFilePath, Encoding.Default);
      using (reader) {
        string tag;
        ccUtils.PositionAfter(reader, "User");
        string value = null;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value == null || tag == null) {
            continue;
          }

          this_user_info[tag] = value;

        } while (value != null);
      }

    }
  }
}