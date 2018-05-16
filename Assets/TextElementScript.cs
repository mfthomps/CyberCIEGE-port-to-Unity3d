using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class TextElementScript : MonoBehaviour {

	// Use this for initialization
	void Start()
	{

	}



	// Called when trigger is fired
	public void OnPointerClick()
	{
		Debug.Log("I've been clicked! " + gameObject.name);
	}
}

