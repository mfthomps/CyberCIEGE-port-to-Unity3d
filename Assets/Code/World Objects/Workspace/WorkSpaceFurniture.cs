using System;
using System.Collections.Generic;
using UnityEngine;

namespace Code.World_Objects.Workspace {
  
  //A group of furniture items prefabs that populate WorkSpaces
  [Serializable]
  public class WorkSpaceFurniture {
    [Tooltip("The string that defines which office this furniture should go with.")]
    [SerializeField] public string _associatedOfficeMagicString;
    
    [Header("Regular Room")]
    [Tooltip("The chair prefab to use in a regular work space")]
    public GameObject _workSpaceChairPrefab;

    [Tooltip("The offset from the WorkSpace to use for the chair in local coordinate system")]
    public WorkSpaceFurnitureOffset ChairOffset;

    [Tooltip("The work station prefab to use in a regular work space")]
    public GameObject _workSpaceWorkDeskPrefab;
    [Tooltip("The offset from the WorkSpace to use for the chair in local coordinate system")]
    public WorkSpaceFurnitureOffset DeskOffset;
    
    public List<GameObject> _random1List = new List<GameObject>();
    [Tooltip("The offset from the WorkSpace to use for the first random item, in local coordinate system")]
    public WorkSpaceFurnitureOffset Random1Offset;

    public List<GameObject> _random2List = new List<GameObject>();
    [Tooltip("The offset from the WorkSpace to use for the second random item, in local coordinate system")]
    public WorkSpaceFurnitureOffset Random2Offset;

    [Tooltip("The offset from the WorkSpace to use for added Computers, to place them on a desk.")]
    public WorkSpaceFurnitureOffset ComputerOffset;
    
    [Header("Server Room")]
    [Tooltip("The lamp to use in the server room")]
    public GameObject _serverRoomLampPrefab;
    [Tooltip("The lamp offset from the WorkSpace, in local coordinate system")]
    public Vector3 _serverRoomLampOffset = new Vector3(0,0,-2);
    
    [Tooltip("The desk prefab to use in the server room")]
    public GameObject _serverRoomDeskPrefab;
    [Tooltip("The table offset from the WorkSpace, in local coordinate system")]
    public Vector3 _serverRoomDeskOffset = new Vector3(0,0,0);
    
    [Tooltip("The server rack prefab to use in the server room")]
    public GameObject _serverRoomServerRackPrefab;
    [Tooltip("The rack offset from the WorkSpace, in local coordinate system")]
    public Vector3 _serverRoomRackOffset = new Vector3(-2,0,1);

    [Header("Misc")]
    [Tooltip("The WorkSpace index values that should *not* provide workspace desks (inclusive)")]
    [SerializeField] public UnityUtilities.RangeInt _invalidIndexRange = new UnityUtilities.RangeInt(-1, -1);

    //-------------------------------------------------------------------------
    public GameObject GetWorkSpaceChair(int workSpaceIndex) {
      return _workSpaceChairPrefab;
    }

    //-------------------------------------------------------------------------
    public GameObject GetWorkSpaceDesk(int workSpaceIndex) {
      return IsApplicableWorkSpaceIndex(workSpaceIndex) ? _workSpaceWorkDeskPrefab : null;
    }

    //-------------------------------------------------------------------------
    public GameObject GetRandomItem1(int randomIndex, int workSpaceIndex) {
      return GetItemFromList(randomIndex, workSpaceIndex, _random1List);
    }

    //-------------------------------------------------------------------------
    public GameObject GetRandomItem2(int randomIndex, int workSpaceIndex) {
      return GetItemFromList(randomIndex, workSpaceIndex, _random2List);
    }

    //-------------------------------------------------------------------------
    private GameObject GetItemFromList(int randomIndex, int workSpaceIndex, IReadOnlyList<GameObject> items) {
      if (randomIndex < items.Count) {
        return IsApplicableWorkSpaceIndex(workSpaceIndex) ? items[randomIndex] : null;
      }

      return null;
    }

    //-------------------------------------------------------------------------
    private bool IsApplicableWorkSpaceIndex(int workSpaceIndex) {
      if (_invalidIndexRange.From < 0 || _invalidIndexRange.To < 0) {
        return true;
      }
      
      return workSpaceIndex >= 0 && 
             workSpaceIndex < _invalidIndexRange.From ||
             workSpaceIndex > _invalidIndexRange.To;
    }
  }
}