using System;

[Serializable]
public class WorkSpace {
  
  [Serializable]
  public enum WorkSpaceType {
    Inactive,
    Active,
    Server
  }
  
  public enum WorkSpaceDirection {
    North,
    East,
    South,
    West
  }
  
  public string[] computer_slots;
  public string[] device_slots;
  public char direction;
  public char usage; //I = inactive, A = Active, S = Server
  public string user;
  public int x;
  public int y;

  public WorkSpace(int x, int y, char direction, char usage) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.usage = usage;
    int num_computers = 1;
    int num_devices = 2;
    if (usage == 'S') num_computers = 6;

    //this.computer_slots = (int[])Enumerable.Repeat(-1, num_computers);
    //this.device_slots = (int[])Enumerable.Repeat(-1, num_devices);
    computer_slots = new string[num_computers];
    device_slots = new string[num_devices];
  }

  public int AddComputer(string computer_name) {
    int retval = -1;
    int i = 0;
    while (retval < 0 && i < computer_slots.Length)
      if (computer_slots[i] == null) {
        retval = i;
        computer_slots[i] = computer_name;
        // int myindex = ws_list.IndexOf(this);
        //Debug.Log("WorkSpace "+myindex+" AddComputer " + computer_name + " slot " + i + " of " + computer_slots.Length);
      }

    i++;
    return retval;
  }

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

  public bool ComputerRoom() {
    bool retval = false;
    int i = 0;
    while (!retval && i < computer_slots.Length) {
      if (computer_slots[i] == null) {
        //Debug.Log("slot empty " + i);
        retval = true;
      }

      i++;
    }

    return retval;
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
  public WorkSpaceType GetUsageType() {
    switch (usage) {
      case 'I' : return WorkSpaceType.Inactive;
      case 'A' : return WorkSpaceType.Active;
      case 'S' : return WorkSpaceType.Server;
      default: return WorkSpaceType.Inactive;
    }
  }
  //---------------------------------------------------------------------------
  public WorkSpaceDirection GetDirection() {
    switch (direction) {
      case 'N' : return WorkSpaceDirection.North;
      case 'E' : return WorkSpaceDirection.East;
      case 'S' : return WorkSpaceDirection.South;
      case 'W' : return WorkSpaceDirection.West;
      default: return WorkSpaceDirection.North;
    }
  }
}