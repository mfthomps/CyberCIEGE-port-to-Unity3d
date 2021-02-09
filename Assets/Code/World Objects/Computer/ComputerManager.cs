using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Software;
using Code.World_Objects.Asset;

namespace Code.World_Objects.Computer {
  //Handles some functionality for ComputerBehaviors
  public class ComputerManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object")]
    public GameObjectVariable selectedObject;

    //--------------------------------------------------------------------------
    public void OnScrapComputer(ComputerBehavior computer) {
      //Notify the game server this computer should be removed
      SendScrapEvent(computer);
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

    //--------------------------------------------------------------------------
    private static void SendScrapEvent(ComponentBehavior computer) {
      var xml = new XElement("componentEvent",
        new XElement("name", computer.Data.component_name),
        new XElement("sell", ""));

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
  }
}