using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Game_Events;
using Code.Scriptable_Variables;
using Code.User_Interface.Asset;
using Code.World_Objects.Asset;
using Code.World_Objects.Computer;

namespace Code.User_Interface.Components {
  public class ComponentView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of assets in the given scenario")]
    public AssetListVariable assets;
    [Tooltip("List of computers in the given scenario")]
    public ComputerListVariable computerListVariable;
    [Header("Output Events/Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;

    [Tooltip("The GameEvent to fire when a Computer should be scrapped")]
    [SerializeField] private ComputerGameEvent _scrapComputerGameEvent;
    [Tooltip("The GameEvent to fire when an asset should be assigned to the selected computer")]
    [SerializeField] private AssetGameEvent _assignAsset;
    [Tooltip("The GameEvent to fire when an asset should be unassigned from the selected computer")]
    [SerializeField] private AssetGameEvent _unassignAsset;
    
    [Header("UI Elements")]
    [Tooltip("List of computers to display")]
    public ComputerList computerList;
    [Tooltip("List of assets assigned to the selected computer")]
    public AssetList assignedAssetsList;
    [Tooltip("List of assets not assigned to the selected computer")]
    public AssetList unassignedAssetsList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      computerListVariable.OnValueChanged += UpdateComputerList;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateComputerList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      computerListVariable.OnValueChanged -= UpdateComputerList;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectComputer(ComputerBehavior computerBehavior) {
      selectedObject.Value = computerBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    public void ScrapSelectedComputer() {
      if (selectedObject.Value != null) {
        ComputerBehavior computer = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computer) {
          //Fire Event
          _scrapComputerGameEvent?.Raise(computer);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void AssignAsset(AssetBehavior asset) {
      _assignAsset?.Raise(asset);
      UpdateAssetsSettings(selectedObject.Value.GetComponent<ComputerBehavior>());
    }

    // ------------------------------------------------------------------------
    public void UnassignAsset(AssetBehavior asset) {
      _unassignAsset?.Raise(asset);
      UpdateAssetsSettings(selectedObject.Value.GetComponent<ComputerBehavior>());
    }

    // ------------------------------------------------------------------------
    private void UpdateComputerList() {
      computerList.SetItems(computerListVariable.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var computer in computerListVariable.Value) {
        if (computer != null) {
          computerList.SetSelected(computer, computer.gameObject == selectedObject.Value);
        }
      }

      if (selectedObject.Value != null) {
        DisplayComputerInformation(selectedObject.Value.GetComponent<ComputerBehavior>());
      }
      else {
        DisplayComputerInformation(null);
      }
    }

    // ------------------------------------------------------------------------
    private void DisplayComputerInformation(ComputerBehavior computer) {
      UpdateAssetsSettings(computer);
    }

    // ------------------------------------------------------------------------
    private void UpdateAssetsSettings(ComputerBehavior computer) {
      if (computer != null) {
        var computerDataObject = computer.Data as ComputerDataObject;
        var assignedAssets = new List<AssetBehavior>();
        var unassignedAssets = new List<AssetBehavior>();
        foreach (var asset in assets.Value) {
          if (computerDataObject.asset_list.Contains(asset.Data.AssetName)) {
            assignedAssets.Add(asset);
          }
          else {
            unassignedAssets.Add(asset);
          }
        }
        assignedAssetsList.SetItems(assignedAssets);
        unassignedAssetsList.SetItems(unassignedAssets);
      }
    }
  }
}
