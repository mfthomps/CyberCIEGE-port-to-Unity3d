using TMPro;
using UnityEngine;
using UnityEngine.UI;

//used to manage the attack button
public class AttackLogButton : MonoBehaviour {
  [SerializeField]
  private Button button;

  [SerializeField]
  private TMP_Text buttonText;
  
  public void SetHasNewLogs(bool newLogs) {
    if (newLogs) {
      if (buttonText) {
        buttonText.fontStyle = FontStyles.Bold;
        buttonText.faceColor = Color.red;
      }
    }
    else {
      if (buttonText) {
        buttonText.fontStyle = FontStyles.Normal;
        buttonText.faceColor = Color.black;
      }
    }
  }
}
