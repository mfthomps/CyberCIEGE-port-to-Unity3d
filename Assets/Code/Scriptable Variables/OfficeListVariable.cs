using Code.World_Objects.Office;
using UnityEngine;

namespace Code.Scriptable_Variables {
  //A Scriptable Variable containing a list of OfficeBuildings
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Office List")]
  public class OfficeListVariable : ListVariable<OfficeBuilding> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }

    //-----------------------------------------------------------------------------
    //Get the first Main Office building from the list. Could return NULL.
    public OfficeBuilding GetMainOffice() {
      return Value.Find(x => x.BuildingType == OfficeBuildingType.MainOffice);
    }
    
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(ClearanceListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class OfficeListVariableVariableEditor : OfficeListVariable.BaseScriptableVariableEditor {
  }
#endif
}