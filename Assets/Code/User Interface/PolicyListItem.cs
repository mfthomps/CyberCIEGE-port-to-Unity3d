using Shared.SEUI;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Code.User_Interface {
  //Represents a single Policy UI element.
  public class PolicyListItem : DynamicListItem<(Policy.Policy, bool)> {
    [Tooltip("The element that should display the item's label string.")]
    [SerializeField] private TMP_Text labelUI;

    [Tooltip("The Toggle object which stores the enabled/disabled state of a Policy")]
    [SerializeField] private Toggle toggle;

    public delegate void OnPolicyValueChanged(Policy.Policy policy, bool isOn);

    //This is called when a single Policy's enabled state changes.
    public OnPolicyValueChanged OnChanged;
    
    private Policy.Policy _policy;

    //-------------------------------------------------------------------------
    public override void SetItem((Policy.Policy, bool) policyItem) {
      labelUI.text = policyItem.Item1.Name;
      toggle.isOn = policyItem.Item2;
      _policy = policyItem.Item1;
    }

    //-------------------------------------------------------------------------
    public void OnValueChanged(bool isOn) {
      OnChanged?.Invoke(_policy, isOn);
    }
  }
}