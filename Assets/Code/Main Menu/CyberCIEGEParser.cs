using System;
using System.IO;
using System.Text;
using System.Xml;
using UnityEngine;

namespace Code.MainMenu {
  public class CyberCIEGEParser {
    // --------------------------------------------------------------------------
    public static void ForEachCampaign(string ccInstallPath, Action<string> callback) {
      // Open the campaign catalog file
      var catalogPath = Path.Combine(ccInstallPath, "ccse/SAT/bin/CampaignCatalog.xml");
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
      var campaignPath = Path.Combine(ccInstallPath, "game", campaign, "campaign.xml");
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
      var campaignPath = Path.Combine(ccInstallPath, "game", campaign);
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
  }
}
