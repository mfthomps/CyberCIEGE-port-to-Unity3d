using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[CustomPropertyDrawer (typeof (FsmCore.TransitionRule))]
public class TransitionRuleDrawer : PropertyDrawer {

	public override void OnGUI (Rect position, SerializedProperty property, GUIContent label) {
		int oldIndentLevel = EditorGUI.indentLevel;
		label = EditorGUI.BeginProperty (position, label, property);

		Rect contentPosition = EditorGUI.PrefixLabel (position, label);
		EditorGUI.indentLevel = 0;

		Rect oldContentPosition = contentPosition;
		EditorGUILayout.BeginHorizontal ();
		contentPosition.height = 16f;
		contentPosition.width *= 0.75f;
		EditorGUIUtility.labelWidth = 24f;
		EditorGUI.PropertyField (contentPosition, property.FindPropertyRelative ("Next"), new GUIContent("To"));
		contentPosition.x += contentPosition.width;
		contentPosition.width /= 3f;
		EditorGUIUtility.labelWidth = 28f;
		EditorGUI.PropertyField (contentPosition, property.FindPropertyRelative ("Priority"), new GUIContent("Prio"));
		EditorGUILayout.EndHorizontal ();
		contentPosition = oldContentPosition;

		oldContentPosition = contentPosition;
		EditorGUILayout.BeginHorizontal ();
		contentPosition.y += 18f;
		contentPosition.height = 16f;
		contentPosition.width *= 0.75f;
		EditorGUIUtility.labelWidth = 24f;
		EditorGUI.PropertyField (contentPosition, property.FindPropertyRelative ("Cond"), new GUIContent("On"));
		contentPosition.x += contentPosition.width;
		contentPosition.width /= 3f;
		EditorGUIUtility.labelWidth = 28f;
		EditorGUI.PropertyField (contentPosition, property.FindPropertyRelative ("Not"), new GUIContent("Not"));
		EditorGUILayout.EndHorizontal ();
		contentPosition = oldContentPosition;

		EditorGUI.EndProperty ();
		EditorGUI.indentLevel = oldIndentLevel;
	}

	public override float GetPropertyHeight (SerializedProperty property, GUIContent label) {
		return 16f + 18f;
	}

	public static void showTransitionRuleList (SerializedProperty list) {
		EditorGUILayout.PropertyField (list);

		EditorGUI.indentLevel += 1;
		EditorGUIUtility.labelWidth = 120f;
		if (list.isExpanded) {
			EditorGUILayout.PropertyField (list.FindPropertyRelative ("Array.size"));
			for (int i = 0; i < list.arraySize; ++i)
				showTransitionRule (list.GetArrayElementAtIndex (i), i);
		}
		EditorGUI.indentLevel -= 1;
	}

	public static void showTransitionRule (SerializedProperty tr, int index) {
		string label = "Transition " + index;
		EditorGUILayout.PropertyField (tr, new GUIContent(label));
	}
}
