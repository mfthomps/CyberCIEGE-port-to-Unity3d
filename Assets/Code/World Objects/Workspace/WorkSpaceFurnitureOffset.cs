using System;
using UnityEngine;

namespace Code.World_Objects.Workspace {
  //Represents a position offset from the parent WorkSpace based on the 
  //WorkSpace's Direction.
  [Serializable]
  public class WorkSpaceFurnitureOffset {
    public Vector3 NorthRelativeOffset;
    public Vector3 EastRelativeOffset;
    public Vector3 SouthRelativeOffset;
    public Vector3 WestRelativeOffset;

    public Vector3 GetOffset(Direction dir) {
      switch (dir) {
        case Direction.North:
          return NorthRelativeOffset;
        case Direction.East:
          return EastRelativeOffset;
        case Direction.South:
          return SouthRelativeOffset;
        case Direction.West:
          return WestRelativeOffset;
        default:
          throw new ArgumentOutOfRangeException(nameof(dir), dir, null);
      }
    }
  }
}