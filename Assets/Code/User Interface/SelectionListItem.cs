using TMPro;
using UnityEngine;

namespace Code.User_Interface {
  //Represents one generic item in the selection list
  public class SelectionListItem : MonoBehaviour {
    [Tooltip("The element that should display the item's label string.")] [SerializeField]
    private TMP_Text labelUI;

    public delegate void OnClickedDelegate(SelectionListItem item);
    
    //called when this item has been clicked
    public OnClickedDelegate OnClicked;

    //-------------------------------------------------------------------------
    public void SetLabel(string label) {
      labelUI.text = label;
      this.name = label;
    }

    //-------------------------------------------------------------------------
    //Call this when the item should be selected. Usually connected to a UnityEvent 
    //on a button or toggle.
    public void Click() {
      OnClicked?.Invoke(this);
    }
  }
}