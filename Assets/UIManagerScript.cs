using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class UIManagerScript : MonoBehaviour {
	Text ppButtonText = null;
	// Use this for initialization
	void Start () {
		GameObject ipc;
		GameObject ppButton = GameObject.Find("PausePlayButton");
		//Debug.Log("name is " + ppButton.name);
		UnityEngine.UI.Text[] mylist = ppButton.GetComponentsInChildren<Text>();
		//Debug.Log("size of list is " + mylist.Length);
		//Debug.Log("text is " + mylist[0].text);
		ppButtonText = mylist[0];

		if (ppButtonText == null)
		{
			Debug.Log("button text is null");
			UnityEditor.EditorApplication.isPlaying = false;
			Application.Quit();
		}

	}

	// Update is called once per frame
	void Update () {
		
	}
	public void WasPushed()
	{

		Debug.Log("was pushed");
		if (ppButtonText.text == "play")
		{
			ppButtonText.text = "pause";
			IPCManagerScript.SendRequest("pause");
		}
		else
		{
			ppButtonText.text = "play";
			IPCManagerScript.SendRequest("play");
		}
	}
}
