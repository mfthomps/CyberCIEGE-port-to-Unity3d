using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class WorkSpaceScript : MonoBehaviour {
  private static readonly List<WorkSpace> ws_list = new List<WorkSpace>();

  // Use this for initialization
  private void Start() {
  }

  public static WorkSpace GetWorkSpace(int pos) {
    if (pos >= ws_list.Count || pos < 0) {
      Debug.Log("Workspace request out of range " + pos);
      return null;
    }

    return ws_list[pos];
  }

  public static void LoadWorkSpace() {
    string fname = OrganizationScript.GetValue("WorkSpaceFile");
    string line;
    string full_path = Path.Combine(GameLoadBehavior.user_app_path, fname);
    Debug.Log("LoadWorkSpace fname is " + full_path);
    try {
      StreamReader reader = new StreamReader(full_path, Encoding.Default);
      using (reader) {
        do {
          line = reader.ReadLine().Trim();
          if (line == "WORKSPACELIST" || line == "end")
            continue;
          //Debug.Log("LoadWorkSpace got " + line);
          string[] parts = line.Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
          int x = 0;
          int y = 0;
          if (!int.TryParse(parts[0], out x)) Debug.Log("Error: LoadWorkspace parse x " + parts[0] + " line " + line);

          if (!int.TryParse(parts[1], out y)) Debug.Log("Error: LoadWorkspace parse y " + parts[1] + " line " + line);

          char dir = parts[2][0];
          char usage = parts[3][0];
          WorkSpace ws = new WorkSpace(x, y, dir, usage);
          ws_list.Add(ws);
        } while (line != "end" && line != null);

        // Use this for initialization
      }

      Debug.Log("LoadWorkSpace got " + ws_list.Count);
    }
    catch (Exception e) {
      Console.WriteLine(e.Message + "\n");
    }

    Debug.Log("LoadWorkSpace got " + ws_list.Count);
  }

  public static bool FindClosestWorkspaceCenter(float xin, float yin, out int xout, out int yout, out int index) {
    int i;
    float distance, temp;
    xout = 0;
    yout = 0;

    index = -1;
    distance = 9999999.9f;
    for (i = 0; i < ws_list.Count; i++) {
      temp = (xin - ws_list[i].x) * (xin - ws_list[i].x)
             + (yin - ws_list[i].y) * (yin - ws_list[i].y);
      if (temp < distance) {
        index = i;
        distance = temp;
        xout = ws_list[i].x;
        yout = ws_list[i].y;
      }
    }

    if (distance < 9999999.9f)
      return true;

    return false; // never found one
  }

  public static bool FindClosestWorkspaceCenter(out int xout, out int yout, out int index) {
    Vector2 gridloc = ccUtils.GetMouseGrid();

    return FindClosestWorkspaceCenter(gridloc.x, gridloc.y, out xout, out yout, out index);
  }

  public class WorkSpace {
    public string[] computer_slots;
    public string[] device_slots;
    public char direction;
    public char usage;
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
          int myindex = ws_list.IndexOf(this);
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
  }
}