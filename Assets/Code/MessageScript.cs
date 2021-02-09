using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class MessageScript : MonoBehaviour {
  [SerializeField] private TMP_Text text;

  [SerializeField] private Button close_button;

  // Use this for initialization
  private void Start() {
    close_button.onClick.AddListener(CloseClicked);
  }

  public void CloseClicked() {
    gameObject.SetActive(false);
    IPCManagerScript.DialogClosed();
  }

  public void ShowMessage(string message) {
    text.text = message;
    gameObject.SetActive(true);
  }

}