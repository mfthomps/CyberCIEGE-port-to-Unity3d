using System.Xml.Linq;
using UnityEngine;
using Shared.ScriptableVariables;
using Code.World_Objects.Zone;

namespace Code.Policies {
  public class PolicyManager : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    private static readonly string COMPONENT_EVENT = "componentEvent";
    private static readonly string COMPONENT_SETTING_FIELD = "procSetting";
    private static readonly string ZONE_EVENT = "zoneEvent";
    private static readonly string ZONE_SETTING_FIELD = "setting";

    // ------------------------------------------------------------------------
    public void TogglePolicy(Policy policy) {
      if (selectedObject.Value != null) {
        var computerBehavior = selectedObject.Value.GetComponent<ComputerBehavior>();
        if (computerBehavior != null) {
          computerBehavior.TogglePolicy(policy);
        }
        else {
          var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
          if (zoneBehavior != null) {
            zoneBehavior.TogglePolicy(policy);
          }
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
    public void OnZonePolicyEnabled(Policy policy) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          SendPolicyUpdateServerMessage(ZONE_EVENT, ZONE_SETTING_FIELD, zoneBehavior.Data.ZoneName, policy, true);
        }
      }
    }

    // ------------------------------------------------------------------------
    public void OnZonePolicyDisabled(Policy policy) {
      if (selectedObject.Value != null) {
        var zoneBehavior = selectedObject.Value.GetComponent<ZoneBehavior>();
        if (zoneBehavior != null) {
          SendPolicyUpdateServerMessage(ZONE_EVENT, ZONE_SETTING_FIELD, zoneBehavior.Data.ZoneName, policy, false);
        }
      }
    }

    // ------------------------------------------------------------------------
    private void SendPolicyUpdateServerMessage(string eventName, string settingField, string objectName, Policy policy, bool isOn) {
      XElement xml = new XElement(eventName,
        new XElement("name", objectName),
        new XElement(settingField,
          new XElement("field", policy.GetName()),
          new XElement("value", isOn))
      );

      IPCManagerScript.SendRequest(xml.ToString());

      // TODO: Remove this once server handles policy refunds correctly
      // If this policy can be refunded and we disabled it, we have to undo
      // the cost from the server for disabling it AND for enabling it
      if (policy.canGetRefund && !isOn) {
        var costXML = new XElement("userEvent",
          new XElement("cost", -policy.cost * 1.5)
        );

        IPCManagerScript.SendRequest(costXML.ToString());
      }
    }
  }
}
