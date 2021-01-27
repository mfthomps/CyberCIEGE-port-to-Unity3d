using System.Collections.Generic;
using Shared.SEUI;

namespace Code.AttackLog {
  // Dynamic List of AttackLogItems
  public class AttackLogList : DynamicList<AttackLogItem, string> {
    // ------------------------------------------------------------------------
    public void AddUniqueItems(List<string> items) {
      // Only add items if we aren't already displaying them
      foreach (var item in items) {
        if (!listItems.ContainsKey(item)) {
          AddItem(item);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void SetAllAsRead() {
      foreach (var item in listItems) {
        item.Value.SetAsRead(true);
      }
    }

  }
}