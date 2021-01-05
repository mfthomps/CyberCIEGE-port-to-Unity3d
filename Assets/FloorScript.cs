using UnityEngine;

public class FloorScript : MonoBehaviour {
  // Use this for initialization
  private void Start() {
  }

  // Update is called once per frame
  private void Update() {
  }

  public void DoPosition(int top, int left, int bottom, int right) {
    Vector3 scale = transform.localScale;
    scale.x = right - left;
    scale.z = top - bottom;
  }
}