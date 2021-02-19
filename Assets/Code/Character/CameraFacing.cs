using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFacing : MonoBehaviour
{
  private Camera mainCamera;

  [SerializeField] private Transform centerOfMass;
  public float verticalOffset = 1f;
  private void Start () {
    mainCamera = Camera.main;
  }
  private void Update () {
    Vector3 vector = mainCamera.transform.eulerAngles;
    // Vector3 vector = new Vector3(mainCamera.transform.position.x - this.transform.position.x, mainCamera.transform.position.y - this.transform.position.y, mainCamera.transform.position.z - this.transform.position.z);
    // vector.Normalize();
    this.transform.eulerAngles = vector;
    this.transform.localPosition = centerOfMass.localPosition + new Vector3(0f,verticalOffset,0f);

  }
}
