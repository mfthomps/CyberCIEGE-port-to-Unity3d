using System.IO;
using System.Xml;
using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.Software;
using Code.User_Interface.Components;
using Code.User_Interface.Dialog;
using Code.World_Objects.Asset;

namespace Code.World_Objects.Computer {
  //Handles some functionality for ComputerBehaviors
  public class ComputerManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object")]
    public GameObjectVariable selectedObject;
    [Tooltip("Clearances in the current scenario")]
    public ClearanceListVariable clearances;
    [Tooltip("Computers in the current scenario")]
    public ComputerListVariable computers;
    [Tooltip("Users in the current scenario")]
    public UserListVariable users;
    [Header("Output Events")]
    [Tooltip("Event to open confirmation diallog")]
    public ConfirmationRequestGameEvent getConfirmation;

    private static int REIMAGE_COST = 500;
    private static int REPLACE_DRIVE_COST = 1000;

    //---------------------------------------------------------------------------
    public void UpdateStatus(string message) {
      StringReader xmlreader = new StringReader(message);
      //xmlreader.Read(); // skip BOM ???

      XmlDocument xml_doc = new XmlDocument();

      xml_doc.Load(xmlreader);
      XmlNodeList computerNodes = xml_doc.SelectNodes("//computer_status/computer");
      foreach (XmlNode computerNode in computerNodes) {
        var computerName = computerNode["name"].InnerText;
        foreach (var computer in computers.Value) {
          if (computer.Data.component_name == computerName) {
            UpdateStatus(computer, computerNode);
          }
        }
      }
    }

    //--------------------------------------------------------------------------
    public void OnScrapComputer(ComputerBehavior computer) {
      // Notify the game server this computer should be removed
      SendComputerActionEvent(computer, "sell");
    }

    //--------------------------------------------------------------------------
    public void OnScanComputer(ComputerBehavior computer) {
      // Notify the game server this computer should be scanned
      SendComputerActionEvent(computer, "scan");
    }

    //--------------------------------------------------------------------------
    public void OnDiagnoseComputer(ComputerBehavior computer) {
      // Notify the game server this computer should be diagnosed
      SendComputerActionEvent(computer, "diagnose");
    }

    //--------------------------------------------------------------------------
    public void OnReimageComputer(ComputerBehavior computer) {
      // Get user confirmation before performing this action
      getConfirmation?.Raise(new ConfirmationRequest($"Re-installing a system image will elimiate newly introduced malware, but will cost you {REIMAGE_COST:C0}", "Reimage system", "Cancel",
        (bool accepted) => {
          if (accepted) {
            // Notify the game server this computer should be reimaged
            SendComputerActionEvent(computer, "reimage");
            SendCostEvent(REIMAGE_COST);
          }
        })
      );
    }

    //--------------------------------------------------------------------------
    public void OnReplaceComputerDrive(ComputerBehavior computer) {
      // Get user confirmation before performing this action
      getConfirmation?.Raise(new ConfirmationRequest($"Replacing & reloading the hard drive will elimiate newly introduced malware, but will cost you {REPLACE_DRIVE_COST:C0}", "Replace drive", "Cancel",
        (bool accepted) => {
          if (accepted) {
            // Notify the game server this computer should have its drive replaced
            SendComputerActionEvent(computer, "replace_drive");
            SendCostEvent(1000);
          }
        })
      );
    }

    // ------------------------------------------------------------------------
    public void AssignAsset(AssetBehavior asset) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        // If this asset had a previously assigned computer, remove it from the computer's asset list
        if (asset.Data.Computer != null) {
          asset.Data.Computer.RemoveAsset(asset);
          SendAssetMoveEvent(asset, asset.Data.Computer, false);
        }

        asset.SetComputer(computerBehavior);
        computerBehavior.AddAsset(asset);
        SendAssetMoveEvent(asset, computerBehavior, true);
      }
    }

    // ------------------------------------------------------------------------
    public void UnassignAsset(AssetBehavior asset) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        // Make sure the asset in question was actually assigned to the selected computer
        if (asset.Data.Computer == computerBehavior) {
          computerBehavior.RemoveAsset(asset);
          asset.SetComputer(null);
          SendAssetMoveEvent(asset, computerBehavior, false);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void AddSoftware(SoftwareBehavior software) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.AddSoftware(software);
        SendSoftwareChangeEvent(software, computerBehavior, true);
      }
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(SoftwareBehavior software) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.RemoveSoftware(software);
        SendSoftwareChangeEvent(software, computerBehavior, false);
      }
    }

    // ------------------------------------------------------------------------
    public void ClearAccess(ComputerNetworkAccessChange changeEvent) {
      if (changeEvent.computer != null) {
        changeEvent.computer.ClearAccess(changeEvent.network, changeEvent.accessToChange.accessor);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleReadAccess(ComputerNetworkAccessChange changeEvent) {
      if (changeEvent.computer != null) {
        changeEvent.computer.ToggleReadAccess(changeEvent.network, changeEvent.accessToChange.accessor);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleWriteAccess(ComputerNetworkAccessChange changeEvent) {
      if (changeEvent.computer != null) {
        changeEvent.computer.ToggleWriteAccess(changeEvent.network, changeEvent.accessToChange.accessor);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleControlAccess(ComputerNetworkAccessChange changeEvent) {
      if (changeEvent.computer != null) {
        changeEvent.computer.ToggleControlAccess(changeEvent.network, changeEvent.accessToChange.accessor);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleExecuteAccess(ComputerNetworkAccessChange changeEvent) {
      if (changeEvent.computer != null) {
        changeEvent.computer.ToggleExecuteAccess(changeEvent.network, changeEvent.accessToChange.accessor);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleLocalAccount(string accountName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.ToggleLocalAccount(accountName);
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleAuthenticatedServer(string serverName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        // If the computer didn't have an authenticating server and is about to, confirm that the user knows the local
        // accounts are all going to get wiped out
        if (string.IsNullOrEmpty(computerBehavior.GetAuthenticatingServer()) && string.IsNullOrEmpty(serverName)) {
          getConfirmation?.Raise(new ConfirmationRequest($"Re-installing a system image will elimiate newly introduced malware, but will cost you {REIMAGE_COST:C0}", "Reimage system", "Cancel",
            (bool accepted) => {
              if (accepted) {
                computerBehavior.ToggleAuthenticatingServer(serverName);
              }
            }
          ));
        }
        // Otherwise, we're switching authentication servers or going back to using local accounts, so we can just change it
        else {
          computerBehavior.ToggleAuthenticatingServer(serverName);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void ToggleProfile(string profile) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.ToggleProfile(profile);
      }
    }

    // ------------------------------------------------------------------------
    public void OnLocalAccountAdded(string accountName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        SendAccessEvent(computerBehavior, "accountAdd", GetAccountType(accountName), accountName);
      }
    }

    // ------------------------------------------------------------------------
    public void OnLocalAccountRemoved(string accountName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        SendAccessEvent(computerBehavior, "accountRemove", GetAccountType(accountName), accountName);
      }
    }

    // ------------------------------------------------------------------------
    public void OnAuthenticatingServerAdded(string serverName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        SendAuthenticatedServerEvent(computerBehavior, "authServerAdd", serverName);
      }
    }

    // ------------------------------------------------------------------------
    public void OnAuthenticatingServerRemoved(string serverName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        SendAuthenticatedServerEvent(computerBehavior, "authServerRemove", serverName);
      }
    }

    // ------------------------------------------------------------------------
    public void OnProfileAdded(string accountName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        SendAccessEvent(computerBehavior, "profileAdd", GetAccountType(accountName), accountName);
      }
    }

    // ------------------------------------------------------------------------
    public void OnProfileRemoved(string accountName) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        SendAccessEvent(computerBehavior, "profileRemove", GetAccountType(accountName), accountName);
      }
    }

    // ------------------------------------------------------------------------
    private ComputerBehavior GetSelectedComputer() {
      if (selectedObject.Value != null) {
        return selectedObject.Value.GetComponent<ComputerBehavior>();
      }
      return null;
    }

    //--------------------------------------------------------------------------
    private string GetAccountType(string account) {
      // Check if this is a user
      foreach (var user in users.Value) {
        if (user.Data.user_name == account) {
          return "user";
        }
      }

      // Check if this is a clearance
      foreach (var clearance in clearances.Value) {
        if (clearance.Data.name == account) {
          return "clearance";
        }
      }

      return "group";
    }

    //---------------------------------------------------------------------------
    private void UpdateStatus(ComputerBehavior computer, XmlNode computerNode) {
      computer.Data.zone = computerNode["zone"].InnerText;

      var utilizationStr = computerNode["utilization"].InnerText;
      if (int.TryParse(utilizationStr, out int utilization)) {
        computer.UpdateUtilization(utilization);
      }

      var availabilityStr = computerNode["availability"].InnerText;
      if (int.TryParse(availabilityStr, out int availability)) {
        computer.UpdateAvailability(availability);
      }

      computer.ClearAssetUsage();
      var usedByNode = computerNode.SelectSingleNode("usedBy");
      if (usedByNode != null) {
        var username = usedByNode["name"].InnerText;
        var goalNodes = usedByNode.SelectNodes("goal");
        var usageNodes = usedByNode.SelectNodes("usage");
        for (var index = 0; index < goalNodes.Count; ++index) {
          var goal = goalNodes[index].InnerText;
          if (int.TryParse(usageNodes[index].InnerText, out int usage)) {
            computer.AddAssetUsage(username, goal, usage);
          }
        }
      }
    }

    //--------------------------------------------------------------------------
    private static void SendComputerActionEvent(ComponentBehavior computer, string action) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement(action, ""));

      IPCManagerScript.SendRequest(xml.ToString());
    }

    //--------------------------------------------------------------------------
    private void SendAssetMoveEvent(AssetBehavior asset, ComputerBehavior computer, bool add) {
      var xml = new XElement("assetEvent",
        new XElement("name", asset.Data.AssetName),
        new XElement("moveType", $"{(add ? "Add" : "Remove")} : PLAYER"),
        new XElement("computerName", computer.Data.component_name)
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }

    //--------------------------------------------------------------------------
    private void SendSoftwareChangeEvent(SoftwareBehavior software, ComputerBehavior computer, bool install) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement($"{(install ? "softwareAdd" : "softwareRemove")}", software.Data.name)
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }

    //--------------------------------------------------------------------------
    private void SendAccessEvent(ComputerBehavior computer, string eventType, string accountType, string accountName) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement(eventType,
          new XElement(accountType, accountName)
        )
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }

    //--------------------------------------------------------------------------
    private void SendAuthenticatedServerEvent(ComputerBehavior computer, string eventType, string serverName) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement(eventType, serverName)
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }

    //--------------------------------------------------------------------------
    private void SendCostEvent(int cost) {
      var xml = new XElement("userEvent",
        new XElement("cost", cost.ToString())
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}