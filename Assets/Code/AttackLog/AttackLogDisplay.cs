using System.Collections.Generic;
using TMPro;
using UnityEngine;

//Responsible for rendering the actual attack logs in the UI
namespace Code.AttackLog {
  public class AttackLogDisplay : MonoBehaviour {
    [SerializeField] private TMP_Text textField;

    //---------------------------------------------------------------------------
    //Show the Attack Log dialog on the screen and render the supplied logs
    public void ShowDialog(List<string> logs) {
      if (textField) {
        textField.text = string.Join("\n", logs);
      }
      gameObject.SetActive(true);
    }

    //---------------------------------------------------------------------------
    public void HideDialog() {
      gameObject.SetActive(false);
    }
  }
}