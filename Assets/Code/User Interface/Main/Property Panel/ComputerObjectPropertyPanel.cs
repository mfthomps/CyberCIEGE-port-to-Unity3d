using UnityEngine;
using TMPro;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Main {
  public class ComputerObjectPropertyPanel : GenericObjectPropertyPanel<ComputerBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for selected computer's name")]
    public TMP_Text nameLabel;
    [Tooltip("Label for selected computer's assigned user")]
    public TMP_Text assignedUserLabel;
    [Tooltip("Label for selected computer's OS")]
    public TMP_Text osLabel;
    [Tooltip("Label for selected computer's hardware")]
    public TMP_Text hardwareLabel;
    [Tooltip("Label for selected computer's availability")]
    public TMP_Text availabilityLabel;
    [Tooltip("Label for selected computer's domain")]
    public TMP_Text domainLabel;
    [Tooltip("List for selected computer's software")]
    public StringList softwareList;
    [Tooltip("List for selected computer's assets")]
    public StringList assetList;
    [Tooltip("List for selected computer's connected networks")]
    public StringList networkList;

    private ComputerBehavior _displayedComputer;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(ComputerBehavior component) {
      if (_displayedComputer != null) {
        _displayedComputer.OnValueChanged -= UpdateUI;
      }

      _displayedComputer = component;
      _displayedComputer.OnValueChanged += UpdateUI;
      UpdateUI();
    }

    // ------------------------------------------------------------------------
    private void UpdateUI() {
      var computerDataObject = _displayedComputer.Data as ComputerDataObject;

      SetStringProperty(nameLabel, computerDataObject.component_name, computerDataObject.hw_name);
      SetStringProperty(assignedUserLabel, computerDataObject.assignedUser, "No One");
      SetStringProperty(osLabel, computerDataObject.os);
      SetStringProperty(hardwareLabel, computerDataObject.hw, computerDataObject.hw_name);
      SetStringProperty(availabilityLabel, $"{computerDataObject.availability}");
      SetStringProperty(domainLabel, computerDataObject.domain);
      SetStringList(softwareList, computerDataObject.software);
      SetStringList(assetList, computerDataObject.asset_list);
      SetStringList(networkList, computerDataObject.network_list);
    }
  }
}
