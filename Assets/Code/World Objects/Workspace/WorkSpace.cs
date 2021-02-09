using System;
using UnityEngine;
using Code.World_Objects.Computer;

namespace Code.World_Objects.Workspace {
  [Serializable]
  public class WorkSpace {
  
    [Serializable]
    public enum WorkSpaceType {
      Regular,
      Server, 
      Inactive
    }

    [Tooltip("The list of Computers that have been added to this WorkSpace")]
    [SerializeField] private ComputerBehavior[] _computerSlots;
    public string[] device_slots;
    public char direction;
    public char usage; //I = inactive, A = Active, S = Server
    public string user;
    public int x;
    public int y;

    //-------------------------------------------------------------------------
    public WorkSpace(int x, int y, char direction, char usage) {
      this.x = x;
      this.y = y;
      this.direction = direction;
      this.usage = usage;
      int num_computers = 1;
      int num_devices = 2;
      if (usage == 'S') {
        num_computers = 6;
      }

      _computerSlots = new ComputerBehavior[num_computers];
      device_slots = new string[num_devices];
    }

    //-------------------------------------------------------------------------
    //Add a computer to this WorkSpace if there is room. 
    //@return the WorkSpace computer slot index (-1 if not added)
    public int AddComputer(ComputerBehavior computer) {
      for (int i = 0; i < _computerSlots.Length; i++){
        if (!_computerSlots[i]) {
          _computerSlots[i] = computer;
          return i;
        }
      }
      return -1;
    }
    
    //-------------------------------------------------------------------------
    //Remove a computer from this WorkSpace. 
    //@return true if removed, false otherwise.
    public bool RemoveComputer(ComputerBehavior computer) {
      for (int i = 0; i < _computerSlots.Length; i++){
        if (_computerSlots[i] == computer) {
          _computerSlots[i] = null;
          return true;
        }
      }
      return false;
    }
    
    //-------------------------------------------------------------------------
    public int AddDevice(string device_name) {
      int retval = -1;
      int i = 0;
      while (retval < 0 && i < device_slots.Length) {
        if (device_slots[i] == null) {
          retval = i;
          device_slots[i] = device_name;
        }

        i++;
      }

      return retval;
    }

    //-------------------------------------------------------------------------
    //Is there currently any empty slots for computers?
    public bool HaveRoomForComputer() {
      for (int i = 0; i < _computerSlots.Length; i++) {
        if (_computerSlots[i] == null) {
          return true;
        }
      }

      return false;
    }

    public bool DeviceRoom() {
      bool retval = false;
      int i = 0;
      while (!retval && i < device_slots.Length) {
        if (device_slots[i] == null) retval = true;

        i++;
      }

      return retval;
    }

    public bool AddUser(string user_name) {
      bool retval = true;
      if (user == null)
        user = user_name;
      else
        retval = false;

      return retval;
    }

    public void ClearUser() {
      user = null;
    }

  
    //---------------------------------------------------------------------------
    public Direction GetDirection() {
      switch (direction) {
        case 'N' : return Direction.North;
        case 'E' : return Direction.East;
        case 'S' : return Direction.South;
        case 'W' : return Direction.West;
        default: return Direction.North;
      }
    }

    //---------------------------------------------------------------------------
    public WorkSpaceType GetWorkSpaceType() {
      switch (usage) {
        case 'A' : return WorkSpaceType.Regular;
        case 'I' : return WorkSpaceType.Inactive;
        case 'S' : return WorkSpaceType.Server;
        default: return WorkSpaceType.Inactive;
      }
    }
  }
}