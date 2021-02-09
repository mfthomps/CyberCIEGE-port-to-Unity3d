using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using TMPro;
using Code.Scriptable_Variables;
using Code.World_Objects.Asset;

namespace Code.User_Interface.Asset {
  public class AssetView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of assets in the given scenario")]
    public AssetListVariable assetListVariable;
    [Header("Output Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;

    [Header("UI Elements")]
    [Tooltip("List of assets to display")]
    public AssetList assetList;
    [Tooltip("Text to display an asset's description")]
    public TMP_Text descriptionText;
    [Tooltip("GameObject for assigned computer section")]
    public GameObject assignedComputerSection;
    [Tooltip("Text to display an asset's assigned computer")]
    public TMP_Text assignedComputerText;
    [Tooltip("GameObject for clearance section")]
    public GameObject clearanceSection;
    [Tooltip("List of security clearances for an asset")]
    public StringList clearanceList;
    [Tooltip("GameObject for discretionary access control section")]
    public GameObject dacSection;
    [Tooltip("List of discretionary access control groups for an asset")]
    public AssetDACList dacList;

    // ------------------------------------------------------------------------
    void OnEnable() {
      assetListVariable.OnValueChanged += UpdateAssetList;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateAssetList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      assetListVariable.OnValueChanged -= UpdateAssetList;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectAsset(AssetBehavior assetBehavior) {
      selectedObject.Value = assetBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    private void UpdateAssetList() {
      // Only show assets that have anything that can access them
      assetList.SetItems(assetListVariable.Value.FindAll(asset => asset.Data.DACAccessors.Count > 0));
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var asset in assetListVariable.Value) {
        if (asset != null) {
          assetList.SetSelected(asset, asset.gameObject == selectedObject.Value);
        }
      }

      if (selectedObject.Value != null) {
        DisplayAssetInformation(selectedObject.Value.GetComponent<AssetBehavior>());
      }
      else {
        DisplayAssetInformation(null);
      }
    }

    // ------------------------------------------------------------------------
    private void DisplayAssetInformation(AssetBehavior asset) {
      descriptionText.text = asset != null ? asset.Data.description : "";
      if (asset != null) {
        assignedComputerText.text = asset.Data.Computer != null ? asset.Data.Computer.Data.component_name : "No Computer";
        clearanceList.SetItems(GetSecurityClearances(asset));
        dacList.SetItems(asset.Data.DACAccessors);
      }
      else {
        assignedComputerText.text = "";
        clearanceList.ClearItems();
        dacList.ClearItems();
      }

      // Hide sections that have no content in them
      assignedComputerSection.SetActive(!string.IsNullOrEmpty(assignedComputerText.text));
      clearanceSection.SetActive(clearanceList.listItems.Count > 0);
      dacSection.SetActive(dacList.listItems.Count > 0);
    }

    // ------------------------------------------------------------------------
    private List<string> GetSecurityClearances(AssetBehavior asset) {
      var clearances = new List<string>();

      AddClearance(clearances, asset.Data.secrecy);
      AddClearance(clearances, asset.Data.integrity);

      return clearances;
    }

    // ------------------------------------------------------------------------
    public void AddClearance(List<string> list, string value) {
      if (!string.IsNullOrEmpty(value)) {
        list.Add(value);
      }
    }
  }
}
