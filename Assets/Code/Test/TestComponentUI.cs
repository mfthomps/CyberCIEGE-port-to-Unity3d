using UnityEngine;
using Shared.ScriptableVariables;
using Code.Policies;
using Code.Software;
using Code.User_Interface.Components;
using Code.World_Objects.Asset;
using Code.World_Objects.Computer;

namespace Code.Test {
  public class TestComponentUI : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    void OnDestroy() {
      selectedObject.Reset();
    }

    //--------------------------------------------------------------------------
    public void OnScrapComputer(ComputerBehavior computer) {
      Debug.Log($"Scrap computer: {computer.Data.component_name}");
    }

    //--------------------------------------------------------------------------
    public void OnScanComputer(ComputerBehavior computer) {
      Debug.Log($"Scan computer: {computer.Data.component_name}");
    }

    //--------------------------------------------------------------------------
    public void OnDiagnoseComputer(ComputerBehavior computer) {
      Debug.Log($"Diagnose computer: {computer.Data.component_name}");
    }

    //--------------------------------------------------------------------------
    public void OnReimageComputer(ComputerBehavior computer) {
      Debug.Log($"Reimage computer: {computer.Data.component_name}");
    }

    //--------------------------------------------------------------------------
    public void OnReplaceComputerDrive(ComputerBehavior computer) {
      Debug.Log($"Replace Computer Drive for computer: {computer.Data.component_name}");
    }

    // ------------------------------------------------------------------------
    public void TogglePolicy(Policy policy) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.TogglePolicy(policy);
      }
    }

    // ------------------------------------------------------------------------
    public void OnComputerPolicyEnabled(Policy policy) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        Debug.Log($"Policy {policy.GetName()} enabled for {computerBehavior.Data.component_name}");
      }
    }

    // ------------------------------------------------------------------------
    public void OnComputerPolicyDisabled(Policy policy) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        Debug.Log($"Policy {policy.GetName()} disabled for {computerBehavior.Data.component_name}");
      }
    }

    // ------------------------------------------------------------------------
    public void AssignAsset(AssetBehavior asset) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        // If this asset had a previously assigned computer, remove it from the computer's asset list
        if (asset.Data.Computer != null) {
          asset.Data.Computer.RemoveAsset(asset);
        }

        asset.SetComputer(computerBehavior);
        computerBehavior.AddAsset(asset);
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
        }
      }
    }

    // ------------------------------------------------------------------------
    public void AddSoftware(SoftwareBehavior software) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.AddSoftware(software);
      }
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(SoftwareBehavior software) {
      var computerBehavior = GetSelectedComputer();
      if (computerBehavior != null) {
        computerBehavior.RemoveSoftware(software);
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
        computerBehavior.ToggleAuthenticatingServer(serverName);
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
    private ComputerBehavior GetSelectedComputer() {
      if (selectedObject.Value != null) {
        return selectedObject.Value.GetComponent<ComputerBehavior>();
      }
      return null;
    }
  }
}
