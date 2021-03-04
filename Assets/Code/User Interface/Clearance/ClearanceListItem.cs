using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.Clearance;

namespace Code.User_Interface.Clearance {
  //Represents one selectable Clearance item in the Clearance List UI screen
  public class ClearanceListItem : SelectableListItem<ClearanceBehavior> {
    [Tooltip("The icon for a secrecy clearance.")]
    [SerializeField] private Image secrecyIcon;
    [Tooltip("The icon for a integrity clearance.")]
    [SerializeField] private Image integrityIcon;
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField] private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(ClearanceBehavior item) {
      this.name = item.Data.name;
      labelUI.text = item.Data.name;
      secrecyIcon.gameObject.SetActive(item.Data.type == ClearanceDataObject.ClearanceType.Secrecy);
      integrityIcon.gameObject.SetActive(item.Data.type == ClearanceDataObject.ClearanceType.Integrity);
    }
  }
}