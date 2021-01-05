using UnityEngine;
using UnityEngine.UI;

public class MessageScript : MonoBehaviour {
  public Text text;

  public Button close_button;

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