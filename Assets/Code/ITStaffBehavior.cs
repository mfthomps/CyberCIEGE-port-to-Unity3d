using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml.Linq;
using UnityEngine;

public class ITStaffBehavior : MonoBehaviour {
  private static Dictionary<string, ITStaffBehavior> staff_dict = new Dictionary<string, ITStaffBehavior>();
  private static readonly string STAFF = "staff";
  private static Rect WindowRect = new Rect(10, 10, 250, 300);
  public static Texture2D background, LOGO;
  public string user_name;
  public int position = -1;
  public string department;
  public string current_thought = "";
  public int skill;
  public int hw_skill;
  public int hi_skill;
  public int sw_skill;
  public int cost;
  public int salary;

  private string filePath;
  
  public static void doItems() {
    WindowRect = GUI.Window(1, WindowRect, HireMenu, "Hire IT/Security");
  }

  private static void HireMenu(int id) {
    foreach (string key in staff_dict.Keys)
      if (GUILayout.Button(key)) {
        ITStaffBehavior script = staff_dict[key];
        // TBD fix cost / salary to match game
        XElement xml = new XElement("userEvent",
          new XElement("hire",
            new XElement("name", script.user_name),
            new XElement("salary", script.cost)),
          new XElement("cost", script.cost));

        Debug.Log(xml);
        IPCManagerScript.SendRequest(xml.ToString());
        menus.clicked = "";
      }

    //Debug.Log("HireMenu clicked now " + menus.clicked);
  }

  private static void LoadOneStaff(string user_file) {
    GameObject user = GameObject.Find("ITStaff");
    if (user == null) {
      Debug.LogError("Error: LoadOneStaff got null when finding ITStaff game object.");
      return;
    }

    //Debug.Log("user_app_path" + user_app_path + " file [" + User_file+"]");
    string cfile = Path.Combine(GameLoadBehavior.user_app_path, user_file);
    Debug.Log("user " + cfile);
    GameObject new_c = Instantiate(user, new Vector3(1.0F, 0, 0), Quaternion.identity);
    ITStaffBehavior script = (ITStaffBehavior) new_c.GetComponent(typeof(ITStaffBehavior));
    script.SetFilePath(cfile);
    new_c.SetActive(true);
    script.LoadStaff();
    int pos = script.position;
    //Debug.Log("LoadUsers " + script.User_name + " pos is " + pos);
    if (pos < 0) {
      Debug.Log("LoadOneStaff got invalid pos for " + script.user_name);
      return;
    }

    if (pos >= 0) {
      WorkSpaceScript.WorkSpace ws = WorkSpaceScript.GetWorkSpace(pos);
      if (ws == null) {
        Debug.Log("ITStaffBehavior got null workspace for pos" + pos);
        return;
      }

      if (!ws.AddUser(script.user_name)) {
        Debug.Log("ITStaffBehavior AddUser, could not user, already populated " + script.user_name);
        return;
      }

      float xf, zf;
      ccUtils.GridTo3dPos(ws.x, ws.y, out xf, out zf);
      //Debug.Log(ws.x + " " + ws.y + " " + xf + " " + zf);
      Vector3 v = new Vector3(xf - 1.0f, 0.5f, zf);
      new_c.transform.position = v;
    }
    else {
      Debug.Log("no postion for " + script.user_name);
    }
  }

  public static void LoadStaffFromFile() {
    string user_dir = Path.Combine(GameLoadBehavior.user_app_path, STAFF);
    string[] clist = Directory.GetFiles(user_dir);
    foreach (string user_file in clist)
      if (user_file.EndsWith(".sdf"))
        LoadOneStaff(user_file);
  }

  private void LoadStaff() {
    try {
      StreamReader reader = new StreamReader(filePath, Encoding.Default);
      using (reader) {
        string tag;
        //Debug.Log("LoadUser read from " + filePath);
        ccUtils.PositionAfter(reader, "User");
        string value;
        do {
          value = ccUtils.SDTNext(reader, out tag);
          if (value == null)
            continue;
          //Debug.Log("LoadUser got " + value + " for tag " + tag);
          switch (tag) {
            case "Name":
              user_name = value;
              //Debug.Log("LoadComponent adding to dict: " + this.user_name);
              staff_dict.Add(user_name, this);
              break;
            case "PosIndex":
              if (!int.TryParse(value, out position)) Debug.Log("Error: LoadStaff parsing position" + value);

              break;
            case "Dept":
              department = value;
              break;
            case "Cost":
              if (!int.TryParse(value, out cost)) Debug.Log("Error: LoadStaff parsing cost" + value);

              break;
            case "Skill":
              if (!int.TryParse(value, out skill)) Debug.Log("Error: LoadStaff parsing skill" + value);

              break;
            case "HISupportSkill":
              if (!int.TryParse(value, out hi_skill)) Debug.Log("Error: LoadStaff parsing hi_skill" + value);

              break;
            case "HWSupportSkill":
              if (!int.TryParse(value, out hw_skill)) Debug.Log("Error: LoadStaff parsing hw_skill" + value);

              break;
          }
        } while (value != null);
      }
    }
    catch (Exception e) {
      Console.WriteLine(e.Message + "\n");
    }
  }

  public void SetFilePath(string path) {
    filePath = path;
  }
}