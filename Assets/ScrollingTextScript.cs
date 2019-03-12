
// ************************************************************************ 
// File Name:   ScrollingText.cs 
// Purpose:    	Text scrolls across a scissored area, looping.
// Project:	Framework
// Author:      Sarah Herzog  
// Copyright: 	2014 Bounder Games
// ************************************************************************ 


// ************************************************************************ 
// Imports 
// ************************************************************************ 
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml.Linq;
using System.Xml;
using System.IO;
using System.Linq;


// ************************************************************************ 
// Class: ScrollingText
// ************************************************************************ 
public class ScrollingTextScript : MonoBehaviour
{


	// ********************************************************************
	// Serialized Data Members 
	// ********************************************************************
	[SerializeField]
	private int m_numRepeats = 0;
	[SerializeField]
	private bool m_repeatWhenEmpty = true;
	[SerializeField]
	private bool m_autoRemove = false;
	[SerializeField]
	private TextMesh m_textMesh;
	[SerializeField]
	private float m_speed = 40.0f;
	[SerializeField]
	private float m_scissorMin = -4;
	[SerializeField]
	private float m_scissorMax = 4;
	[SerializeField]
	private List<string> m_messages;
	private Dictionary<int, string> handle_dict = new Dictionary<int, string>();

	// ********************************************************************
	// Private Data Members 
	// ********************************************************************
	private int m_currentNumRepeats = 0;


	// ********************************************************************
	// Function:	Start()
	// Purpose:	Run when new instance of the object is created.
	// ********************************************************************
	void Start()
	{
		if (m_messages.Count > 0)
			m_textMesh.text = m_messages[0];
		else
			m_textMesh.text = "";
	}


	// ********************************************************************
	// Function:	Update()
	// Purpose:	Called once per frame.
	// ********************************************************************
	void Update()
	{
		if (m_messages.Count == 0)
			return;
		// Move current message left
		float offset = m_speed * Time.deltaTime;
		//Debug.Log("deltatime is "+Time.deltaTime+" mspeed "+m_speed+" offset is " + offset+" position was "+m_textMesh.transform.position.x);
		m_textMesh.transform.position -= new Vector3(offset, 0, 0);

		// Check if the message is off screen
		if (m_textMesh.GetComponent<Renderer>().bounds.max.x < m_scissorMin)
		{
			if (m_messages.Count > 0)
			{
				//Debug.Log("bounds.max.x is " + m_textMesh.GetComponent<Renderer>().bounds.max.x + " m_scissorMin " + m_scissorMin);
				UseNextMessage();
			}
		}
	}


	// ********************************************************************
	// Function:	UseNextMessage()
	// Purpose:	Updates to the next message
	// ********************************************************************
	private void UseNextMessage(bool new_message=false)
	{
		if (m_messages.Count == 0)
			return;
		//Debug.Log("UseNextMessage");
		bool loadNew = false;

		if (m_currentNumRepeats > m_numRepeats && m_numRepeats != 0)
			loadNew = true;

		if (!(m_repeatWhenEmpty && m_messages.Count <= 1))
		{
			loadNew = true;
			//Debug.Log("not (m_repeatWhenEmpty && mcount <=1)");
		}

		if (m_textMesh.text == "")
			loadNew = true;

		if (m_textMesh.text != m_messages[0])
			loadNew = true;

		if (!loadNew)
			++m_currentNumRepeats;

		if (loadNew)
		{
			if (!new_message)
			{
				if (!m_autoRemove)
					m_messages.Add(m_messages[0]);
				int key = handle_dict.FirstOrDefault(x => x.Value == m_messages[0]).Key;
				handle_dict.Remove(key);
				//Debug.Log("ScrollingText loadNew");
				m_messages.RemoveAt(0);

				m_currentNumRepeats = 0;
			}
			if (m_messages.Count > 0)
				m_textMesh.text = m_messages[0];
			else
				m_textMesh.text = "";
		}

		// Move off screen to the right
		float width = m_textMesh.GetComponent<Renderer>().bounds.max.x
					  - m_textMesh.GetComponent<Renderer>().bounds.min.x;

		m_textMesh.transform.position =
			new Vector3(m_scissorMax + width / 2,
						m_textMesh.transform.position.y,
						m_textMesh.transform.position.z);
	}


	// ********************************************************************
	// Function:	AddMessage()
	// Purpose:	Adds a message to the message queue
	// ********************************************************************
	public void AddMessage(string newMessage, int handle)
	{
		//Debug.Log("ScrollingText AddMessage " + newMessage);
		m_messages.Add(newMessage);
		handle_dict[handle] = newMessage;
		if (m_textMesh.text == "")
			UseNextMessage(true);
	}


	// ********************************************************************
	// Function:	RemoveMessage()
	// Purpose:	Removes a specific message from the queue
	// ********************************************************************
	public void RemoveMessage(string newMessage)
	{
		//Debug.Log("ScrollingText RemoveMessage " + newMessage);

		m_messages.Remove(newMessage);
		if (m_textMesh.text == newMessage)
		{
			m_textMesh.text = "";
		}
	}
	public void AddTickerXXX(string xml)
	{
		//Debug.Log("UserBehavior UpdateStatus xml is " + message);
		StringReader xmlreader = new StringReader(xml);
		XmlDocument xml_doc = new XmlDocument();
		xml_doc.Load(xmlreader);
		XmlNode ticker_node = xml_doc.SelectSingleNode("//ticker");	
	}
	public void AddTicker(string xml)
	{
		//Debug.Log("UserBehavior UpdateStatus xml is " + message);
		StringReader xmlreader = new StringReader(xml);
		XmlDocument xml_doc = new XmlDocument();
		xml_doc.Load(xmlreader);
		XmlNode ticker_node = xml_doc.SelectSingleNode("//ticker");
		string text = ticker_node["text"].InnerText;
		string handle = ticker_node["handle"].InnerText;
		//Debug.Log("AddTicker got text " + text);
		int handle_int = -1;
		if (!int.TryParse(handle, out handle_int))
		{
			Debug.Log("Error: AddTicker parsing handle from " + handle);
		}
		AddMessage(text, handle_int);
	
		//string text = ticker_node["text"].InnerText;
		//string handle = ticker_node["handle"].InnerText;
		//Debug.Log("AddTicker got text " + text);
		//int handle_int = -1;
		if (!int.TryParse(handle, out handle_int))
		{
			Debug.Log("Error: AddTicker parsing handle from " + handle);
		}
		AddMessage(text, handle_int);
	}
	public void WithdrawTicker(int handle)
	{
		Debug.Log("ScrollingTextScript WithdrawTicker, handle " + handle);
		if (!handle_dict.ContainsKey(handle))
		{
			Debug.Log("Error: ScrollingTextScript handle not found " + handle);
			return;
		}
		RemoveMessage(handle_dict[handle]);
		handle_dict.Remove(handle);
	}
	public void WithdrawTicker(string message)
	{
		int handle;
		if (!int.TryParse(message, out handle))
		{
			Debug.Log("Error: WithdrawTicker could not parse " + message);
		}
		else
		{
			WithdrawTicker(handle);
		}
	}
}
