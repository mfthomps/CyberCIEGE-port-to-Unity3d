using System;
using System.Net.Sockets;
using System.Text;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Factories;
using Code.Scriptable_Variables;
using Code.User_Interface.View;

public class IPCManagerScript : MonoBehaviour {
  [SerializeField] private StringListVariable attackLogVariable;
  [SerializeField] private GameLoadBehavior _gameLoadBehavior;
  [SerializeField] private DeviceFactory _deviceFactory;
  [SerializeField] private ComputerFactory _computerFactory;

  [Header("Output Events")]
  [Tooltip("Event to fire when game status changes")]
  public StringGameEvent gameStatusChanged;
  [Tooltip("Event to fire when a component status changes")]
  public StringGameEvent componentStatusChanged;
  [Tooltip("Event to fire when a computer status changes")]
  public StringGameEvent computerStatusChanged;
  [Tooltip("Event to fire when user message changes")]
  public StringGameEvent userStatusChanged;
  [Tooltip("Event to fire when a zone status changes")]
  public StringGameEvent zoneStatusChanged;
  [Tooltip("Event to fire when current user message changes")]
  public StringGameEvent currentMessageChanged;
  [Tooltip("Event to fire when help tip message changes")]
  public StringGameEvent helpTipMessageChanged;
  [Tooltip("Event to fire when a phase is completed")]
  public StringGameEvent phaseCompleted;
  [Tooltip("Event to fire when an objective is updated")]
  public StringGameEvent objectiveUpdated;
  [Tooltip("Event to fire when the server wants to show a message to the user")]
  public StringGameEvent showMessage;
  [Tooltip("Event to fire when the server is requesting a yes/no answer")]
  public StringGameEvent requestConfirmation;
  [Tooltip("Show the debrief dialog and end the scenario")]
  public StringGameEvent showDebrief;
  [Tooltip("Event to fire when the server wants to move the camera to a user")]
  public StringGameEvent moveCameraToUser;
  [Tooltip("Quit scenario")]
  public GameEvent quit;

  private static NetworkStream _serverStream;

  // Use this for initialization
  private static string _readString;

  private bool _serverReady; /* ignore server messages until we receive the ready message */
  private float _elapsedSinceReceive;

  // --------------------------------------------------------------------------
  void Start() {
    ConnectServer();
  }

  // --------------------------------------------------------------------------
  void OnDestroy() {
    attackLogVariable.Clear();
  }

  // --------------------------------------------------------------------------
  private void Update() {
    float delta = Time.deltaTime;
    _elapsedSinceReceive += delta;
    if (_elapsedSinceReceive > 0.1f)
      _elapsedSinceReceive = 0.0f;
    else
      return;

    //Debug.Log("call receive");
    int len = ReceiveMsg();
    while (len > 0) {
      if (!_serverReady) {
        if (_readString == "ready") {
          Debug.Log("IPCManager got server ready");
          _serverReady = true;
          _gameLoadBehavior.AfterServerReady();
          SendRequest("begin");
          SendRequest($"on_screen:{(int)ViewType.Office}");
        }

        return;
      }

      string command = _readString;
      string message = null;
      //Debug.Log("buf [" + _readString + "]");
      if (_readString.IndexOf(':') > 0) message = ccUtils.GetCommand(_readString, out command);

      //Debug.Log("IPC update got command " + command + " message [" + message+"]");
      switch (command) {
        case "status":
          //Debug.Log("got status %s" + message);
          gameStatusChanged?.Raise(message);
          break;
        case "component_status":
          componentStatusChanged?.Raise(message);
          break;
        case "computer_status":
          computerStatusChanged?.Raise(message);
          break;
        case "user_status":
          userStatusChanged?.Raise(message);
          break;
        case "zone_status":
          zoneStatusChanged?.Raise(message);
          break;
        case "attack_log":
          attackLogVariable.Add(message);
          break;
        case "load_computer":
          _computerFactory.Create(message + ".sdf");
          break;
        case "load_device":
          _deviceFactory.Create(message + ".sdf");
          break;
        case "ticker":
          currentMessageChanged?.Raise(message);
          break;
        case "withdraw_ticker":
          currentMessageChanged?.Raise(null);
          break;
        case "message":
          showMessage?.Raise(message);
          break;
        case "yes_no":
          requestConfirmation?.Raise(message);
          break;
        case "tool_tip":
          helpTipMessageChanged?.Raise(message);
          break;
        case "phase_done":
          phaseCompleted?.Raise(message);
          break;
        case "objective":
          objectiveUpdated?.Raise(message);
          break;
        case "win":
        case "lose":
          showDebrief?.Raise(message);
          break;
        case "remove_computer":
          _computerFactory.Remove(itemName: message);
          break;
        case "cameraToUser":
          moveCameraToUser?.Raise(message);
          break;
        default:
          Debug.Log("nothing to do for " + command + " " + message);
          break;
      }

      len = ReceiveMsg();
    }
  }

  // --------------------------------------------------------------------------
  public static int ReceiveMsg(bool block = false) {
    if (_serverStream == null)
      return 0;
    if (!block & !_serverStream.DataAvailable) return 0;

    var lenArray = new byte[4];
    int num_read = _serverStream.Read(lenArray, 0, 4);
    //Debug.Log("len of len is " + num_read);
    int len = BitConverter.ToInt32(lenArray, 0);
    //Debug.Log("bitconvert len is " + len);
    var read_buf = new byte[len];
    num_read = _serverStream.Read(read_buf, 0, len);
    _readString = Encoding.ASCII.GetString(read_buf);
    //Debug.Log("ReceiveMsg num_read " + num_read + "["+_readString+"]");
    //buf[len] = 0;
    return num_read;
  }

  // --------------------------------------------------------------------------
  public void ToggleGamePaused(bool paused) {
    SendRequest(paused ? "Pause" : "Play");
  }

  // --------------------------------------------------------------------------
  public void DialogUp(bool sendServerMessage) {
    if (sendServerMessage) {
      SendRequest("dialog_up");
    }
  }

  // --------------------------------------------------------------------------
  public void DialogClosed(string message) {
    SendRequest($"dialog_closed{(!string.IsNullOrEmpty(message) ? $":{message}" : "")}");
  }

  // --------------------------------------------------------------------------
  public static void SendRequest(string request) {
    if (_serverStream == null) {
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
    _serverStream.Write(reqLenArray, 0, reqLenArray.Length);


    // copy string to a byte array
    byte[] dataArray = Encoding.ASCII.GetBytes(request);
    _serverStream.Write(dataArray, 0, dataArray.Length);
    _serverStream.Flush();
    // send the string array
    //socket.Send(dataArray, reqLen,
    //			System.Net.Sockets.SocketFlags.None);
  }

  // --------------------------------------------------------------------------
  private void ConnectServer() {
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

    // Clear out our server stream if we had a previous one
    if (_serverStream != null) {
      _serverStream.Dispose();
    }
    _serverStream = clientSocket.GetStream();
  }
}
