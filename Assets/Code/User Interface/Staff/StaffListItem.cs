using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Code.World_Objects.Staff;

namespace Code.User_Interface {
  //Represents one selectable Staff item in the Staff List UI screen
  public class StaffListItem : SelectableListItem<StaffBehavior> {
    [Tooltip("The element that should display the item's label string.")]
    public TMP_Text label;
    [Tooltip("The element that should display whether the staff is hired or not.")]
    public Toggle hiredToggle;
    [Tooltip("The element that should display the staff's type.")]
    public Image staffTypeIcon;
    [Tooltip("The map of StaffType to icon Sprites")]
    public StaffTypeIconMap staffTypeIconMap;

    private StaffBehavior _item;

    //-------------------------------------------------------------------------
    void OnDestroy() {
      if (_item != null) {
        _item.Data.OnValueChanged -= UpdateUI;
      }
    }

    //-------------------------------------------------------------------------
    public override void SetItem(StaffBehavior item) {
      _item = item;
      item.Data.OnValueChanged += UpdateUI;
      UpdateUI();
    }

    //-------------------------------------------------------------------------
    private void UpdateUI() {
      if (this != null) {
        this.name = _item.Data.user_name;
        label.text = _item.Data.user_name;
        hiredToggle.isOn = _item.Data.IsCurrentlyHired();
        staffTypeIcon.sprite = staffTypeIconMap.GetStaffTypeIcon(_item.Data.type);
        if (staffTypeIcon.sprite == null) {
          staffTypeIcon.enabled = false;
        }
      }
    }
  }
}