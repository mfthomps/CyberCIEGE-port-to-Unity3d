using System.Collections.Generic;
using UnityEngine;

//Responsible for rendering the actual attack logs in the UI
namespace Code.AttackLog {
  // Main UI class for the AttackLog Dialog
  public class AttackLogDisplay : MonoBehaviour {
    [SerializeField] private AttackLogList _attackLogList;

    public delegate void OnClosed();
    //Fired when the dialog has been closed
    public event OnClosed OnDialogClosed;

    //---------------------------------------------------------------------------
    void OnDisable() {
      _attackLogList.SetAllAsRead();
      OnDialogClosed?.Invoke();
    }

    //---------------------------------------------------------------------------
    public void SetLogItems(List<string> logs) {
      _attackLogList.AddUniqueItems(logs);
    }
  }
}