using System;
using System.Collections.Generic;
using UnityEngine;

namespace Code.User_Interface.Components {
  public class ComponentSettingViewArea : MonoBehaviour {
    [Serializable]
    public class ViewArea {
      public ComponentSettingType type;
      public GameObject area;
    }

    [Header("UI Elements")]
    [Tooltip("List of component setting types")]
    public ComponentSettingTypeList componentSettingTypeList;
    [Tooltip("List of component setting areas")]
    public List<ViewArea> viewAreas = new List<ViewArea>();

    // ------------------------------------------------------------------------
    void OnEnable() {
      componentSettingTypeList.onComponentSettingTypeSelected += UpdateActiveViewArea;
      UpdateActiveViewArea(componentSettingTypeList.GetSelectedType());
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      componentSettingTypeList.onComponentSettingTypeSelected -= UpdateActiveViewArea;
    }

    // ------------------------------------------------------------------------
    private void UpdateActiveViewArea(ComponentSettingType visibleType) {
      foreach (var viewArea in viewAreas) {
        viewArea.area.SetActive(viewArea.type == visibleType);
      }
    }
  }
}
