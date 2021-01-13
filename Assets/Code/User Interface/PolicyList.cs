using System;
using Shared.SEUI;
using UnityEngine.Events;

namespace Code.User_Interface {
  
  [Serializable]
  public class PolicyChangedEvent : UnityEvent<Policy.Policy, bool> {}
  
  //Represents a UI List of Policy Items
  public class PolicyList : DynamicList<PolicyListItem, (Policy.Policy, bool)> {
    //Called when a Policy in the list has been enabled or disabled
    public PolicyChangedEvent PolicyChanged;
    
    //--------------------------------------------------------------------------
    protected override void OnItemAdded((Policy.Policy, bool) item, PolicyListItem itemUI) {
      base.OnItemAdded(item, itemUI);
      itemUI.OnChanged += OnItemValueChanged;
    }

    //--------------------------------------------------------------------------
    private void OnItemValueChanged(Policy.Policy policy, bool ison) {
      PolicyChanged?.Invoke(policy, ison); 
    }
  }
}