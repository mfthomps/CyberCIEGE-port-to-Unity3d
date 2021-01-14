using System;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;
using Code.Factories;
using Code.Scriptable_Variables;
using UnityEditor;
using UnityEngine;

public class IPCManagerScript : MonoBehaviour {
  [SerializeField] private StringListVariable attackLogVariable;
  [SerializeField] private GameLoadBehavior _gameLoadBehavior;
  [SerializeField] private DeviceFactory _deviceFactory;
  [SerializeField] private ComputerFactory _computerFactory;
  
  private static NetworkStream serverStream;

  // Use this for initialization
  private static string read_string;

  private static ScrollingTextScript scrolling_text;

  //static ToolTipScript tool_tip_script = null;
  public static bool server_ready; /* ignore server messages until we receive the ready message */
  private static float elapsed_since_receive;

  private void Start() {
    GameObject go = GameObject.Find("ScrollText");
    scrolling_text = (ScrollingTextScript) go.GetComponent(typeof(ScrollingTextScript));
    //go = GameObject.Find("ToolTip");
    //tool_tip_script = (ToolTipScript)go.GetComponent(typeof(ToolTipScript));
  }

  // Update is called once per frame
  private void Update() {
    float delta = Time.deltaTime;
    elapsed_since_receive += delta;
    if (elapsed_since_receive > 0.1f)
      elapsed_since_receive = 0.0f;
    else
      return;

    //Debug.Log("call receive");
    int len = ReceiveMsg();
    while (len > 0) {
      if (!server_ready) {
        if (read_string == "ready") {
          Debug.Log("IPCManager got server ready");
          server_ready = true;
          _gameLoadBehavior.AfterServerReady();
          SendRequest("begin");
          SendRequest("on_screen:" + menus.UI_SCREEN_OFFICE);
        }

        return;
      }

      string command = read_string;
      string message = null;
      //Debug.Log("buf [" + read_string + "]");
      if (read_string.IndexOf(':') > 0) message = ccUtils.GetCommand(read_string, out command);

      //Debug.Log("IPC update got command " + command + " message [" + message+"]");
      switch (command) {
        case "status":
          //Debug.Log("got status %s" + message);
          GameStatusScript.UpdateStatus(message);
          break;
        case "attack_log":
          //Debug.Log("got status %s" + message);
          // AttackLogScript.AddEntry(message);
          var logs = attackLogVariable.Value;
          logs.Add(message);
          //note: have to create a new List in order to trigger the OnChanged() event
          attackLogVariable.Value = new List<string>(logs);
          break;
        case "load_computer":
          _computerFactory.CreateOne(message + ".sdf");
          break;
        case "load_device":
          _deviceFactory.CreateOne(message + ".sdf");
          break;
        case "user_status":
          UserBehavior.UpdateStatus(message);
          break;
        case "ticker":
          scrolling_text.AddTicker(message);
          break;
        case "withdraw_ticker":
          scrolling_text.WithdrawTicker(message);
          break;
        case "message":
          MessageScript message_panel =
            (MessageScript) menus.menu_panels["MessagePanel"].GetComponent(typeof(MessageScript));
          message_panel.ShowMessage(message);
          break;
        case "yes_no":
          YesNoScript yesno_panel = (YesNoScript) menus.menu_panels["YesNoPanel"].GetComponent(typeof(YesNoScript));
          yesno_panel.ShowMessage(message);
          break;
        case "tool_tip":
          ToolTipScript.AddTip(message);
          break;
        case "objective":
          ObjectivesBehavior.ObjectiveStatus(message);
          break;
        case "phase":
          ObjectivesBehavior.PhaseDone(message);
          break;
        case "lose":
          SendRequest("exit");
          QuitGame();
          break;
        case "remove_computer":
          ComputerBehavior.RemoveComputer(message);
          break;
        default:
          Debug.Log("nothing to do for " + command + " " + message);
          break;
      }

      len = ReceiveMsg();
    }
  }

  public static int ReceiveMsg(bool block = false) {
    if (serverStream == null)
      return 0;
    if (!block & !serverStream.DataAvailable) return 0;

    var lenArray = new byte[4];
    int num_read = serverStream.Read(lenArray, 0, 4);
    //Debug.Log("len of len is " + num_read);
    int len = BitConverter.ToInt32(lenArray, 0);
    //Debug.Log("bitconvert len is " + len);
    var read_buf = new byte[len];
    num_read = serverStream.Read(read_buf, 0, len);
    read_string = Encoding.ASCII.GetString(read_buf);
    //Debug.Log("ReceiveMsg num_read " + num_read + "["+read_string+"]");
    //buf[len] = 0;
    return num_read;
  }

  public void QuitGame() {
    // save any game data here
#if UNITY_EDITOR
    // Application.Quit() does not work in the editor so
    // UnityEditor.EditorApplication.isPlaying need to be set to false to end the game
    EditorApplication.isPlaying = false;
#else
		Application.Quit();
#endif
  }

  public static void SendRequest(string request) {
    if (serverStream == null) {
      Debug.Log("SendRequest, no connection for to send " + request);
      return;
    }

    // get string length
    int reqLen = request.Length;

    // convert string length value to network order
    //int reqLenH2N = IPAddress.HostToNetworkOrder(reqLen);

    // get string length value into a byte array -- for use with
    // Socket.Send
    byte[] reqLenArray = BitConverter.GetBytes(reqLen);

    // send the length value
    //socket.Send(reqLenArray, 4, System.Net.Sockets.SocketFlags.None);
    serverStream.Write(reqLenArray, 0, reqLenArray.Length);


    // copy string to a byte array
    byte[] dataArray = Encoding.ASCII.GetBytes(request);
    serverStream.Write(dataArray, 0, dataArray.Length);
    serverStream.Flush();
    // send the string array
    //socket.Send(dataArray, reqLen,
    //			System.Net.Sockets.SocketFlags.None);
  }

  public static void DialogUp() {
    SendRequest("dialog_up");
  }

  public static void DialogClosed(string message = null) {
    if (message == null)
      SendRequest("dialog_closed");
    else
      SendRequest("dialog_closed:" + message);
  }

  public static void ConnectServer() {
    Debug.Log("IPCManager connect to server");
    /* Connect to the server.  The waiting happens in Update, which handles all receives */
    TcpClient clientSocket = new TcpClient();
    bool done = false;
    // as soon as you figure out how to sleep, fix this!
    while (!done) {
      try {
        clientSocket.Connect("localhost", 27015);
      }
      catch (SocketException ex) {
        Debug.Log("IPCManagerScript connect failed " + ex.Message);
      }

      done = true;
    }

    serverStream = clientSocket.GetStream();
  }
}