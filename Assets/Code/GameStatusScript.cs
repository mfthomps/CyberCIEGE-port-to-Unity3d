using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.MainMenu;

public class GameStatusScript : MonoBehaviour {
  [Header("Input Variables")]
  [Tooltip("Path to the CyberCIEGE Install folder")]
  public StringVariable ccInstallPath;
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
  [Tooltip("List of staff in the given scenario")]
  public IntVariable techCapacityVariable;
  [Tooltip("List of staff in the given scenario")]
  public IntVariable securityCapacityVariable;

  // --------------------------------------------------------------------------
  void OnDestroy() {
    gamePaused.Reset();
    currentFunds.Reset();
    currentBonus.Reset();
    currentDate.Reset();
    currentTime.Reset();
    currentMessage.Reset();
    techCapacityVariable.Reset();
    securityCapacityVariable.Reset();
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
      CyberCIEGEParser.ForEachScenario(ccInstallPath.Value, currentCampaign.Value, (scenario) => {
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
    // Special case treatment of hour for AM/PM
    if (hour == 12) {
      hour = isAM ? 0 : 12;
    }
    // PM hours should be values 13-23
    else if (!isAM) {
      hour += 12;
    }
    var dateTime = new DateTime(1, month, day, hour, minute, 0);
    currentDate.Value = dateTime.ToString("MMMM dd");
    currentTime.Value = dateTime.ToString("hh:mm tt");

    // Player funding
    var cashNode = xmlDoc.SelectSingleNode("//status/cash");
    currentFunds.Value = Convert.ToInt32(cashNode.InnerText);

    // Player bonus/hour with penalty
    var bonusNode = xmlDoc.SelectSingleNode("//status/bonus");
    var bonusString = bonusNode.InnerText;
    var penaltyNode = xmlDoc.SelectSingleNode("//status/asset_penalty");
    var penaltyString = penaltyNode.InnerText;
    int HOURS_PER_MONTH = 720;
    var bonusval = -1;
    if (!int.TryParse(bonusString, out bonusval)) Debug.Log("Error: UpdatateStatus parse bonus " + bonusString);
    var penaltyval = -1;
    if (!int.TryParse(penaltyString, out penaltyval)) Debug.Log("Error: UpdatateStatus parse penalty " + penaltyString);
    var total = bonusval + penaltyval / HOURS_PER_MONTH;
    currentBonus.Value = total;

    // Tech staff capacity
    var techStaffCapacity = 0;
    var techStaffNode = xmlDoc.SelectSingleNode("//status/itstaff");
    if (techStaffNode != null) {
      var techStaffString = techStaffNode.InnerText;
      if (!int.TryParse(techStaffString, out techStaffCapacity)) Debug.Log("Error: UpdatateStatus parse tech staff capacity " + techStaffString);
    }
    techCapacityVariable.Value = techStaffCapacity;

    // Security staff capacity
    var securityStaffCapacity = 0;
    var securityStaffNode = xmlDoc.SelectSingleNode("//status/securityStaff");
    if (securityStaffNode != null) {
      var securityStaffString = securityStaffNode.InnerText;
      if (!int.TryParse(securityStaffString, out securityStaffCapacity)) Debug.Log("Error: UpdatateStatus parse security staff capacity " + securityStaffString);
    }
    securityCapacityVariable.Value = securityStaffCapacity;

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