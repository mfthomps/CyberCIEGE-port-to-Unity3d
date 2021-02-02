using System;
using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;

namespace Code.User_Interface.Zone {
  public class ZoneSettingTypeList : DynamicList<ZoneSettingTypeListItem, ZoneSettingType> {
    public delegate void ZoneSettingTypeEventHandler(ZoneSettingType type);
    public ZoneSettingTypeEventHandler onZoneSettingTypeSelected;

    [Header("UI Elements")]
    [Tooltip("ToggleGroup for ZoneSettingTypeListItems")]
    public ToggleGroup toggleGroup;
    [Header("Customization")]
    [Tooltip("Starting staff type to display")]
    public ZoneSettingType initialZoneSettingType = ZoneSettingType.GeneralSettings;

    private ZoneSettingType _selectedZoneSettingType;

    // ------------------------------------------------------------------------
    void Awake() {
      _selectedZoneSettingType = initialZoneSettingType;

      ClearItems();
      foreach (ZoneSettingType ZoneSettingType in Enum.GetValues(typeof(ZoneSettingType))) {
        AddItem(ZoneSettingType);
      }
    }

    // ------------------------------------------------------------------------
    public ZoneSettingType GetSelectedType() {
      return _selectedZoneSettingType;
    }

    // ------------------------------------------------------------------------
    protected override void OnItemAdded(ZoneSettingType item, ZoneSettingTypeListItem itemUI) {
      itemUI.toggle.group = toggleGroup;
      itemUI.toggle.isOn = item == initialZoneSettingType;
      itemUI.toggle.onValueChanged.AddListener(isOn => {
        if (isOn) {
          _selectedZoneSettingType = item;
          onZoneSettingTypeSelected?.Invoke(item);
        }
      });
    }
  }
}
