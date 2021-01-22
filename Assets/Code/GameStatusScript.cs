using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.MainMenu;

public class GameStatusScript : MonoBehaviour {
  [Header("Output Variables")]
  [Tooltip("Whether the game is currently paused or not")]
  public BooleanVariable gamePaused;
  [Tooltip("Current campaign being played")]
  public StringVariable currentCampaign;
  [Tooltip("Current scenario being played")]
  public StringVariable currentScenario;
  [Tooltip("Current player funds")]
  public IntVariable currentFunds;
  [Tooltip("Current player bonus/hour")]
  public IntVariable currentBonus;
  [Tooltip("Current simulation date")]
  public StringVariable currentDate;
  [Tooltip("Current simulation time")]
  public StringVariable currentTime;
  [Tooltip("Current user message")]
  public StringVariable currentMessage;

  // --------------------------------------------------------------------------
  void OnDestroy() {
    gamePaused.Reset();
    currentFunds.Reset();
    currentBonus.Reset();
    currentDate.Reset();
    currentTime.Reset();
    currentMessage.Reset();
  }

  // --------------------------------------------------------------------------
  public void UpdateStatus(string message) {
    StringReader reader = new StringReader(message);
    //reader.Read(); // skip BOM ???

    // Debug.Log($"Game status update:\n{message}");

    var xmlDoc = new XmlDocument();
    xmlDoc.Load(reader);

    // Current campaign/scenario (given to us as the path to the scenario SDF file "../CAMPAIGN/SCENARIO_ID")
    var scenarioNode = xmlDoc.SelectSingleNode("//status/scenario").InnerText;
    // Strip out the campaign and scenario ID parts of the string
    var matches = Regex.Matches(scenarioNode, @"(?:...)*\\(...*)\\(...*)");
    if (matches.Count > 0) {
      var match = matches[0];
      currentCampaign.Value = match.Groups[1].Value;
      var scenarioID = match.Groups[2].Value;
      // Unfortunately, the only way to get a scenario name from the scenario ID is to use the CyberCIEGEParser,
      // which requires the main game to know what the CyberCIEGE Install path is.  I'm not sure if the GameLoadBehavior
      // class is the best place for it, but we can't use a scriptable variable since those reset themselves when
      // on scene changes, so we won't still have it in there from the Main Menu
      CyberCIEGEParser.ForEachScenario(GameLoadBehavior.ccInstallPath, currentCampaign.Value, (scenario) => {
        if (scenario.id.ToLower() == scenarioID.ToLower()) {
          currentScenario.Value = scenario.name;
        }
      });
    }

    // Game paused state
    var pausedNode = xmlDoc.SelectSingleNode("//status/paused");
    gamePaused.Value = Convert.ToBoolean(pausedNode.InnerText);

    // Game clock time
    var clockNode = xmlDoc.SelectSingleNode("//status/clock");
    var month = Convert.ToInt32(clockNode["month"].InnerText);
    var day = Convert.ToInt32(clockNode["day"].InnerText);
    var hour = Convert.ToInt32(clockNode["hour"].InnerText);
    var minute = Convert.ToInt32(clockNode["minute"].InnerText);
    var isAM = Convert.ToBoolean(clockNode["AM"].InnerText);
    var dateTime = new DateTime(1, month, day, isAM ? hour : hour + 12, minute, 0);
    currentDate.Value = dateTime.ToString("MMMM dd");
    currentTime.Value = dateTime.ToString("hh:mm tt");

    // Player funding
    var cashNode = xmlDoc.SelectSingleNode("//status/cash");
    currentFunds.Value = Convert.ToInt32(cashNode.InnerText);

    // Player bonus/hour with penalty
    var bonusNode = xmlDoc.SelectSingleNode("//status/bonus");
    var bonusString = bonusNode.InnerText;
    var penaltyNode = xmlDoc.SelectSingleNode("//status/asset_penalty");
    string penaltyString = penaltyNode.InnerText;
    int HOURS_PER_MONTH = 720;
    var bonusval = -1;
    if (!int.TryParse(bonusString, out bonusval)) Debug.Log("Error: UpdatateStatus parse bonus " + bonusString);
    var penaltyval = -1;
    if (!int.TryParse(penaltyString, out penaltyval)) Debug.Log("Error: UpdatateStatus parse penalty " + penaltyString);
    var total = bonusval + penaltyval / HOURS_PER_MONTH;
    currentBonus.Value = total;

    reader.Close();
  }

  // --------------------------------------------------------------------------
  public void UpdateUserMessage(string message) {
    if (!string.IsNullOrEmpty(message)) {
      StringReader reader = new StringReader(message);
      //reader.Read(); // skip BOM ???

      XmlDocument xmlDoc = new XmlDocument();
      xmlDoc.Load(reader);

      XmlNode textNode = xmlDoc.SelectSingleNode("//text");
      currentMessage.Value = textNode.InnerText;

      reader.Close();
    }
    else {
      currentMessage.Value = message;
    }
  }
}