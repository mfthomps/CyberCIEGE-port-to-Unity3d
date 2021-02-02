using System;
using System.Collections.Generic;
using UnityEngine;

namespace Code.User_Interface.Zone {
  public class ZoneSettingViewArea : MonoBehaviour {
    [Serializable]
    public class ViewArea {
      public ZoneSettingType type;
      public GameObject area;
    }

    [Header("UI Elements")]
    [Tooltip("List of Zone setting types")]
    public ZoneSettingTypeList ZoneSettingTypeList;
    [Tooltip("List of Zone setting areas")]
    public List<ViewArea> viewAreas = new List<ViewArea>();

    // ------------------------------------------------------------------------
    void OnEnable() {
      ZoneSettingTypeList.onZoneSettingTypeSelected += UpdateActiveViewArea;
      UpdateActiveViewArea(ZoneSettingTypeList.GetSelectedType());
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      ZoneSettingTypeList.onZoneSettingTypeSelected -= UpdateActiveViewArea;
    }

    // ------------------------------------------------------------------------
    private void UpdateActiveViewArea(ZoneSettingType visibleType) {
      foreach (var viewArea in viewAreas) {
        viewArea.area.SetActive(viewArea.type == visibleType);
      }
    }
  }
}
