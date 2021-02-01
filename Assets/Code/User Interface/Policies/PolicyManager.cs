using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;

namespace Code.Policies {
  public class PolicyManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    private static readonly string COMPONENT_EVENT = "componentEvent";
    private static readonly string COMPONENT_SETTING_FIELD = "procSetting";

    // ------------------------------------------------------------------------
    public void ToggleComputerPolicy(Policy policy) {
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
          SendPolicyUpdateServerMessage(COMPONENT_EVENT, COMPONENT_SETTING_FIELD, computerBehavior.Data.component_name, policy, true);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnComputerPolicyDisabled(Policy policy) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          SendPolicyUpdateServerMessage(COMPONENT_EVENT, COMPONENT_SETTING_FIELD, computerBehavior.Data.component_name, policy, false);
        }
      }
    }

    // ------------------------------------------------------------------------
    private void SendPolicyUpdateServerMessage(string eventName, string settingField, string objectName, Policy policy, bool isOn) {
      XElement xml = new XElement(eventName,
        new XElement("name", objectName),
        new XElement(settingField,
          new XElement("field", policy.GetName()),
          new XElement("value", isOn)),
        new XElement("cost", isOn ? policy.cost : policy.cost / 2));

      IPCManagerScript.SendRequest(xml.ToString());
    }
  }
}
