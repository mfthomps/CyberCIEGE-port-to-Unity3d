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

    // look at the camera
    this.transform.LookAt(mainCamera.transform);
    // apply vertical offset
    this.transform.localPosition = centerOfMass.localPosition + new Vector3(0f, verticalOffset, 0f);

  }
}
