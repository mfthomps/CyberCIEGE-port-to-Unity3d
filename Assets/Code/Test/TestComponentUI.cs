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

    // ------------------------------------------------------------------------
    public void TogglePolicy(Policy policy) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          computerBehavior.TogglePolicy(policy);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnComputerPolicyEnabled(Policy policy) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          Debug.Log($"Policy {policy.GetName()} enabled for {computerBehavior.Data.component_name}");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnComputerPolicyDisabled(Policy policy) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          Debug.Log($"Policy {policy.GetName()} disabled for {computerBehavior.Data.component_name}");
        }
      }
    }

    // ------------------------------------------------------------------------
    public void AssignAsset(AssetBehavior asset) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          // If this asset had a previously assigned computer, remove it from the computer's asset list
          if (asset.Data.Computer != null) {
            asset.Data.Computer.RemoveAsset(asset);
          }

          asset.SetComputer(computerBehavior);
          computerBehavior.AddAsset(asset);
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
        }
      }
    }

    // ------------------------------------------------------------------------
    public void RemoveSoftware(SoftwareBehavior software) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          computerBehavior.RemoveSoftware(software);
        }
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
  }
}
