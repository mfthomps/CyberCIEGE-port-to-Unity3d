using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace Code.User_Interface {
  [System.Serializable]
  public class ItemClickedEvent : UnityEvent<SelectionListItem> {}
  
  public class SelectionList : MonoBehaviour {
    [SerializeField] private GameObject _contentParent;
    [SerializeField] private SelectionListItem itemPrefab;

    //Called when an Item in the list has been selected
    public ItemClickedEvent ItemClicked;
    
    private List<SelectionListItem> _items = new List<SelectionListItem>();
    
    //-------------------------------------------------------------------------
    public void AddItem(string label) {
      var newItem = Instantiate(itemPrefab, _contentParent.transform);
      newItem.SetLabel(label);
      newItem.OnClicked += OnItemClicked;
      _items.Add(newItem);
    }

    //-------------------------------------------------------------------------
    public void Clear() {
      foreach (SelectionListItem item in _items) {
        item.OnClicked -= OnItemClicked;
        Destroy(item.gameObject);
      }
      _items.Clear();
    }

    //-------------------------------------------------------------------------
    private void OnItemClicked(SelectionListItem selectionListItem) {
      ItemClicked?.Invoke(selectionListItem);
    }
  }
}