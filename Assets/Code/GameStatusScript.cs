using System;
using System.IO;
using System.Xml;
using UnityEngine;
using Shared.ScriptableVariables;

public class GameStatusScript : MonoBehaviour {
  [Header("Output Variables")]
  [Tooltip("Whether the game is currently paused or not")]
  public BooleanVariable gamePaused;
  [Tooltip("Current player funds")]
  public IntVariable currentFunds;
  [Tooltip("Current player bonus/hour")]
  public IntVariable currentBonus;
  [Tooltip("Current simulation time")]
  public StringVariable currentTime;
  [Tooltip("Current user message")]
  public StringVariable currentMessage;

  // --------------------------------------------------------------------------
  void OnDestroy() {
    gamePaused.Reset();
    currentFunds.Reset();
    currentBonus.Reset();
    currentTime.Reset();
    currentMessage.Reset();
  }

  // --------------------------------------------------------------------------
  public void UpdateStatus(string message) {
    StringReader reader = new StringReader(message);
    //reader.Read(); // skip BOM ???

    XmlDocument xmlDoc = new XmlDocument();
    xmlDoc.Load(reader);

    // Game paused state
    XmlNode pausedNode = xmlDoc.SelectSingleNode("//status/paused");
    gamePaused.Value = Convert.ToBoolean(pausedNode.InnerText);

    // Game clock time
    XmlNode clockNode = xmlDoc.SelectSingleNode("//status/clock");
    var hour = Convert.ToInt32(clockNode["hour"].InnerText);
    var minute = Convert.ToInt32(clockNode["minute"].InnerText);
    currentTime.Value = String.Format("{0}:{1:00}", hour, minute);

    // Player funding
    XmlNode cashNode = xmlDoc.SelectSingleNode("//status/cash");
    currentFunds.Value = Convert.ToInt32(cashNode.InnerText);

    // Player bonus/hour with penalty
    XmlNode bonusNode = xmlDoc.SelectSingleNode("//status/bonus");
    var bonusString = bonusNode.InnerText;
    XmlNode penaltyNode = xmlDoc.SelectSingleNode("//status/asset_penalty");
    string penaltyString = penaltyNode.InnerText;
    int HOURS_PER_MONTH = 720;
    int bonusval = -1;
    if (!int.TryParse(bonusString, out bonusval)) Debug.Log("Error: UpdatateStatus parse bonus " + bonusString);
    int penaltyval = -1;
    if (!int.TryParse(penaltyString, out penaltyval)) Debug.Log("Error: UpdatateStatus parse penalty " + penaltyString);
    int total = bonusval + penaltyval / HOURS_PER_MONTH;
    currentBonus.Value = total;

    reader.Close();
  }

  // --------------------------------------------------------------------------
  public void UpdateUserMessage(string message) {
    StringReader reader = new StringReader(message);
    //reader.Read(); // skip BOM ???

    XmlDocument xmlDoc = new XmlDocument();
    xmlDoc.Load(reader);

    XmlNode textNode = xmlDoc.SelectSingleNode("//text");
    currentMessage.Value = textNode.InnerText;

    reader.Close();
  }
}