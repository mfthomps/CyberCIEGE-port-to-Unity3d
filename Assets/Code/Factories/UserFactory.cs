using System.IO;
using UnityEngine;

namespace Code.Factories {
  //A factory that creates User GameObjects
  public class UserFactory : MonoBehaviour, iFactory {
    [SerializeField] private UserBehavior _prefab;
    
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
          UserBehavior item = Instantiate(_prefab, parent);
          item.LoadOneUser(user_file);
        }
      }
    }
  }
}