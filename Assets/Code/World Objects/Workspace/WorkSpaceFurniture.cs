using System;
using UnityEngine;

namespace Code.World_Objects.Workspace {
  
  //Contains a set of WorkSpace furniture for a particular office.
  [Serializable]
  public class WorkSpaceFurniture {
    
    [Tooltip("The WorkSpaceFurnitureConfiguration prefab to use for regular WorkSpaces")]
    [SerializeField] private WorkSpaceFurnitureConfiguration _regularOfficeFurniture;
    [Tooltip("The WorkSpaceFurnitureConfiguration to use for server room WorkSpaces ")]
    [SerializeField] private WorkSpaceFurnitureConfiguration _serverRoomOfficeFurniture;

    public WorkSpaceFurnitureConfiguration RegularOfficeFurniture => _regularOfficeFurniture;

    public WorkSpaceFurnitureConfiguration ServerRoomOfficeFurniture => _serverRoomOfficeFurniture;
    
  }
}