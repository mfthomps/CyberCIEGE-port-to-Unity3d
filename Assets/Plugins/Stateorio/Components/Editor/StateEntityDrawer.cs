using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

// [CustomPropertyDrawer (typeof (FsmCore.StateEntity))]
public class StateEntityDrawer : PropertyDrawer {

	public override void OnGUI (Rect position, SerializedProperty property, GUIContent label) {
		int oldIndentLevel = EditorGUI.indentLevel;
		label = EditorGUI.BeginProperty (position, label, property);

		property.isExpanded = EditorGUI.Foldout (position, property.isExpanded, label);

		if (property.isExpanded) {
			EditorGUI.PrefixLabel (position, label);

			position.y += 18f;
			position.height = 16f;
			EditorGUI.PropertyField (position, property.FindPropertyRelative ("State"));

			EditorGUI.indentLevel += 1;
			TransitionRuleDrawer.showTransitionRuleList (property.FindPropertyRelative ("Transitions"));
		}

		EditorGUI.EndProperty ();
		EditorGUI.indentLevel = oldIndentLevel;
	}

	public override float GetPropertyHeight (SerializedProperty property, GUIContent label) {
		return property.isExpanded ? 16f + 18f : 16f;
	}

	public static void showStateEntityList (SerializedProperty list) {
		EditorGUILayout.PropertyField (list);

		EditorGUI.indentLevel += 1;
		EditorGUIUtility.labelWidth = 100f;
		if (list.isExpanded) {
			EditorGUILayout.PropertyField (list.FindPropertyRelative ("Array.size"));
			for (int i = 0; i < list.arraySize; ++i) {
				showStateEntity (list.GetArrayElementAtIndex (i), i);
			}
		}
		EditorGUI.indentLevel -= 1;
	}

	public static void showStateEntity (SerializedProperty se, int index) {
		string label = index == 0 ? "Initial" : "State " + index;
		EditorGUILayout.PropertyField (se, new GUIContent (label));
	}
}
