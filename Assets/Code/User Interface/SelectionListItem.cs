using TMPro;
using UnityEngine;

namespace Code.User_Interface {
  //Represents one generic item in the selection list
  public class SelectionListItem : MonoBehaviour {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField] private TMP_Text labelUI;

    //-------------------------------------------------------------------------
    public void SetLabel(string label) {
      labelUI.text = label;
      this.name = label;
    }
  }
}
