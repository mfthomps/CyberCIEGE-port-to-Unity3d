using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

//Responsible for rendering the actual attack logs in the UI
namespace Code.AttackLog {
  public class AttackLogDisplay : MonoBehaviour {
    [Tooltip("Text text UI to display the logs")]
    [SerializeField] private TMP_Text textField;
    [Tooltip("The close button that should close the dialog.")]
    [SerializeField] private Button closeButton;

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
    //Show the Attack Log dialog on the screen and render the supplied logs
    public void ShowDialog(IEnumerable<string> logs) {
      if (textField) {
        textField.text = string.Join("\n", logs);
      }
      gameObject.SetActive(true);
    }

    //---------------------------------------------------------------------------
    public void HideDialog() {
      if (gameObject.activeSelf) {
        OnDialogClosed?.Invoke();
        gameObject.SetActive(false);        
      }
    }
  }
}