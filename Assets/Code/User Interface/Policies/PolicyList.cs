using System.Collections.Generic;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.Game_Events;
using Code.Policies;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Policies {
  //Represents a UI List of Policy Items
  public class PolicyList : SelectableList<PolicyListItem, Policy> {
    [Tooltip("Prefab for creating policy groups")]
    public RectTransform policyGroupPrefab;
    [Header("Input Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;
    [Header("Output Events")]
    [Tooltip("Policy clicked event")]
    public PolicyGameEvent policyClicked;
    [Header("Customization")]
    [Tooltip("List of policies to display")]
    public PolicyListVariable policyList;
    [Tooltip("List of policy groups for organizing mutually exclusive policies")]
    public PolicyGroupListVariable mutuallyExclusivePolicyGroups;

    private Dictionary<PolicyGroup, RectTransform> _policyGroupUIs = new Dictionary<PolicyGroup, RectTransform>();

    //--------------------------------------------------------------------------
    void Awake() {
      SetItems(policyList.Value);
    }

    //--------------------------------------------------------------------------
    void OnEnable() {
      selectedObject.OnValueChanged += UpdatePolicies;
      UpdatePolicies();
    }

    //--------------------------------------------------------------------------
    void OnDisable() {
      selectedObject.OnValueChanged -= UpdatePolicies;
    }

    //--------------------------------------------------------------------------
    protected override void OnItemAdded(Policy item, PolicyListItem itemUI) {
      base.OnItemAdded(item, itemUI);

      itemUI.onClicked += () => {
        policyClicked?.Raise(item);
        UpdatePolicies();
      };

      // If this policy is part of a group, then move the UI into the group UI
      var policyGroup = mutuallyExclusivePolicyGroups.GetContainingPolicyGroup(item);
      if (policyGroup != null) {
        // If we don't have UI for this group yet, make one
        if (!_policyGroupUIs.ContainsKey(policyGroup)) {
          _policyGroupUIs.Add(policyGroup, Instantiate(policyGroupPrefab, contentArea));
        }
        itemUI.transform.SetParent(_policyGroupUIs[policyGroup]);
      }
    }

    //--------------------------------------------------------------------------
    private void UpdatePolicies() {
      // Get the list of policies that are enabled
      var enabledPolicies = new HashSet<string>();
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          enabledPolicies = computerBehavior.GetEnabledPolicies();
        }
      }

      // Run through and select the UI for each enabled policy
      foreach (var policy in policyList.Value) {
        var policyListItem = listItems[policy];
        policyListItem.SetInteractable(enabledPolicies.Count > 0);
        policyListItem.SetSelected(enabledPolicies.Contains(policy.GetName()));
      }
    }
 }
}