using System;
using UnityEngine;

namespace Code.World_Objects.Network {
  //Data relating to one StaffBehavior instance
  [Serializable]
  public class NetworkDataObject {
    public string name;
    public bool isStatic;
    public bool isLeased;
    public Color color;
  }
}
