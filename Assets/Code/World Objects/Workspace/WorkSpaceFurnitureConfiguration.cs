﻿using UnityEngine;

namespace Code.World_Objects.Workspace {
  
  //Used to reference a hierarchy of WorkSpace Furniture items
  public class WorkSpaceFurnitureConfiguration : MonoBehaviour {
    [Header("References")]
    [Tooltip("The root Transform containing all the 'random 1' child furniture objects")]
    [SerializeField] private Transform Random1Root;
    [Tooltip("The root Transform containing all the 'random 2' child furniture objects")]
    [SerializeField] private Transform Random2Root;
    [Tooltip("The root Transform containing all the empty child Transforms references " +
             "used to position computers and devices")]
    [SerializeField] private Transform ComponentRoot;
    [Tooltip("The GameObject to use as the WorkSpace Desk")]
    [SerializeField] public GameObject Desk;

    [Header("Misc")]
    [Tooltip("The WorkSpace index values that should *not* provide workspace desks (inclusive)")]
    [SerializeField] public UnityUtilities.RangeInt _invalidIndexRange = new UnityUtilities.RangeInt(-1, -1);

    //-------------------------------------------------------------------------
    public void SetupFurniture(int random1, int random2, int workSpaceIndex) {
      ActivateChildren(Random1Root, random1, workSpaceIndex);
      ActivateChildren(Random2Root, random2, workSpaceIndex);
      Desk.SetActive(IsApplicableWorkSpaceIndex(workSpaceIndex));
    }

    //-------------------------------------------------------------------------
    //Get the Transform representing the n-th Component child Transform
    public Transform GetComponentTransform(int childIndex) {
      if (childIndex < ComponentRoot.childCount) {
        return ComponentRoot.GetChild(childIndex);
      }
      return null;
    }

    //-------------------------------------------------------------------------
    private void ActivateChildren(Transform parent, int randomChildIndex, int workSpaceIndex) {
      if (parent) {
        for (int i = 0; i < parent.childCount; i++) {
          parent.GetChild(i).gameObject.SetActive((i == randomChildIndex) && IsApplicableWorkSpaceIndex(workSpaceIndex));
        }
      }
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