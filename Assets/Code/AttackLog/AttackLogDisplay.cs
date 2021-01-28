using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

//Responsible for rendering the actual attack logs in the UI
namespace Code.AttackLog {
  // Main UI class for the AttackLog Dialog
  public class AttackLogDisplay : MonoBehaviour {
    [SerializeField] private AttackLogItem attackLogItem;
    [Tooltip("The close button that should close the dialog.")]
    [SerializeField] private Button closeButton;
    [SerializeField] private Transform scrollviewContentArea;
    [SerializeField] private AttackLogList _attackLogList;

    public delegate void OnClosed();
    //Fired when the dialog has been closed
    public event OnClosed OnDialogClosed;

    //---------------------------------------------------------------------------
    private void Start() {
      if (closeButton) {
        closeButton.onClick.AddListener(HideDialog);
      }
    }

    //---------------------------------------------------------------------------
    private void OnDestroy() {
      if (closeButton) {
        closeButton.onClick.RemoveListener(HideDialog);
      }
    }

    //---------------------------------------------------------------------------
    public void SetLogItems(List<string> logs) {
      _attackLogList.AddUniqueItems(logs);
    }

    //---------------------------------------------------------------------------
    //Show the Attack Log dialog on the screen and render the supplied logs
    public void ShowDialog() {
      gameObject.SetActive(true);
    }

    //---------------------------------------------------------------------------
    public void HideDialog() {
      if (gameObject.activeSelf) {
        OnDialogClosed?.Invoke();
        gameObject.SetActive(false);        
      }
      _attackLogList.SetAllAsRead();
    }
  }
}