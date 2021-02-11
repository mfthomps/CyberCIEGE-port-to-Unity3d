using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Game_Events;
using Code.Software;
using Code.User_Interface.Components;
using Code.User_Interface.Main;
using Code.World_Objects.Asset;

namespace Code.World_Objects.Computer {
  //Handles some functionality for ComputerBehaviors
  public class ComputerManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object")]
    public GameObjectVariable selectedObject;
    [Header("Output Events")]
    [Tooltip("Event to open confirmation diallog")]
    public ConfirmationRequestGameEvent getConfirmation;

    private static int REIMAGE_COST = 500;
    private static int REPLACE_DRIVE_COST = 1000;

    //--------------------------------------------------------------------------
    public void OnScrapComputer(ComputerBehavior computer) {
      //Notify the game server this computer should be removed
      SendComputerActionEvent(computer, "sell");
    }

    //--------------------------------------------------------------------------
    public void OnScanComputer(ComputerBehavior computer) {
      // Notify the game server this computer should be scanned
      SendComputerActionEvent(computer, "scan");
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
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
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
    }

    // ------------------------------------------------------------------------
    public void UnassignAsset(AssetBehavior asset) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          // Make sure the asset in question was actually assigned to the selected computer
          if (asset.Data.Computer == computerBehavior) {
            computerBehavior.RemoveAsset(asset);
            asset.SetComputer(null);
            SendAssetMoveEvent(asset, computerBehavior, false);
          }
        }
      }
    }

    // ------------------------------------------------------------------------
    public void AddSoftware(SoftwareBehavior software) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          computerBehavior.AddSoftware(software);
          SendSoftwareChangeEvent(software, computerBehavior, true);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(SoftwareBehavior software) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          computerBehavior.RemoveSoftware(software);
          SendSoftwareChangeEvent(software, computerBehavior, false);
        }
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
    private void SendCostEvent(int cost) {
      var xml = new XElement("userEvent",
        new XElement("cost", cost.ToString())
      );

      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}