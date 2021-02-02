using System.IO;
using System.Text;
using UnityEngine;
using Code.Scriptable_Variables;
using Code.World_Objects.User;

namespace Code.Factories {
  //A factory that creates User GameObjects
  public class UserFactory : MonoBehaviour, iFactory {
    [SerializeField] private UserBehavior _prefab;

    [Header("Input Variables")]
    [Tooltip("The list of all the currently loaded workspaces")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;

    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Users currently in the scenario.")]
    [SerializeField] private UserListVariable _userListVariable;
    
    private static readonly string USERS = "users";

    //-------------------------------------------------------------------------
    void OnDestroy() {
      _userListVariable.Clear();
    }

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
      _userListVariable.Clear();

      string user_dir = Path.Combine(path, USERS);
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
          
          WorkSpace ws = _workSpaceListVariable.GetWorkSpace(pos);
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
          _userListVariable.Add(newUser);
        }
      }
    }

    //---------------------------------------------------------------------------
    private UserDataObject LoadOneUser(string user_file) {
      var data = new UserDataObject();

      StreamReader reader = new StreamReader(user_file, Encoding.Default);
      using (reader) {
        ccUtils.PositionAfter(reader, "User");
        var value = ccUtils.SDTNext(reader, out string tag);
        while (value != null) {
          switch (tag) {
            case "Name":
              data.user_name = value;
              break;
            case "Dept":
              data.department = value;
              break;
            case "SecrecyClearance":
              data.secrecyClearance = value;
              break;
            case "IntegrityClearance":
              data.integrityClearance = value;
              break;
            case "DACGroups":
              var groups = value.Split('\n');
              foreach (var group in groups) {
                data.groups.Add(group);
              }
              break;
            case "AssetGoal":
              using (var stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""))) {
                using (var substream = new StreamReader(stream)) {
                  var v = ccUtils.SDTNext(substream, out string t);
                  while (v != null) {
                    switch (t) {
                      case "AssetGoalName":
                        data.assetGoals.Add(v);
                        break;
                    }
                    v = ccUtils.SDTNext(substream, out t);
                  };
                }
              }
              break;
            case "InitialTraining":
              if (!int.TryParse(value, out data.training)) {
                Debug.Log("Error: LoadUser parsing training" + value);
              }
              break;
            case "PosIndex":
              if (!int.TryParse(value, out data.position)) {
                Debug.Log("Error: LoadUser parsing position" + value);
              }
              break;
            case "Gender":
              data.gender = value;
              break;
            case "UserDescription":
              data.description = value;
              break;
          }
          value = ccUtils.SDTNext(reader, out tag);
        }
      }

      return data;
    }
  }
}