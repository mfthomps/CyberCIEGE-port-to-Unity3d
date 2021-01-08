using UnityEngine;

namespace Code.User_Interface {
  public class SelectionList : MonoBehaviour {
    [SerializeField] private GameObject _contentParent;
    [SerializeField] private SelectionListItem itemPrefab;

    public void AddItem(string label) {
      var newItem = Instantiate(itemPrefab, _contentParent.transform);
      newItem.SetLabel(label);
    }
  }
}