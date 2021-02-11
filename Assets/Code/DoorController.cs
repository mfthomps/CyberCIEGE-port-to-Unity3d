using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorController : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField] private Animator animator;

    private void OnTriggerEnter(Collider other) {
      animator.SetBool("Open", true);
    }

    private void OnTriggerExit(Collider other) {
      animator.SetBool("Open", false);

    }
}
