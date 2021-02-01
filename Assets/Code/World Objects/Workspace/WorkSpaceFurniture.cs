using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;
using UnityUtilities;

namespace Code.World_Objects.Workspace {
  
  //A group of furniture items prefabs that populate WorkSpaces
  [Serializable]
  public class WorkSpaceFurniture {
    [Tooltip("The string that defines which office this furniture should go with.")]
    [SerializeField] public string _associatedOfficeMagicString;
    
    [Header("Regular Room")]
    [Tooltip("The chair prefab to use in a regular work space")]
    public GameObject _workSpaceChairPrefab;
    [Tooltip("The work station prefab to use in a regular work space")]
    public GameObject _workSpaceWorkDeskPrefab;
    public List<GameObject> _random1List = new List<GameObject>();
    public List<GameObject> _random2List = new List<GameObject>();
    
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
      return ShouldHaveADesk(workSpaceIndex) ? _workSpaceWorkDeskPrefab : null;
    }

    //-------------------------------------------------------------------------
    private bool ShouldHaveADesk(int workSpaceIndex) {
      if (_invalidIndexRange.From < 0 || _invalidIndexRange.To < 0) {
        return true;
      }
      
      return workSpaceIndex >= 0 && 
             workSpaceIndex < _invalidIndexRange.From ||
             workSpaceIndex > _invalidIndexRange.To;
    }
  }
}