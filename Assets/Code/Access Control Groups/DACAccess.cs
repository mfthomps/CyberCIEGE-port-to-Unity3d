using System;
using System.Collections.Generic;

namespace Code.AccessControlGroup {
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
    public DACAccess(string accessor) {
      this.accessor = accessor;
    }

    // ------------------------------------------------------------------------
    public DACAccess(string accessor, PermissionType defaultEnabled) {
      this.accessor = accessor;
      foreach (PermissionType type in Enum.GetValues(typeof(PermissionType))) {
        permissions[type] = type == defaultEnabled;
      }
    }

    // ------------------------------------------------------------------------
    public DACAccess(string accessor, string permissionTypeString) {
      this.accessor = accessor;
      SetPermissions(permissionTypeString);
    }

    // ------------------------------------------------------------------------
    public void SetPermissions(string permissionTypeString) {
      foreach (PermissionType type in Enum.GetValues(typeof(PermissionType))) {
        permissions[type] = permissionTypeString[(int)type] == 'Y';
      }
    }
  }
}
