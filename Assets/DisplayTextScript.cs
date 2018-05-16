using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DisplayTextScript : MonoBehaviour {
	public RectTransform myTextPanel;
	public GameObject myTextPrefab;
	public RectTransform procPanel;
	public GameObject procPrefab;
	public RectTransform passwordPanel;

	//public RectTransform assetPanel;
	public Dropdown asset_dropdown;

	//public GameObject dropdownPrefab;

	public GameObject passwordPrefab;

	public Button closeButton;
	private float nextMessage;
	private int myNumber = 0;
	private GameObject newText;
	private GameObject newTog;
	List<string> stringlist;
	protected static GUIStyle label_style = new GUIStyle();



	// Use this for initialization
	void Start () {
		stringlist = new List<string>();
		stringlist.Add("hi");
		stringlist.Add("there");
		stringlist.Add("what?");
		stringlist.Add("hi");
		stringlist.Add("there");
		stringlist.Add("what?");
		stringlist.Add("hi");
		stringlist.Add("there");
		stringlist.Add("what?");
		stringlist.Add("hi");
		stringlist.Add("there");
		stringlist.Add("what?");
		stringlist.Add("hi");
		stringlist.Add("there");
		stringlist.Add("what?");
		nextMessage = Time.time + 1f;
		label_style.normal.textColor = Color.black;
		this.closeButton.onClick.AddListener(CloseClicked);
	}
	public void CloseClicked()
	{
		foreach (Transform child in procPanel)
		{
			GameObject.Destroy(child.gameObject);
		}

		foreach (Transform child in passwordPanel)
		{
			GameObject.Destroy(child.gameObject);
		}



		Debug.Log("Component menu closed");
		this.gameObject.SetActive(false);
	}
	public void SetPassword(string group_name, Dictionary<string, bool> dict, ComputerBehavior computer)
	{
		GameObject newText = (GameObject)Instantiate(myTextPrefab);
		newText.transform.SetParent(passwordPanel);
		newText.GetComponent<Text>().text = group_name;

		foreach (KeyValuePair<string, bool> entry in dict)
		{
			//Debug.Log("SetPassword for " + entry.Key);
			GameObject newTog = (GameObject)Instantiate(procPrefab);
			newTog.transform.SetParent(passwordPanel);
			Toggle t = (Toggle)newTog.GetComponent<Toggle>();
			if (t == null)
			{
				Debug.Log("Toggle is null");
				return;
			}
			t.GetComponentInChildren<Text>().text = entry.Key;
			t.isOn = entry.Value;
			t.onValueChanged.AddListener(delegate
			{
				computer.PasswordChanged(group_name, t);
			});

		}
	}
	public void SetProc(Dictionary<string, bool> dict, ComputerBehavior computer)
	{
		foreach (KeyValuePair<string,bool> entry in dict)
		{
			GameObject newTog = (GameObject)Instantiate(procPrefab);
			newTog.transform.SetParent(procPanel);

			Toggle t = (Toggle) newTog.GetComponent<Toggle>();
			if (t == null)
			{
				Debug.Log("Toggle is null");
				return;
			}
			t.GetComponentInChildren<Text>().text = entry.Key;
			t.isOn = entry.Value;
			t.onValueChanged.AddListener(delegate
			{
				computer.ProcChanged(t);
			});

			//Debug.Log("added " + entry.Key);
		}

	}
	public void SetAssets(List<string> asset_list, ComputerBehavior computer)
	{
		asset_dropdown.ClearOptions();
		List<Dropdown.OptionData> ddo = new List<Dropdown.OptionData>();
		foreach (string asset in asset_list)
		{

			Dropdown.OptionData new_data = new Dropdown.OptionData(asset);
			ddo.Add(new_data);
			//asset_dropdown.options.Add(new Dropdown.OptionData(asset));
			Debug.Log("SetAsset adding " + asset);
		}
		asset_dropdown.AddOptions(ddo);
		Debug.Log("SetAsset done");
		
	}
	// Update is called once per frame
	void Update () {
		if (Time.time > nextMessage && myNumber <stringlist.Count)
		{
			GameObject newText = (GameObject)Instantiate(myTextPrefab);
			newText.transform.SetParent(myTextPanel);
			newText.GetComponent<Text>().text = stringlist[myNumber];
			myNumber++;
			nextMessage = Time.time + 1f;
		}
	}
}
