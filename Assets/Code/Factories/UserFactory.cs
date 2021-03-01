using System;
using System.IO;
using Code.Scriptable_Variables;
using Code.World_Objects.Workspace;
using UnityEngine;
using Code.World_Objects.User;

namespace Code.Factories {
  //A factory that creates User GameObjects
  public class UserFactory : MonoBehaviour, iFactory {
    [Tooltip("The AvatarMapping to use when instantiating new User GameObjects.")]
    [SerializeField] private AvatarPrefabMapping _mapping;

    [Header("Input Variables")]
    [Tooltip("The list of all the currently loaded workspaces")]
    [SerializeField] private WorkSpaceListVariable _workSpaceListVariable;

    [Header("Output Variables")]
    [Tooltip("The variable containing the list of all the Users currently in the scenario.")]
    [SerializeField] private UserListVariable _userListVariable;
    
    private static readonly string USERS = "users";
    private Transform _parent;

    //-------------------------------------------------------------------------
    private void Start() {
      _parent = new GameObject("Users").transform;
      _mapping.Reset();
    }

    //-------------------------------------------------------------------------
    void OnDestroy() {
      _userListVariable.Clear();
      _mapping.Reset();
    }

    //-------------------------------------------------------------------------
    public void Create(string filename) {
      throw new System.NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path) {
      LoadUsers(path, _parent);
    }

    //-------------------------------------------------------------------------
    private void LoadUsers(string path, Transform parent = null) {
      _userListVariable.Clear();

      string user_dir = Path.Combine(path, USERS);
      string[] clist = Directory.GetFiles(user_dir);
      foreach (string user_file in clist) {
        if (user_file.EndsWith(".sdf")) {
          UserDataObject data = LoadOneUser(user_file);
          var prefab =_mapping.GetPrefab(data.Gender);

          if (!prefab) {
            Debug.LogError($"Can't find a User prefab for gender {data.gender}");
            continue;
          }
          
          GameObject go = Instantiate(prefab, _parent);
          UserBehavior newUser = go.GetComponent<UserBehavior>();
          
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
            Vector3 v = new Vector3(xf, 0, zf);
            go.transform.position = v;
            go.transform.rotation = WorkSpace.GetRotation(ws.GetDirection());
          }
          
          go.gameObject.SetActive(true);
          go.gameObject.name = $"User--{data.user_name}";
          newUser.Data = data;
          newUser.UpdateHighestBackgroundCheck();
          _userListVariable.Add(newUser);
        }
      }
    }

    //---------------------------------------------------------------------------
    private UserDataObject LoadOneUser(string user_file) {
      var data = new UserDataObject();

      ccUtils.ParseSDFFile(user_file, (tag, value) => {
        if (tag == "User") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                data.user_name = subValue;
                break;
              case "Dept":
                data.department = subValue;
                break;
              case "SecrecyClearance":
                data.secrecyClearance = subValue;
                break;
              case "IntegrityClearance":
                data.integrityClearance = subValue;
                break;
              case "DACGroups":
                var groups = subValue.Split(new string[] { ":end" }, StringSplitOptions.None);
                foreach (var group in groups) {
                  data.groups.Add(group.Trim());
                }
                break;
              case "AssetGoal":
                ccUtils.ParseSDFFileSubElement(subValue, (assetGoalTag, assetGoalValue) => {
                  switch (assetGoalTag) {
                    case "AssetGoalName":
                      data.assetGoals.Add(assetGoalValue);
                      break;
                  }
                });
                break;
              case "InitialTraining":
                if (!int.TryParse(subValue, out data.training)) {
                  Debug.Log("Error: LoadUser parsing training" + subValue);
                }
                break;
              case "Happiness":
                if (!int.TryParse(subValue, out data.happiness)) {
                  Debug.Log("Error: LoadUser parsing happiness" + subValue);
                }
                break;
              case "Productivity":
                if (!int.TryParse(subValue, out data.productivity)) {
                  Debug.Log("Error: LoadUser parsing productivity" + subValue);
                }
                break;
              case "PosIndex":
                if (!int.TryParse(subValue, out data.position)) {
                  Debug.Log("Error: LoadUser parsing position" + subValue);
                }
                break;
              case "Gender":
                data.gender = subValue;
                break;
              case "UserDescription":
                data.description = subValue;
                break;
            }
          });
        }
      });

      return data;
    }
  }
}