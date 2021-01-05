using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Text;
using System;
using System.Xml;

public class GameStatusScript : MonoBehaviour {
  public static string time_label = "";
  public static string cash_label = "";

  public static string bonus_label = "";

  // Use this for initialization
  static bool game_paused;

  public static bool isPaused() {
    return game_paused;
  }

  public static void UpdateStatus(string message) {
    StringReader reader = new StringReader(message);
    //reader.Read(); // skip BOM ???

    XmlDocument xml_doc = new XmlDocument();
    xml_doc.Load(reader);
    XmlNode paused_node = xml_doc.SelectSingleNode("//status/paused");
    string value = paused_node.InnerText;
    //Debug.Log("UpdateStatus, status is " + value);
    game_paused = Convert.ToBoolean(value);
    XmlNode clock_node = xml_doc.SelectSingleNode("//status/clock");
    string hour = clock_node["hour"].InnerText;
    string minute = clock_node["minute"].InnerText;
    time_label = hour + ":" + minute;
    XmlNode cash_node = xml_doc.SelectSingleNode("//status/cash");
    cash_label = cash_node.InnerText;
    //Debug.Log("UpdateStatus, cash is " + cash_label);
    XmlNode bonus_node = xml_doc.SelectSingleNode("//status/bonus");
    string bonus = bonus_node.InnerText;
    //Debug.Log("UpdateStatus, bonus is " + bonus);
    XmlNode penalty_node = xml_doc.SelectSingleNode("//status/asset_penalty");
    string penalty = penalty_node.InnerText;
    int HOURS_PER_MONTH = 720;
    int bonusval = -1;
    if (!int.TryParse(bonus, out bonusval)) {
      Debug.Log("Error: UpdatateStatus parse bonus " + bonus);
    }

    int penaltyval = -1;
    if (!int.TryParse(penalty, out penaltyval)) {
      Debug.Log("Error: UpdatateStatus parse penalty " + bonus);
    }

    int total = (int) bonusval + (penaltyval / HOURS_PER_MONTH);
    //totalBonus += Enterprise.assetPenalty / (HOURS_PER_MONTH); // mft g.190
    bonus_label = "bonus: " + total;
  }

  void Start() {
  }
}