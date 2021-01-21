using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.Hardware;

namespace Code.User_Interface.Buy {
  public class HardwareUI : MonoBehaviour {
    public delegate void HardwareEventHandler();
    public event HardwareEventHandler onBuyHardware;

    [Header("Input Variables")]
    [Tooltip("Variable containing all hardware (computers, servers, routers, etc) information for game")]
    public HardwareCatalogVariable hardwareCatalog;
    [Header("UI Elements")]
    [Tooltip("Icon for this hardware")]
    public Image icon;
    [Tooltip("Label for the name of this piece of hardware")]
    public TMP_Text nameLabel;
    [Tooltip("Label for the description of this piece of hardware")]
    public TMP_Text descriptionLabel;
    [Tooltip("Label for the OS of this piece of hardware")]
    public TMP_Text osLabel;
    [Tooltip("Label for cost for this piece of hardware")]
    public TMP_Text costLabel;

    // ------------------------------------------------------------------------
    public void SetHardware(Code.Hardware.Hardware hardware) {
      icon.sprite = hardwareCatalog.Value.GetHardwareAsset(hardware.id)?.icon;
      nameLabel.text = hardware.name;
      descriptionLabel.text = hardware.description;
      osLabel.text = hardware.os;
      costLabel.text = string.Format("{0:C0}", hardware.cost);
    }

    // ------------------------------------------------------------------------
    public void Buy() {
      onBuyHardware?.Invoke();
    }
  }
}
