using System;
using System.Collections.Generic;
using Shared.SEUI;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Main {
  [Serializable]
  public class ComputerUsage {
    public string user;
    public List<ComputerDataObject.AssetUsage> usages;

    // ------------------------------------------------------------------------
    public ComputerUsage(string user, List<ComputerDataObject.AssetUsage> usages) {
      this.user = user;
      this.usages = usages;
    }
  }

  public class ComputerUsageList : DynamicList<ComputerUsageListItem, ComputerUsage> {
    // ------------------------------------------------------------------------
    public void AddUsage(string username, List<ComputerDataObject.AssetUsage> usages) {
      AddItem(new ComputerUsage(username, usages));
    }
  }
}
