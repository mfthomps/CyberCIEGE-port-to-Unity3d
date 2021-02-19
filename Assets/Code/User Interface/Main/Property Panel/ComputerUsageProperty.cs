using UnityEngine;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Main {
  public class ComputerUsageProperty : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("List of computer usages")]
    public ComputerUsageList usageList;

    // ------------------------------------------------------------------------
    public void SetComputer(ComputerBehavior computer) {
      usageList.ClearItems();
      foreach (var username in computer.GetUsersUsing()) {
        usageList.AddUsage(username, computer.GetAssetUsages(username));
      }

      // Hide this property if we don't have any items in our list
      gameObject.SetActive(usageList.listItems.Count > 0);
    }
  }
}
