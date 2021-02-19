using System;
using System.Collections.Generic;
using UnityEngine;
using Code.Game_Events;
using Code.World_Objects;

namespace Code.User_Interface {
  // Routes all keyboard input to appropriate actions
  public class HotkeyHandler : MonoBehaviour {
    [Header("Output Events")]
    [Tooltip("Move camera to next object of given type")]
    public WorldObjectTypeGameEvent moveCameraToNextObject;

    private Dictionary<KeyCode, Action> _hotkeyActionMap;

    // ------------------------------------------------------------------------
    void Awake() {
      _hotkeyActionMap = new Dictionary<KeyCode, Action> {
        { KeyCode.H, GoHome },
        { KeyCode.U, NextUser },
        { KeyCode.Question, DumpConditions },
        { KeyCode.D, NextDevice },
        { KeyCode.C, NextComputer },
        { KeyCode.Tab, NextViewPoint },
      };
    }

    // ------------------------------------------------------------------------
    void Update() {
      // Go through the hotkeys and see if any got pressed this frame
      foreach (var hotKey in _hotkeyActionMap) {
        if (Input.GetKeyDown(hotKey.Key)) {
          hotKey.Value();
        }
      }
    }

    // ------------------------------------------------------------------------
    private void GoHome() {
      // TODO: Send camera to "home position"?
    }

    // ------------------------------------------------------------------------
    private void NextUser() {
      moveCameraToNextObject?.Raise(WorldObjectType.User);
    }

    // ------------------------------------------------------------------------
    private void DumpConditions() {
      IPCManagerScript.SendRequest("dump_conditions");
    }

    // ------------------------------------------------------------------------
    private void NextDevice() {
      moveCameraToNextObject?.Raise(WorldObjectType.Device);
    }

    // ------------------------------------------------------------------------
    private void NextComputer() {
      moveCameraToNextObject?.Raise(WorldObjectType.Computer);
    }
    
    // ------------------------------------------------------------------------
    private void NextViewPoint() {
      moveCameraToNextObject?.Raise(WorldObjectType.ViewPoint);
    }
  }
}
