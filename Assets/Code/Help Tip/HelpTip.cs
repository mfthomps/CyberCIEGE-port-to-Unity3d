using UnityEngine;
using TMPro;

namespace Code.HelpTip {
  public class HelpTip : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("UI Root for help tip display")]
    public GameObject uiRoot;
    [Tooltip("Label to display help tip message on")]
    public TMP_Text label;

    // --------------------------------------------------------------------------
    void Awake() {
      HideTip();
    }

    // --------------------------------------------------------------------------
    public void ShowTip(string xmlMessage) {
      label.text = HelpTipParser.ParseHelpTip(xmlMessage);
      uiRoot.SetActive(true);
    }

    // --------------------------------------------------------------------------
    public void HideTip() {
      uiRoot.SetActive(false);
    }
  }
}
