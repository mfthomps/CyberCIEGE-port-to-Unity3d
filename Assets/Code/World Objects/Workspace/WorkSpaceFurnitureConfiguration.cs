using UnityEngine;

namespace Code.World_Objects.Workspace {
  
  //Used to reference a hierarchy of WorkSpace Furniture items
  public class WorkSpaceFurnitureConfiguration : MonoBehaviour {
    [Tooltip("The root Transform containing all the 'random 1' child furniture objects")]
    [SerializeField] public Transform Random1Root;
    [Tooltip("The root Transform containing all the 'random 2' child furniture objects")]
    [SerializeField] public Transform Random2Root;
    [Tooltip("The GameObject to use as the WorkSpace Desk")]
    [SerializeField] public GameObject Desk;
    
    [Header("Misc")]
    [Tooltip("The WorkSpace index values that should *not* provide workspace desks (inclusive)")]
    [SerializeField] public UnityUtilities.RangeInt _invalidIndexRange = new UnityUtilities.RangeInt(-1, -1);

    [Tooltip("The offset from the WorkSpace to use for added Computers, to place them on a desk.")]
    public WorkSpaceFurnitureOffset ComputerOffset;

    
    //-------------------------------------------------------------------------
    public void SetupFurniture(int random1, int random2, int workSpaceIndex) {
      ActivateChildren(Random1Root, random1, workSpaceIndex);
      ActivateChildren(Random2Root, random2, workSpaceIndex);
      Desk.SetActive(IsApplicableWorkSpaceIndex(workSpaceIndex));
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