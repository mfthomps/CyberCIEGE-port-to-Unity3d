using System.Collections;
using UnityEngine;
using TMPro;

namespace Code.HelpTip {
  public class HelpTip : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("UI Root for help tip display")]
    public GameObject uiRoot;
    [Tooltip("Label to display help tip message on")]
    public TMP_Text label;

    private Animator animator;
    private Coroutine clickListener;

    // --------------------------------------------------------------------------
    void Awake() {
      animator = uiRoot.GetComponent<Animator>();
      HideTip();
    }

    // --------------------------------------------------------------------------
    public void ShowTip(string xmlMessage) {
      label.text = HelpTipParser.ParseHelpTip(xmlMessage);
      if (animator) {
        animator.SetBool("Active", true);
      }
      else {
        uiRoot.SetActive(true);
      }
      clickListener = StartCoroutine(CatchClick());
    }

    // --------------------------------------------------------------------------
    private IEnumerator CatchClick() {
      while (true) {
        // Wait until the left mouse button has been pressed
        while (!Input.GetMouseButtonDown(0)) {
          yield return null;
        }

        // Now wait for a left mouse button to be released and check to see if
        // the user dragged at all in the interim
        var dragged = false;
        var downMousePosition = Input.mousePosition;
        while (!Input.GetMouseButtonUp(0)) {
          if (!dragged && (Input.mousePosition - downMousePosition).magnitude > 0.1f) {
            dragged = true;
          }
          yield return null;
        }

        // If the user didn't drag, they clicked, so hide the help tip
        if (!dragged) {
          HideTip();
        }
      }
    }

    // --------------------------------------------------------------------------
    private void HideTip() {
      if (animator) {
        animator.SetBool("Active", false);
      }
      else {
        uiRoot.SetActive(false);
      }
      if (clickListener != null) {
        StopCoroutine(clickListener);
      }
    }
  }
}
