using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.World_Objects.Staff {
  public class StaffManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    public void ToggleStaffHired() {
      var selectedStaff = selectedObject.Value.GetComponent<StaffBehavior>();
      if (selectedStaff != null) {
        if (!selectedStaff.Data.IsCurrentlyHired()) {
          HireStaff(selectedStaff);
        }
        else {
          FireStaff(selectedStaff);
        }
      }
    }

    // ------------------------------------------------------------------------
    private void HireStaff(StaffBehavior staff) {
      XElement xml = new XElement("userEvent",
        new XElement("hire",
          new XElement("name", staff.Data.user_name),
          new XElement("salary", staff.Data.cost)
        ),
        new XElement("cost", staff.Data.cost)
      );
      IPCManagerScript.SendRequest(xml.ToString());
      staff.SetHired(true);
    }

    // ------------------------------------------------------------------------
    private void FireStaff(StaffBehavior staff) {
      XElement xml = new XElement("userEvent",
        new XElement("fire",
          new XElement("name", staff.Data.user_name)
        )
      );
      IPCManagerScript.SendRequest(xml.ToString());
      staff.SetHired(false);
    }
  }
}
