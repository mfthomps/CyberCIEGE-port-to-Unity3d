using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using UnityEngine;

namespace Code.MainMenu {
  public class CyberCIEGEParser {
    private static string LOG_EVENT_GAME = "gameEvent";
    private static string LOG_EVENT_GAME_START = "start";
    private static string LOG_EVENT_GAME_END = "end";
    private static string LOG_EVENT_GAME_END_WIN = "win";
    private static string LOG_EVENT_GAME_END_LOSE = "lose";
    private static string LOG_EVENT_TRIGGER = "trigger";
    private static string LOG_EVENT_TRIGGER_NAME = "name";
    private static string LOG_EVENT_TRIGGER_TYPE = "triggerType";
    private static string LOG_EVENT_TRIGGER_SET_PHASE = "SET_PHASE";
    private static string SCENARIO_STATUS_NOT_STARTED = "Not Started";
    private static string SCENARIO_STATUS_WON = "Won";
    private static string SCENARIO_STATUS_LOST = "Lost";
    private static string SCENARIO_STATUS_QUIT = "Quit";

    // --------------------------------------------------------------------------
    public static void ForEachCampaign(string ccInstallPath, Action<string> callback) {
      // Open the campaign catalog file
      var catalogPath = Path.Combine(GetBinDirectory(ccInstallPath), "CampaignCatalog.xml");
      if (File.Exists(catalogPath)) {
        var campaignCatalog = new XmlDocument();
        campaignCatalog.Load(catalogPath);

        // Find all campaigns in the catalog
        var campaignNodes = campaignCatalog.SelectNodes("//campaigncatalog/campaign");
        foreach (XmlNode campaignNode in campaignNodes) {
          callback(campaignNode["name"].InnerText.Trim());
        }
      }
    }

    // --------------------------------------------------------------------------
    public static void ForEachScenario(string ccInstallPath, string campaign, Action<string, string> callback) {
      // Open the selected campaign file
      var campaignPath = Path.Combine(GetCampaignDirectory(ccInstallPath, campaign), "campaign.xml");
      if (File.Exists(campaignPath)) {
        var campaignDocument = new XmlDocument();
        campaignDocument.Load(campaignPath);

        // Find all the scenarios in the campaign
        var campaignNode = campaignDocument.SelectSingleNode("//campaignrelease/campaign");
        var scenarioNodes = campaignNode.SelectNodes("scenario");
        foreach (XmlNode scenarioNode in scenarioNodes) {
          var scenarioName = scenarioNode["name"].InnerText.Trim();
          var scenarioID = scenarioNode["sdf"].InnerText.Trim();
          callback(scenarioName, scenarioID);
        }
      }
    }

    // --------------------------------------------------------------------------
    public static void ForEachSavedGame(string ccInstallPath, string campaign, string scenario, Action<string> callback) {
      var campaignPath = GetCampaignDirectory(ccInstallPath, campaign);
      if (Directory.Exists(campaignPath)) {
        var selectedScenarioID = GetScenarioID(Path.Combine(campaignPath, scenario));
        if (!string.IsNullOrEmpty(selectedScenarioID)) {
          // Make sure selected campaign has a directory for saved games
          var userDir = Path.Combine(campaignPath, System.Environment.UserName);
          if (!Directory.Exists(userDir)) {
            try {
              Directory.CreateDirectory(userDir);
            } catch(Exception e) {
              Debug.LogError($"{e.ToString()}\nCould not create directory: {userDir}");
            }
          }

          // Find every SDF that has the same scenario as our current scenario
          foreach (string file in Directory.GetFiles(userDir, "*.sdf")) {
            var saveFileScenarioID = GetScenarioID(file);
            if (saveFileScenarioID == selectedScenarioID) {
              callback(Path.GetFileNameWithoutExtension(file));
            }
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    public static string GetScenarioID(string scenarioFile) {
      if (File.Exists(scenarioFile)) {
        StreamReader reader = new StreamReader(scenarioFile, Encoding.Default);
        string sdfID = ccUtils.SDTField(reader, "SDFid");
        string scenarioID = sdfID.Split()[0].Trim();
        reader.Close();
        return scenarioID;
      }
      return null;
    }

    // ------------------------------------------------------------------------
    public static string GetScenarioStatus(string ccInstallPath, string campaign, string scenario) {
      var logDirectory = GetLogDirectory(ccInstallPath, campaign);
      var logFiles = Directory.GetFiles(logDirectory, $"{Path.GetFileNameWithoutExtension(scenario)}-*.log");
      var scenarioStatus = SCENARIO_STATUS_NOT_STARTED;
      var phasesReached = new Stack<string>();

      // Go through each log file to determine the farthest the player got in the given scenario
      foreach (var logFile in logFiles) {
        scenarioStatus = GetScenarioStatus(logFile, scenarioStatus, phasesReached);
      }

      // If the player quit or lost, show the farthest phase they reached
      if (scenarioStatus == SCENARIO_STATUS_QUIT || scenarioStatus == SCENARIO_STATUS_LOST) {
        scenarioStatus = $"{scenarioStatus}: {phasesReached.Pop()}";
      }

      return scenarioStatus;
    }

    // --------------------------------------------------------------------------
    public static string GetBinDirectory(string ccInstallPath) {
      return Path.Combine(ccInstallPath, "ccse", "SAT", "bin");
    }

    // --------------------------------------------------------------------------
    public static string GetCampaignDirectory(string ccInstallPath, string campaign) {
      return Path.Combine(ccInstallPath, "game", campaign);
    }

    // --------------------------------------------------------------------------
    public static string GetUserDirectory(string ccInstallPath, string campaign) {
      return Path.Combine(GetCampaignDirectory(ccInstallPath, campaign), System.Environment.UserName);
    }

    // ------------------------------------------------------------------------
    public static string GetSaveFile(string ccInstallPath, string campaign, string savedGame) {
      return Path.Combine(GetUserDirectory(ccInstallPath, campaign), $"{savedGame}.sdf");
    }

    // ------------------------------------------------------------------------
    public static string GetLogDirectory(string ccInstallPath, string campaign) {
      return Path.Combine(GetUserDirectory(ccInstallPath, campaign), "logs");
    }

    // ------------------------------------------------------------------------
    public static string GetLogFile(string ccInstallPath, string campaign, string scenario) {
      return Path.Combine(GetLogDirectory(ccInstallPath, campaign), scenario);
    }

    // ------------------------------------------------------------------------
    public static string GetCyberCIEGELauncher(string ccInstallPath, bool newGame) {
      return Path.Combine(GetBinDirectory(ccInstallPath), $"{(newGame ? "" : "Saved")}CyberCIEGE.bat");
    }

    // ------------------------------------------------------------------------
    public static string GetCyberCIEGEWorkingDirectory(string ccInstallPath) {
      return Path.Combine(ccInstallPath, "ccse");
    }

    // ------------------------------------------------------------------------
    private static string GetScenarioStatus(string logFilepath, string currentStatus, Stack<string> phasesReached) {
      var status = currentStatus;

      // If the player already won, then don't bother processing because that's the farthest they got
      if (currentStatus != SCENARIO_STATUS_WON) {
        var logDocument = new XmlDocument();
        logDocument.Load(logFilepath);

        foreach (XmlNode logEvent in logDocument.SelectSingleNode("//CyberCIEGEeventLog").ChildNodes) {
          // Game event log
          if (logEvent.Name == LOG_EVENT_GAME) {
            // Game started
            if (logEvent.SelectSingleNode(LOG_EVENT_GAME_START) != null) {
              status = SCENARIO_STATUS_QUIT;
            }
            // Game ended
            else if (logEvent.SelectSingleNode(LOG_EVENT_GAME_END) != null) {
              var endNode = logEvent.SelectSingleNode(LOG_EVENT_GAME_END);
              // Win
              if (endNode.InnerText == LOG_EVENT_GAME_END_WIN) {
                status = SCENARIO_STATUS_WON;
              }
              // Lose
              else if (endNode.InnerText == LOG_EVENT_GAME_END_LOSE) {
                status = SCENARIO_STATUS_LOST;
              }
            }
          }
          // Trigger event log
          else if (logEvent.Name == LOG_EVENT_TRIGGER) {
            // Set phase
            if (logEvent.SelectSingleNode(LOG_EVENT_TRIGGER_TYPE).InnerText == LOG_EVENT_TRIGGER_SET_PHASE) {
              // Track latest phase achieved
              var phase = logEvent.SelectSingleNode(LOG_EVENT_TRIGGER_NAME).InnerText;
              if (!phasesReached.Contains(phase)) {
                phasesReached.Push(phase);
              }
            }
          }
        }
      }

      return status;
    }
  }
}
