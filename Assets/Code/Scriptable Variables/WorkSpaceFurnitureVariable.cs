using Code.World_Objects.Workspace;
using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Scriptable_Variables {
  //A scriptable variable that contains WorkSpaceFurniture objects
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/WorkSpace Furniture")]
  public class WorkSpaceFurnitureVariable : ScriptableVariable<WorkSpaceFurniture> {
  }
}