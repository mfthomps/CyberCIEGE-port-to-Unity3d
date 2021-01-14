using System.IO;
using UnityEngine;

namespace Code.Factories {
  //Factory that create ITStaff GameObjects
  public class ITStaffFactory : MonoBehaviour, iFactory {
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
          ITStaffBehavior item = Instantiate(_prefab, parent);
          item.LoadOneStaff(user_file);
        }
    }
  }
}