
using UnityEngine;

namespace Code.Scriptable_Variables {
  //A ScriptableVariable that contains a list of ViewPoints
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/View Point List")]
  public class ViewPointListVariable : ListVariable<ViewPoint.ViewPoint> {
    
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(ViewPointListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class ViewPointListVariableEditor : ViewPointListVariable.BaseScriptableVariableEditor {
  }
#endif
}