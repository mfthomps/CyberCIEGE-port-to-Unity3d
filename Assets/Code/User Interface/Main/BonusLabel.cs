using UnityEngine;
using Shared.ScriptableVariables;
using TMPro;

namespace Code.User_Interface.Main {
  public class BonusLabel : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Current bonus value")]
    public IntVariable currentBonus;
    [Header("UI Elements")]
    [Tooltip("Text label for whether this is a bonus or penalty")]
    public TMP_Text label;

    // ------------------------------------------------------------------------
    void OnEnable() {
      currentBonus.OnValueChanged += UpdateLabel;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      currentBonus.OnValueChanged -= UpdateLabel;
    }

    // ------------------------------------------------------------------------
    void UpdateLabel() {
      label.text = currentBonus.Value >= 0 ? "BONUS" : "PENALTY";
    }
  }
}
