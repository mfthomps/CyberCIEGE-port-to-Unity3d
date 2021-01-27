using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Shared.SEUI;

namespace Code.AttackLog {
  public class AttackLogList : DynamicList<AttackLogItem, string> {
      // Start is called before the first frame update

    public void SetAllAsRead () {
      foreach (var item in listItems) {
        item.Value.SetAsRead(true);
      }
    }

  }
}