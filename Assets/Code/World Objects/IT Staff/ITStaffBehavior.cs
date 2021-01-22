using System.Xml.Linq;
using Code.Factories;
using UnityEngine;

namespace Code {
  public class ITStaffBehavior : MonoBehaviour {
    [SerializeField] private ITStaffDataObject _data;
  
    private static Rect WindowRect = new Rect(10, 10, 250, 300);

    public ITStaffDataObject Data {
      get => _data;
      set => _data = value;
    }

    public static void doItems() {
      WindowRect = GUI.Window(1, WindowRect, HireMenu, "Hire IT/Security");
    }

    private static void HireMenu(int id) {
      foreach (string key in ITStaffFactory.staff_dict.Keys)
        if (GUILayout.Button(key)) {
          ITStaffBehavior script = ITStaffFactory.staff_dict[key];
          // TBD fix cost / salary to match game
          XElement xml = new XElement("userEvent",
            new XElement("hire",
              new XElement("name", script.Data.user_name),
              new XElement("salary", script.Data.cost)),
            new XElement("cost", script.Data.cost));

          Debug.Log(xml);
          IPCManagerScript.SendRequest(xml.ToString());
          menus.clicked = "";
        }
    }
  }
}