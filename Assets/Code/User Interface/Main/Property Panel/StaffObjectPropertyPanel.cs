using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Code.World_Objects.Staff;

namespace Code.User_Interface.Main {
  public class StaffObjectPropertyPanel : GenericObjectPropertyPanel<StaffBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for selected staff's name")]
    public TMP_Text nameLabel;
    [Tooltip("Label for selected staff's availability")]
    public TMP_Text availabilityLabel;
    [Tooltip("Range for selected staff's productivity")]
    public RangeProperty productivityRange;
    [Tooltip("Label for selected staff's cost")]
    public TMP_Text costLabel;
    [Tooltip("List for selected staff's groups")]
    public StringList groupList;
    [Tooltip("Label for selected staff's description")]
    public TMP_Text descriptionLabel;

    private StaffBehavior _displayedStaff;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(StaffBehavior component) {
      if (_displayedStaff != null) {
        _displayedStaff.OnValueChanged -= UpdateUI;
      }

      _displayedStaff = component;
      _displayedStaff.OnValueChanged += UpdateUI;
      UpdateUI();
    }

    // ------------------------------------------------------------------------
    private void UpdateUI() {
      var displayedDataObject = _displayedStaff.Data;

      SetStringProperty(nameLabel, displayedDataObject.user_name);
      SetStringProperty(availabilityLabel, GetAvailabilityString(displayedDataObject.daysTillAvailable));
      SetRangeProperty(productivityRange, displayedDataObject.productivity);
      SetStringProperty(costLabel, string.Format($"${displayedDataObject.cost} / hour"));
      SetStringList(groupList, displayedDataObject.groups);
      SetStringProperty(descriptionLabel, displayedDataObject.description);
    }

    // ------------------------------------------------------------------------
    private string GetAvailabilityString(int daysTillAvailable) {
      if (daysTillAvailable > 0) {
        return $"{daysTillAvailable} days";
      }
      if (daysTillAvailable == 0) {
        return "Now!";
      }
      return "Hired";
    }
  }
}
