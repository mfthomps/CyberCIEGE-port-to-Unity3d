using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Code.User_Interface.Main {
  public class RangeProperty : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("Label for the percentage of the range")]
    public TMP_Text percentageLabel;
    [Tooltip("Parent for pips of the range")]
    public RectTransform pipArea;
    [Tooltip("Prefab for one pip of the range pip area")]
    public Image pipPrefab;
    [Header("Customization")]
    [Tooltip("Percentage each pip represents (1-100 value)")]
    [Range(1, 100)]
    public int percentagePerPip;
    [Tooltip("Color for a low percentage value")]
    public Color lowPercentageColor;
    [Tooltip("Color for a medium percentage value")]
    public Color mediumPercentageColor;
    [Tooltip("Color for a high percentage value")]
    public Color highPercentageColor;

    // ------------------------------------------------------------------------
    public void SetRange(int value, int min, int max) {
      var percentage = 100 * value / (max - min);
      percentageLabel.text = $"{percentage}%";

      // Remove any previous pips we had before
      for (var index = pipArea.childCount - 1; index >= 0; --index) {
        Destroy(pipArea.GetChild(index).gameObject);
      }

      var pipColor = GetPercentageColor(percentage);
      for (var pipPercentage = 0; pipPercentage < percentage; pipPercentage += percentagePerPip) {
        AddPip(pipColor);
      }
    }

    // ------------------------------------------------------------------------
    private Color GetPercentageColor(int percentage) {
      if (percentage < 33) {
        return lowPercentageColor;
      }
      if (percentage < 66) {
        return mediumPercentageColor;
      }
      return highPercentageColor;
    }

    // ------------------------------------------------------------------------
    private void AddPip(Color color) {
      var pip = Instantiate(pipPrefab, pipArea);
      pip.color = color;
    }
  }
}
