using System.Collections.Generic;
using UnityEngine;

//Manager of the attack log and when it gets displayed.
namespace Code.AttackLog {
  public class AttackLogScript : MonoBehaviour {
    [Tooltip("The AttackLogDisplay component used to display the attack logs")]
    [SerializeField] private AttackLogDisplay attackLogPanel;

    private static List<string> attack_log = new List<string>();
  
    //----------------------------------------------------------------------------
    private void Start() {
      if (attackLogPanel) {
        attackLogPanel.HideDialog();
      }
    }

    //----------------------------------------------------------------------------
    public static void AddEntry(string entry) {
      Debug.Log("AttackLogScript add " + entry);
      attack_log.Add(entry);
    }

    //----------------------------------------------------------------------------
    public void ShowDialog() {
      menus.ActiveScreen("AttackLog");
      if (attackLogPanel) {
        attackLogPanel.ShowDialog(attack_log);
      }
    }

    //----------------------------------------------------------------------------
    public void HideDialog() {
      if (attackLogPanel) {
        attackLogPanel.HideDialog();
      }
      menus.ClosedScreen("not used");
    }
  }
}