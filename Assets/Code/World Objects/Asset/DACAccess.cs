using System;
using System.Collections.Generic;

namespace Code.World_Objects.Asset {
  [Serializable]
  public class DACAccess {
    public enum PermissionType {
      Read = 0,
      Write,
      Control,
      Execute
    }

    public string accessor;
    public Dictionary<PermissionType, bool> permissions = new Dictionary<PermissionType, bool>();

    // ------------------------------------------------------------------------
    public DACAccess(string accessor, string permissionTypeString) {
      this.accessor = accessor;
      foreach (PermissionType type in Enum.GetValues(typeof(PermissionType))) {
        permissions[type] = permissionTypeString[(int)type] == 'Y';
      }
    }

    // ------------------------------------------------------------------------
    public string GetMode() {
      if (permissions[PermissionType.Write]) {
        return "Modify";
      }
      return "Read";
    }
  }
}
