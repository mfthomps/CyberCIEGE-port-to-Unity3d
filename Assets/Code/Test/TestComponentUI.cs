using UnityEngine;
using Shared.ScriptableVariables;
using Code.Policies;

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
  }
}
