using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class DACGroups {
  public static Dictionary<string, string> group_dict = new Dictionary<string, string>();

  public DACGroups() {
    string dac_file = Path.Combine(GameLoadBehavior.user_app_path, "groups.sdf");
    Debug.Log("DACGroups " + dac_file);
    string value = null;
    string tag;
    group_dict["Public"] = "";
    StreamReader reader = new StreamReader(dac_file, Encoding.Default);
    // broken SDF syntax for groups, is:
    // Group: Engineering :end
    // Domain:  :end
    // InitialBackGroundCheck: None: end
    // Group: COMPANY: end
    // Domain:  :end
    // InitialBackGroundCheck: None: en
    //
    //
    using (reader) {
      ccUtils.PositionAfter(reader, "DACGroups");
      do {
        value = ccUtils.SDTNext(reader, out tag);
        if (value == null || value == "end")
          continue;
        // TBD fix domain management.
        string domain = ccUtils.SDTNext(reader, out tag);
        string background = ccUtils.SDTNext(reader, out tag);
        group_dict[value] = background;
        Debug.Log("DACGroups added " + value);
      } while (value != null && value != "end");
    }
  }
}