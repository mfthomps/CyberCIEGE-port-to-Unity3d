using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MessageScript : MonoBehaviour {
  public Text text;

  public Button close_button;

  // Use this for initialization
  void Start() {
    this.close_button.onClick.AddListener(CloseClicked);
  }

  public void CloseClicked() {
    this.gameObject.SetActive(false);
    IPCManagerScript.DialogClosed();
  }

  public void ShowMessage(string message) {
    text.text = message;
    this.gameObject.SetActive(true);
  }
}