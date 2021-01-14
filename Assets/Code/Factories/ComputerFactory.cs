using System.IO;
using UnityEngine;

namespace Code.Factories {
  //Factory that creates Computers
  public class ComputerFactory : MonoBehaviour, iFactory {
    [SerializeField] private ComputerBehavior _prefab;
    
    private static readonly string COMPUTERS = "computers";

    public GameObject Create(Transform parent = null) {
      var item = Instantiate(_prefab, parent);
      return item.gameObject;
    }

    public void CreateAll(string path, Transform parent = null) {
      LoadAllComputers(path);
    }
    
    public void CreateOne(string filename, Transform parent = null) {
      var item = Instantiate(_prefab, parent);
      item.LoadOneComputer(filename);
    }

    private void LoadAllComputers(string path, Transform parent = null) {
      string cdir = Path.Combine(path, COMPUTERS);
      string[] clist = Directory.GetFiles(cdir);
      foreach (string computer_file in clist) {
        ComputerBehavior item = Instantiate(_prefab, parent);
        item.LoadOneComputer(computer_file);
      }
    }
  }
}