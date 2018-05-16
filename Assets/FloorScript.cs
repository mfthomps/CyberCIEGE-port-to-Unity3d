using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FloorScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	public void DoPosition(int top, int left, int bottom, int right)
	{
		Vector3 scale = transform.localScale;
		scale.x = right - left;
		scale.z = top - bottom;
	}
	// Update is called once per frame
	void Update () {
		
	}

}
