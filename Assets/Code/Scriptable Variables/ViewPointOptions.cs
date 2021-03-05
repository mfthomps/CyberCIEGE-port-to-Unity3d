using Shared.ScriptableVariables;
using UnityEngine;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/View Point Options")]
  public class ViewPointOptions : ScriptableVariable {
    public bool ForceCamera;
  }
}