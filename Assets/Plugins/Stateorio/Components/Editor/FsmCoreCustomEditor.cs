using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

// [CustomEditor (typeof (FsmCore))]
[CanEditMultipleObjects]
public class FsmCoreCustomEditor : Editor {

	public override void OnInspectorGUI () {
		serializedObject.Update ();
		TransitionRuleDrawer.showTransitionRuleList (serializedObject.FindProperty ("GlobalState"));
		StateEntityDrawer.showStateEntityList (serializedObject.FindProperty ("States"));
		serializedObject.ApplyModifiedProperties ();
	}
}
