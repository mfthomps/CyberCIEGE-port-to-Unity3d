using System;
using System.Collections.Generic;
using UnityEngine;
using Code.World_Objects.Staff;

namespace Code.User_Interface {
  // Asset to map StaffType enums to icon Sprites
  [CreateAssetMenu(menuName = "Scriptable Objects/Staff Type Icon Map")]
  public class StaffTypeIconMap : ScriptableObject {
    [Serializable]
    public class StaffTypeIcon {
      [Tooltip("Staff Type for this icon")]
      public StaffType type;
      [Tooltip("Icon for this StaffType")]
      public Sprite sprite;
    }

    [SerializeField]
    private List<StaffTypeIcon> map = new List<StaffTypeIcon>();

    //-------------------------------------------------------------------------
    public Sprite GetStaffTypeIcon(StaffType type) {
      foreach (var staffTypeIcon in map) {
        if (staffTypeIcon.type == type) {
          return staffTypeIcon.sprite;
        }
      }
      return null;
    }
  }
}