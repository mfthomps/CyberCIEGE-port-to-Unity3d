using UnityEngine;
using TMPro;
using Code.Clearance;
using Code.Game_Events;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Clearance {
  public class ClearanceView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The variable containing the list of all the Clearances currently in the scenario.")]
    [SerializeField] private ClearanceListVariable clearances;
    [Header("Output Events")]
    [Tooltip("Change the background check level for the selected clearance")]
    public BackgroundCheckChangeGameEvent changeBackgroundLevel;
    [Header("UI Elements")]
    [Tooltip("List of clearances to display")]
    public ClearanceList clearanceList;
    [Tooltip("GameObject for settings section")]
    public GameObject settingsSection;
    [Tooltip("The element that should display the selected clearance's description.")]
    [SerializeField] private TMP_Text selectedClearanceDescription;
    [Tooltip("List of background check levels")]
    public BackgroundCheckList backgroundCheckList;

    private ClearanceBehavior _selectedClearance;

    // ------------------------------------------------------------------------
    void OnEnable() {
      clearances.OnValueChanged += UpdateClearanceList;
      UpdateClearanceList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      clearances.OnValueChanged -= UpdateClearanceList;
    }

    // ------------------------------------------------------------------------
    public void SelectClearance(ClearanceBehavior clearance) {
      _selectedClearance = clearance;
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    public void SetBackgroundCheckLevel(BackgroundCheck.Level level) {
      if (_selectedClearance.Data.backgroundCheckLevel != level) {
        changeBackgroundLevel?.Raise(new BackgroundCheckChange(_selectedClearance.Data.name, level));
        DisplayClearanceInformation(_selectedClearance);
      }
    }

    // ------------------------------------------------------------------------
    private void UpdateClearanceList() {
      clearanceList.SetItems(clearances.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var clearance in clearances.Value) {
        if (clearance != null) {
          clearanceList.SetSelected(clearance, clearance == _selectedClearance);
        }
      }

      DisplayClearanceInformation(_selectedClearance);
    }

    // ------------------------------------------------------------------------
    private void DisplayClearanceInformation(ClearanceBehavior clearance) {
      selectedClearanceDescription.text = clearance != null ? clearance.Data.description : "";
      backgroundCheckList.SetCurrentLevel(clearance != null ? clearance.Data.backgroundCheckLevel : BackgroundCheck.Level.None);
      settingsSection.SetActive(clearance != null);
    }
  }
}
