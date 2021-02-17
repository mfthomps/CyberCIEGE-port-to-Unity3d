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
    }

    // --------------------------------------------------------------------------
    public void HideTip() {
      if (animator) {
        animator.SetBool("Active", false);
      }
      else {
        uiRoot.SetActive(false);
      }
    }
  }
}
