using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.Scriptable_Variables;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Main {
  public class ComputerObjectPropertyPanel : GenericObjectPropertyPanel<ComputerBehavior> {
    [Header("Input Variables")]
    [Tooltip("List of zones in scenario")]
    public ZoneListVariable zones;
    [Header("UI Elements")]
    [Tooltip("Label for selected computer's name")]
    public TMP_Text nameLabel;
    [Tooltip("Toggle for whether the computer is connected to a network or not")]
    public Toggle connectedLight;
    [Tooltip("Label for selected computer's assigned user")]
    public TMP_Text assignedUserLabel;
    [Tooltip("Label for selected computer's OS")]
    public TMP_Text osLabel;
    [Tooltip("Label for selected computer's hardware")]
    public TMP_Text hardwareLabel;
    [Tooltip("Label for selected computer's current zone")]
    public TMP_Text zoneLabel;
    [Tooltip("Label for selected computer's domain")]
    public TMP_Text domainLabel;
    [Tooltip("Property to show how the computer is being used")]
    public ComputerUsageProperty computerUsage;
    [Tooltip("Label for selected computer's utilization")]
    public TMP_Text utilizationLabel;
    [Tooltip("Label for selected computer's availability")]
    public TMP_Text availabilityLabel;
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
      var assignedZone = zones.GetZone(_displayedComputer);

      SetStringProperty(nameLabel, computerDataObject.component_name, computerDataObject.hw_name);
      connectedLight.isOn = computerDataObject.network_list.Count > 0;
      SetStringProperty(assignedUserLabel, computerDataObject.assignedUser, "No One");
      SetStringProperty(osLabel, computerDataObject.os);
      SetStringProperty(hardwareLabel, computerDataObject.hw, computerDataObject.hw_name);
      SetStringProperty(zoneLabel, assignedZone != null ? assignedZone.Data.ZoneName : "Unknown");
      SetStringProperty(domainLabel, computerDataObject.domain);
      computerUsage.SetComputer(_displayedComputer);
      SetStringProperty(utilizationLabel, $"{computerDataObject.utilization}");
      SetStringProperty(availabilityLabel, $"{computerDataObject.availability}");
      SetStringList(softwareList, computerDataObject.software_list);
      SetStringList(assetList, computerDataObject.asset_list);
      SetStringList(networkList, computerDataObject.network_list);
    }
  }
}
