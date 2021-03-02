using System;
using Code.World_Objects.Workspace;
using UnityEngine;

namespace Code.World_Objects.Office {
  // A World Object that represents an Office Building
  public class OfficeBuilding : BaseWorldObject {
    [Tooltip("The type of Office Building")]
    [SerializeField] private OfficeBuildingType _buildingType;

    [Tooltip("A reference to the WorkSpaceFurniture to instantiate at runtime")]
    [SerializeField] private WorkSpaceFurniture _furniture;

    //--------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Building;
    }

    //--------------------------------------------------------------------------
    public OfficeBuildingType BuildingType {
      get => _buildingType;
      set => _buildingType = value;
    }

    //--------------------------------------------------------------------------
    // Get the furniture set prefab for this office building based on the type of WorkSpace.
    public WorkSpaceFurnitureConfiguration GetWorkSpaceFurniture(WorkSpace.WorkSpaceType workSpaceType) {
      switch (workSpaceType) {
        case WorkSpace.WorkSpaceType.Regular:
          return _furniture.RegularOfficeFurniture;
          break;
        case WorkSpace.WorkSpaceType.Server:
          return _furniture.ServerRoomOfficeFurniture;
          break;
        case WorkSpace.WorkSpaceType.Inactive:
          break;
        default:
          throw new ArgumentOutOfRangeException(nameof(workSpaceType), workSpaceType, null);
      }

      return null;
    }
  }
}