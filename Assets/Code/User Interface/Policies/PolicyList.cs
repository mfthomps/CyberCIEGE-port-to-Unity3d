using System.Collections.Generic;
using UnityEngine.Events;
using UnityEngine;
using Code.Policies;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Policies {
  //Represents a UI List of Policy Items
  public class PolicyList : SelectableList<PolicyListItem, Policy> {
    [System.Serializable]
    public class ItemClickedEvent : UnityEvent<Policy> {}

    //Called when an Item in the list has been selected
    public ItemClickedEvent onItemClicked;

    [Tooltip("Prefab for creating policy groups")]
    public RectTransform policyGroupPrefab;
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
    protected override void OnItemAdded(Policy item, PolicyListItem itemUI) {
      base.OnItemAdded(item, itemUI);

      itemUI.onClicked += () => onItemClicked?.Invoke(item);

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
  }
}