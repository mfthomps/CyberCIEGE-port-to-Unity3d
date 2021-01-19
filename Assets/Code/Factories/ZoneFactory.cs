using System.IO;
using UnityEngine;

namespace Code.Factories {
  //A Factory that creates Zones
  public class ZoneFactory : MonoBehaviour, iFactory {
    [Tooltip("The prefab to use when creating new Zones")]
    [SerializeField] private ZoneBehavior _prefab;
    
    //-------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //-------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadZones(path, parent);
    }

    //-------------------------------------------------------------------------
    private void LoadZones(string path, Transform parent) {
      var colors = new Color[6];
      colors[0] = Color.cyan;
      colors[1] = Color.red;
      colors[2] = Color.green;
      colors[3] = Color.blue;
      string zone_dir = Path.Combine(path, "zones");
      string[] clist = Directory.GetFiles(zone_dir);
      int i = 0;
      foreach (string zone_file in clist)
        if (zone_file.EndsWith(".sdf")) {
          LoadOneZone(zone_file, colors[i]);
          i++;
        }      
    }
    
    //-------------------------------------------------------------------------
    private void LoadOneZone(string zone_file, Color color) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, zone_file);
      
      ZoneBehavior script = Instantiate(_prefab, new Vector3(1.0F, 0, 0), Quaternion.identity);
      
      script.gameObject.GetComponent<Renderer>().material.color = color;
      script.gameObject.SetActive(true);
      script.LoadZone(cfile);
      script.DoPosition();
    }
  }
}