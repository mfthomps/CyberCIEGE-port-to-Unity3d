using UnityEngine;
using TMPro;

//used to manage the attack button
namespace Code.AttackLog {
  public class AttackLogButton : MonoBehaviour {
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
}
