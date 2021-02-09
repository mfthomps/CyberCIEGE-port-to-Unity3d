using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Components {
  //Represents one selectable Computer item in the Computer List UI screen
  public class ComputerListItem : SelectableListItem<ComputerBehavior> {
    [Tooltip("The icon for a workstation computer.")]
    [SerializeField]
    private Image workstationIcon;
    [Tooltip("The icon for a server computer.")]
    [SerializeField]
    private Image serverIcon;
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField]
    private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public override void SetItem(ComputerBehavior item) {
      this.name = item.Data.component_name;
      labelUI.text = item.Data.component_name;
      workstationIcon.gameObject.SetActive(!(item.Data as ComputerDataObject).isServer);
      serverIcon.gameObject.SetActive((item.Data as ComputerDataObject).isServer);
    }
  }
}