using UnityEditor;
using UnityEngine;

namespace Code.Scriptable_Variables {
  //A ScriptableVariable that contains a Dictionary of type <string,string>
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/String String Dictionary")]
  public class StringStringVariable : DictVariable<string,string> {
  }

#if UNITY_EDITOR
  //Custom editor to display a read-list of the key/value pairs in a StringStringVariable
  [CustomEditor(typeof(StringStringVariable))]
  public class StringStringEditor : Editor {
   
    public override void OnInspectorGUI() {
      serializedObject.Update();
      DrawDefaultInspector();
      
      EditorGUILayout.LabelField("Properties:");
      StringStringVariable t = target as  StringStringVariable;
      if (t == null) {
        return;
      }

      foreach (string key in t.Keys()) {
        string value = t[key];
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.SelectableLabel(key, EditorStyles.textField, GUILayout.Height(EditorGUIUtility.singleLineHeight));
        EditorGUILayout.SelectableLabel(value, EditorStyles.textField, GUILayout.Height(EditorGUIUtility.singleLineHeight));
        EditorGUILayout.EndHorizontal();        
      }
    }
  }
#endif
}