using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

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
    [SerializeField] private GameObject Desk;

    [Tooltip("References to all objects that characters can sit on in this WorkSpace.")]
    [ReorderableList]
    [SerializeField] private List<SittableObject> _sittables = new List<SittableObject>();

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
      if (childIndex >= 0 && childIndex < ComponentRoot.childCount) {
        return ComponentRoot.GetChild(childIndex);
      }
      return null;
    }

    //-------------------------------------------------------------------------
    //Get the first available sittable object. Currently just getting the first one 
    //in the list, but could be extended to check if it's empty, etc.
    public SittableObject GetFirstAvailableSittableObject() {
      return _sittables.Count > 0 ? _sittables[0] : null;
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