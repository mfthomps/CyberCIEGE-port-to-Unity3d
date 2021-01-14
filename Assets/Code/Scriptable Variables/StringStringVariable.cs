using UnityEngine;

namespace Code.Scriptable_Variables {
  //A ScriptableVariable that contains a Dictionary of type <string,string>
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/String String Dictionary")]
  public class StringStringVariable : DictVariable<string,string> {
  }
}