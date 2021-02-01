using System;
using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;

namespace Code.User_Interface.Components {
  public class ComponentSettingTypeList : DynamicList<ComponentSettingTypeListItem, ComponentSettingType> {
    public delegate void ComponentSettingTypeEventHandler(ComponentSettingType type);
    public ComponentSettingTypeEventHandler onComponentSettingTypeSelected;

    [Header("UI Elements")]
    [Tooltip("ToggleGroup for ComponentSettingTypeListItems")]
    public ToggleGroup toggleGroup;
    [Header("Customization")]
    [Tooltip("Starting staff type to display")]
    public ComponentSettingType initialComponentSettingType = ComponentSettingType.GeneralSettings;

    private ComponentSettingType _selectedComponentSettingType;

    // ------------------------------------------------------------------------
    void Awake() {
      _selectedComponentSettingType = initialComponentSettingType;

      ClearItems();
      foreach (ComponentSettingType componentSettingType in Enum.GetValues(typeof(ComponentSettingType))) {
        AddItem(componentSettingType);
      }
    }

    // ------------------------------------------------------------------------
    public ComponentSettingType GetSelectedType() {
      return _selectedComponentSettingType;
    }

    // ------------------------------------------------------------------------
    protected override void OnItemAdded(ComponentSettingType item, ComponentSettingTypeListItem itemUI) {
      itemUI.toggle.group = toggleGroup;
      itemUI.toggle.isOn = item == initialComponentSettingType;
      itemUI.toggle.onValueChanged.AddListener(isOn => {
        if (isOn) {
          _selectedComponentSettingType = item;
          onComponentSettingTypeSelected?.Invoke(item);
        }
      });
    }
  }
}
