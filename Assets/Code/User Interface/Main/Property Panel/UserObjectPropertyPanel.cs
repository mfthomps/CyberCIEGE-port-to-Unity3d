using UnityEngine;
using TMPro;
using Code.Scriptable_Variables;
using Code.World_Objects.Computer;
using Code.World_Objects.User;

namespace Code.User_Interface.Main {
  public class UserObjectPropertyPanel : GenericObjectPropertyPanel<UserBehavior> {
    [Header("Input Variables")]
    [Tooltip("List of computers in the scenario")]
    public ComputerListVariable computers;
    [Header("UI Elements")]
    [Tooltip("Label for selected user's name")]
    public TMP_Text nameLabel;
    [Tooltip("Range for selected user's happiness")]
    public RangeProperty happinessRange;
    [Tooltip("Range for selected user's productivity")]
    public RangeProperty productivityRange;
    [Tooltip("Range for selected user's training")]
    public RangeProperty trainingRange;
    [Tooltip("Label for selected user's highest background check level")]
    public TMP_Text backgroundCheckLabel;
    [Tooltip("Label for selected user's zone")]
    public TMP_Text zoneLabel;
    [Tooltip("Label for selected user's asset usage")]
    public TMP_Text assetUsageLabel;
    [Tooltip("List for selected user's asset failures")]
    public StringList assetFailureList;
    [Tooltip("List for selected user's locally accessible computers")]
    public StringList localAccessList;
    [Tooltip("Label for selected user's thoughts")]
    public TMP_Text thoughtsLabel;

    private UserBehavior _displayedUser;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(UserBehavior component) {
      if (_displayedUser != null) {
        _displayedUser.OnValueChanged -= UpdateUI;
      }

      _displayedUser = component;
      _displayedUser.OnValueChanged += UpdateUI;
      UpdateUI();
    }

    // ------------------------------------------------------------------------
    private void UpdateUI() {
      var displayedDataObject = _displayedUser.Data;

      SetStringProperty(nameLabel, displayedDataObject.user_name);
      SetRangeProperty(happinessRange, displayedDataObject.happiness);
      SetRangeProperty(productivityRange, displayedDataObject.productivity);
      SetRangeProperty(trainingRange, displayedDataObject.training);
      SetStringProperty(backgroundCheckLabel, BackgroundCheck.ToString(displayedDataObject.highestBackgroundCheck));
      SetStringList(assetFailureList, displayedDataObject.failed_goals);
      SetStringList(localAccessList, computers.Value.FindAll(computer => (computer.Data as ComputerDataObject).assignedUser == displayedDataObject.user_name).ConvertAll(computer => computer.Data.component_name));
      SetStringProperty(thoughtsLabel, displayedDataObject.current_thought);
    }
  }
}
