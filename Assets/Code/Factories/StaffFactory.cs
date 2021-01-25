using System;
using System.IO;
using System.Text;
using System.Xml.Linq;
using Code.Scriptable_Variables;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Factories {
  //Factory that create Staff GameObjects.
  //Call HireStaff() to hire an unemployed staff member.
  public class StaffFactory : MonoBehaviour, iFactory {
    [Tooltip("The scriptable variable to store all the current Staff instances.")]
    [SerializeField] private StaffListVariable _staffListVariable;

    //TODO This is temporarily called from our own content menu. Once that context menu is removed,
    //this field can be removed (assuming it will be triggered from somewhere else).
    [SerializeField] private StringGameEvent _hireStaffEvent;
    
    private static readonly string STAFF = "staff";
    
    [Tooltip("Mapping of magic department string to StaffBehavior prefab")]
    [SerializeField] private StringToStaffBehaviorMappingObject _prefabMapping;

    //--------------------------------------------------------------------------
    public void Create(string filename, Transform parent = null) {
      throw new System.NotImplementedException();
    }

    //--------------------------------------------------------------------------
    public void CreateAll(string path, Transform parent = null) {
      LoadStaffFromFile(path, parent);
    }

    //--------------------------------------------------------------------------
    //Hire a staff member using their scenario name, if they are currently available
    //to be hired.
    public void HireStaff(string staffUserName) {
      var staff = _staffListVariable.Value.Find(x => x.Data.user_name == staffUserName);
      
      if (staff && staff.Data.CanBeHiredNow()) {
        //activate the object
        staff.Data.SetHired(true);
        staff.gameObject.SetActive(true);
        
        //TODO position the GameObject
        
        XElement xml = new XElement("userEvent",
          new XElement("hire",
            new XElement("name", staff.Data.user_name),
            new XElement("salary", staff.Data.cost)),
          new XElement("cost", staff.Data.cost));
          
        Debug.Log($"Hired Staff: {staff.Data.user_name}");
        IPCManagerScript.SendRequest(xml.ToString());
        menus.clicked = "";        
      }
      else {
        Debug.LogError($"Can't hire {staffUserName}");
      }
    }

    //--------------------------------------------------------------------------
    private void LoadStaffFromFile(string path, Transform parent = null) {
      _staffListVariable.Clear();

      string user_dir = Path.Combine(path, STAFF);
      string[] clist = Directory.GetFiles(user_dir);
      foreach (string user_file in clist)
        if (user_file.EndsWith(".sdf")) {

          StaffBehavior newStaff = InstantiateStaffFromFile(user_file, parent); 
          
          if (newStaff) {
            UpdateGameObject(newStaff);  
          }
          else {
            Debug.LogError($"Couldn't create staff instance using {user_file}");
          }
        }
    }
    
    //--------------------------------------------------------------------------
    private StaffBehavior InstantiateStaffFromFile(string user_file, Transform parent=null) {
      string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
      StaffDataObject data = LoadStaffData(cfile);
      if (data == null) {
        return null;
      }

      StaffBehavior prefab = _prefabMapping.GetPrefabByKey(data.department);
      if (!prefab) {
        return null;
      }
      
      StaffBehavior newStaff = Instantiate(prefab, parent);
      newStaff.Data = data;
      
      _staffListVariable.Add(newStaff);

      return newStaff;
    }
    
    //--------------------------------------------------------------------------
    private static StaffDataObject LoadStaffData(string filePath) {
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
                break;
              case "PosIndex":
                if (!int.TryParse(value, out data.position)) {
                  Debug.LogError("LoadStaff parsing position " + value);
                }
                break;
              case "Dept":
                data.department = value;
                break;
              case "Cost":
                if (!int.TryParse(value, out data.cost)) {
                  Debug.LogError("LoadStaff parsing cost " + value);
                }
                break;
              case "Skill":
                if (!int.TryParse(value, out data.skill)) {
                  Debug.LogError("LoadStaff parsing skill " + value);
                }

                break;
              case "HISupportSkill":
                if (!int.TryParse(value, out data.hi_skill)) {
                  Debug.LogError("LoadStaff parsing hi_skill " + value);
                }

                break;
              case "HWSupportSkill":
                if (!int.TryParse(value, out data.hw_skill)) {
                  Debug.LogError("LoadStaff parsing hw_skill " + value);
                }
                break;
              case "DaysTillAvailable":
                if (!int.TryParse(value, out data.daysTillAvailable)) {
                  Debug.LogError("LoadStaff parsing DaysTillAvailable " + value);
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
      staff.gameObject.SetActive(staff.Data.IsCurrentlyHired());
      staff.gameObject.name = $"Staff-{staff.Data.department}--{staff.Data.user_name}";
    }
    
    //--------------------------------------------------------------------------
    //TODO - Temp context menu
    private static Rect WindowRect = new Rect(10, 10, 250, 300);
    
    //--------------------------------------------------------------------------
    //TODO - Temp menu
    public void doItems() {
      WindowRect = GUI.Window(1, WindowRect, HireMenu, "Hire IT/Security");
    }

    //--------------------------------------------------------------------------
    //TODO - Temp menu
    private void HireMenu(int id) {
      var canBeHiredList = _staffListVariable.Value.FindAll(x => x.Data.CanBeHiredNow());
      foreach (var staff in canBeHiredList) {
        if (GUILayout.Button(staff.Data.user_name)) {
          _hireStaffEvent?.Raise(staff.Data.user_name);
        }
      }
    }

  }
}