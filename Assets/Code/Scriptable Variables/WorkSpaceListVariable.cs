using Code.World_Objects.Workspace;
using UnityEngine;

namespace Code.Scriptable_Variables {
  //A ScriptableVariable that contains a list of WorkSpace data objects
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/WorkSpace List")]
  public class WorkSpaceListVariable : ListVariable<WorkSpace> {
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }
    
    //-----------------------------------------------------------------------------
    public bool FindClosestWorkspaceCenter(Vector2 gridPosition, out int xout, out int yout, out int index) {
      xout = 0;
      yout = 0;
      index = -1;
      
      float distance = 9999999.9f;

      for (int i = 0; i < Value.Count; i++) {
        float temp = (gridPosition.x - Value[i].x) * (gridPosition.x - Value[i].x)
                     + (gridPosition.y - Value[i].y) * (gridPosition.y - Value[i].y);
        if (temp < distance) {
          index = i;
          distance = temp;
          xout = Value[i].x;
          yout = Value[i].y;
        }
      }

      if (distance < 9999999.9f) {
        return true;
      }

      return false; // never found one
    }
    
    //-----------------------------------------------------------------------------
    public WorkSpace GetWorkSpace(int pos) {
      if (pos >= Value.Count || pos < 0) {
        Debug.Log("Workspace request out of range " + pos);
        return null;
      }
      return Value[pos];
    }

  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(WorkSpaceListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class WorkSpaceListVariableEditor : WorkSpaceListVariable.BaseScriptableVariableEditor {
  }
#endif

}