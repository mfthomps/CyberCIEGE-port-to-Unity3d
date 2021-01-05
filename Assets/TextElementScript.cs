using UnityEngine;

public class TextElementScript : MonoBehaviour {
  // Use this for initialization
  private void Start() {
  }


  // Called when trigger is fired
  public void OnPointerClick() {
    Debug.Log("I've been clicked! " + gameObject.name);
  }
}